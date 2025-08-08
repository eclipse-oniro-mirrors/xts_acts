import { AtomicServiceNavigation, NavDestinationBuilder, AtomicServiceTabs, TabBarOptions, TabBarPosition } from '@kit.ArkUI';
import { MixMode, GradientAlpha, BackgroundTheme} from '@ohos.atomicservice.AtomicServiceNavigation'
@Entry
@Component
struct AtomicServiceNavigationTest {
  @State message: string = '主题';
  childNavStack: NavPathStack = new NavPathStack();
  @Builder
  tabContent1() {
    Text('first page')
      .onClick(() => {
        this.childNavStack.pushPath({ name: 'page one' })
      })
  }

  @Builder
  tabContent2() {
    Text('second page')
  }

  @Builder
  tabContent3() {
    Text('third page')
  }

  @Builder
  navigationContent() {
    AtomicServiceTabs({
      tabContents: [
        () => {
          this.tabContent1()
        },
        () => {
          this.tabContent2()
        },
        () => {
          this.tabContent3()
        }
      ],
      tabBarOptionsArray: [
        new TabBarOptions($r('sys.media.ohos_ic_public_phone'), '功能1'),
        new TabBarOptions($r('sys.media.ohos_ic_public_location'), '功能2', Color.Green, Color.Red),
        new TabBarOptions($r('sys.media.ohos_ic_public_more'), '功能3')
      ],
      tabBarPosition: TabBarPosition.BOTTOM,
      barBackgroundColor: $r('sys.color.ohos_id_color_bottom_tab_bg'),
      onTabBarClick: (index: Number) => {
        if (index == 0) {
          this.message = '功能1';
        } else if (index == 1) {
          this.message = '功能2';
        } else {
          this.message = '功能3';
        }
      }
    })
  }

  @Builder
  pageMap(name: string) {
    if (name === 'page one') {
      PageOne()
    } else if (name === 'page two') {
      PageTwo()
    }
  }

  build() {
    Row() {
      Column() {
        AtomicServiceNavigation({
          navigationContent: () => {
            this.navigationContent()
          },
          title: this.message,
          titleOptions: {
            isBlurEnabled: false
          },
          gradientBackground: {
            primaryColor: 'red',
            secondaryColor: 'green',
            backgroundTheme: BackgroundTheme.LIGHT,
            mixMode: MixMode.AVERAGE,
            alpha: GradientAlpha.OPACITY_100
          },
          navDestinationBuilder: this.pageMap,
          navPathStack: this.childNavStack,
          mode: NavigationMode.Stack
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
export struct PageOne {
  pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Button('Next')
        .onClick(() => {
          this.pageInfo.pushPath({ name: 'page two'})
        })
    }
    .title('PageOne')
    .onReady((context: NavDestinationContext) => {
      this.pageInfo = context.pathStack;
    })
  }
}

@Component
export struct PageTwo {
  pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Button('End')
    }
    .title('PageTwo')
    .onReady((context: NavDestinationContext) => {
      this.pageInfo = context.pathStack;
    })
  }
}
