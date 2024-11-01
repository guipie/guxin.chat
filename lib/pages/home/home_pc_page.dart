import 'package:chat_bot/base.dart';
import 'package:chat_bot/base/version_check.dart';
import 'package:chat_bot/components/td/tdesign_flutter.dart';
import 'package:chat_bot/module/chat/chat_list_page.dart';
import 'package:chat_bot/pages/aimodel/aimodel_page.dart';
import 'package:chat_bot/pages/home/home_viewmodel.dart';

import '../../const.dart';
import '../../constants/theme.dart';
import '../../module/services/services_page.dart';
import '../../module/setting/setting_page.dart';

class HomePcPage extends ConsumerStatefulWidget {
  const HomePcPage({super.key});

  @override
  ConsumerState createState() => _HomePcPageState();
}

class _HomePcPageState extends ConsumerState<HomePcPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VersionCheck().checkLastedVersion(context);
    });
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    var brightness = View.of(context).platformDispatcher.platformBrightness;

    if (SpUtil.getInt(spLightTheme, defValue: ThemeType.system.index) !=
        ThemeType.system.index) {
      return;
    }

    if (brightness == Brightness.dark) {
      ref.read(themeProvider.notifier).change(ThemeType.system.index);
    } else {
      ref.read(themeProvider.notifier).change(ThemeType.system.index);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = ref.watch(homeIndexProvider);
    final pageController = PageController(initialPage: 0);
    final sideBarController = TDSideBarController();
    const pages = [
      ChatListPage(),
      AiModelPage(),
      ServicesPage(),
      SettingPage(),
      SettingPage(),
    ];
    return Scaffold(
      extendBody: true,
      body: Row(
        children: [
          Container(
            width: 60,
            height: F.height,
            color: F.T.colorScheme.onPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                10.height(),
                const TDAvatar(
                  text: "A",
                  size: TDAvatarSize.small,
                  shape: TDAvatarShape.square,
                ),
                TDSideBar(
                  height: F.height / 2,
                  style: TDSideBarStyle.outline,
                  value: currentIndex,
                  selectedColor: Theme.of(context).primaryColor,
                  controller: sideBarController,
                  children: menus
                      .map(
                        (ele) => TDSideBarItem(
                          value: ele.index,
                          checkedIcon: ele.checkedIcon,
                          icon: ele.icon,
                        ),
                      )
                      .toList(),
                  onSelected: (value) {
                    ref
                        .read(homeIndexProvider.notifier)
                        .update((state) => value);
                    pageController.jumpToPage(value);
                  },
                  contentPadding:
                      const EdgeInsets.only(left: 36, top: 16, bottom: 16),
                ),
                Expanded(child: 10.height()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
              ),
            ),
          )
        ],
      ),
    );
  }
}