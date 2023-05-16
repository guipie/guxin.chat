import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/common/utils/utils.dart';
import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';

class QiniuUtil {
  static final Storage _storage = Storage(
    config: Config(
      // 通过自己的 hostProvider 来使用自己的 host 进行上传
      // hostProvider: HostProvider(),
      // 可以通过实现 cacheProvider 来自己实现缓存系统支持分片断点续传
      // cacheProvider: CacheProvider,
      // 如果你需要对网络请求进行更基础的一些操作，你可以实现自己的 HttpClientAdapter 处理相关行为
      // httpClientAdapter: HttpClientAdapter,
      // 设定网络请求重试次数
      retryLimit: 3,
    ),
  );
  static Future<String> saveFile(
    File file,
    FileType fileType, {
    bool isInsertDb = false,
    String? key,
    Function(double progress)? progressListener,
    Function(String path, int? fileId)? completeListener,
  }) async {
    try {
      if (fileType == FileType.image) {
        if (!GetUtils.isImage(file.path)) {
          Loading.waring("请上传正确图片");
          return Future.error("请上传正确图片");
        }
      } else if (fileType == FileType.video) {
        if (!GetUtils.isVideo(file.path)) {
          Loading.waring("请上传正确视频");
          return Future.error("请上传正确视频");
        }
      }
      key = key ?? dateFormat(null, fmt: "yyyyMM") + "/" + DateTime.now().millisecondsSinceEpoch.toString() + path.extension(file.path);
      int fileDbId = 0;
      return HttpUtil().post("/api/app/common/qiniu/token").then((value) async {
        final putController = PutController();
        if (isInsertDb) {
          var width = 0, height = 0;
          // 预先获取图片信息
          if (fileType == FileType.image) {
            Image image = Image.file(file);
            image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((ImageInfo info, bool _) {
              width = info.image.width;
              height = info.image.height;
            }));
          }
          fileDbId = (await HttpUtil().post(
            "/api/app/content/files",
            data: [
              {
                "Path": key,
                "ContentLength": await file.length(),
                "Width": width,
                "Height": height,
                "ContentType": lookupMimeType(file.path),
              }
            ],
          ))
              .data;
        }
        putController.addProgressListener((percent) {
          debugPrint("上传进度：$percent");
          if (progressListener != null) progressListener(percent);
          if (completeListener != null && percent >= 1) completeListener(key!, fileDbId);
        });
        putController.addSendProgressListener((percent) {
          debugPrint("请求进度：$percent");
        });
        var response = await _storage.putFile(file, value.data, options: PutOptions(controller: putController, key: key));
        debugPrint("response.rawData:${response.rawData.toString()}，key:${response.key}，hash:${response.hash}");
        return response.key ?? "";
      });
    } catch (e) {
      Logger.write("上传出错了$e");
      return "";
    }
  }
}
