import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/app/global_widgets/common_widget.dart';
import 'package:juai_flutter/app/global_widgets/refresh/constructor.dart';
import 'package:juai_flutter/generated/locales.g.dart';

import '../controllers/conversation_controller.dart';

class ConversationView extends GetView<ConversationController> {
  const ConversationView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ConversationController());
    return Scaffold(
        appBar: JuAppBar(
          text: LocaleKeys.app_chat.tr,
          actions: [
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset("images/home/search.svg"),
            ),
            IconButton(
              onPressed: () {
                //Scaffold.of(context).showBottomSheet((context) => null);
                controller.showMenu();
              },
              icon: SvgPicture.asset("images/home/plus.svg"),
            ),
          ],
        ),
        body: SpeedyPagedList(
          controller: controller,
          loadingPlaceholderView: (context) => getLoadingView(),
          itemBuilder: (context, index, chat) {
            return InkWell(
              onTap: null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  children: [
                    chat.portrait != null
                        ? getOnlineBox(
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.r),
                              child: ImageFiltered(
                                imageFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.color,
                                ),
                                enabled: !chat.online,
                                child: Image.asset(
                                  chat.portrait!,
                                  fit: BoxFit.cover,
                                  width: 52.w,
                                  height: 50.w,
                                  cacheWidth: 200,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 52.w,
                                      height: 50.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.r),
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                      child: Text(
                                        chat.localPortrait ?? "",
                                        style: TextStyle(fontSize: 11.sp, color: Colors.white),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            online: chat.online,
                          )
                        : Container(
                            width: 52.w,
                            height: 50.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            child: Text(
                              chat.localPortrait ?? "",
                              style: TextStyle(fontSize: 11.sp, color: Colors.white),
                            ),
                          ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (chat.name ?? "") + (index + 1).toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          10.verticalSpace,
                          Text(
                            chat.msg ?? "",
                            maxLines: 1,
                            style: Theme.of(Get.context!).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          chat.timestamp ?? "",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        10.verticalSpace,
                        chat.unread != 0 ? getCountBox(chat.unread) : const SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}