import { window } from '@kit.ArkUI';
import { display } from '@kit.ArkUI';

@Component
struct PortraitPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}) {
          Button('push LANDSCAPE page').onClick(() => {
            this.stack?.pushPath({name: 'landscape'})
          })
            .id('landscapeId').margin({bottom: '10vp'})
          Button('getPortraitPage').onClick(() => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getPortraitPage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate('testOrientation', displayClass?.orientation);
          }).id('getPortraitPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PortraitPage')
    .preferredOrientation(window.Orientation.PORTRAIT) // 竖屏方向
    .enableStatusBar(true) // 显示状态栏
    .enableNavigationIndicator(true) // 显示导航条
    .backgroundColor('#ffbaece9')
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct LandscapePage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}) {
          Button('push UnspecifiedPage page').onClick(() => {
            this.stack?.pushPath({ name: 'UNSPECIFIED' })
          })
            .id('unspecifiedId')
          Button('getLandscapePage').onClick(() => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getLandscapePage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate('testOrientation', displayClass?.orientation);
          }).id('getLandscapePage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('LandscapePage')
    .preferredOrientation(window.Orientation.LANDSCAPE) // 横屏方向
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct UnspecifiedPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}) {
          Button('push PORTRAIT_INVERTED page').onClick(() => {
            this.stack?.pushPath({ name: 'PORTRAIT_INVERTED' })
          })
            .id('portraitInvertedId')
          Button('getUnspecifiedPage').onClick(() => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            AppStorage.setOrCreate('testOrientation', displayClass?.orientation);
          }).id('getUnspecifiedPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('UnspecifiedPage')
    .preferredOrientation(window.Orientation.UNSPECIFIED)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct PortraitInvertedPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}) {
          Button('push LANDSCAPE_INVERTED page').onClick(() => {
            this.stack?.pushPath({ name: 'LANDSCAPE_INVERTED' })
          })
            .id('lanscapeInvertedId')
          Button('getPortraitInvertedPage').onClick(() => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getPortraitInvertedPage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate('testOrientation', displayClass?.orientation);
          }).id('getPortraitInvertedPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PortraitInvertedPage')
    .preferredOrientation(window.Orientation.PORTRAIT_INVERTED)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct LandscapInvertedPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}) {
          Button('push PORTRAIT page').onClick(() => {
            this.stack?.pushPath({ name: 'portrait' })
          })
            .id('portraitId')
          Button('getLandscapInvertedPage').onClick(() => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getLandscapInvertedPage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate('testOrientation', displayClass?.orientation);        
          }).id('getLandscapInvertedPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('LandscapInvertedPage')
    .preferredOrientation(window.Orientation.LANDSCAPE_INVERTED)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Entry
@Component
struct PreferredOrientation {
  private stack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.stack.pushPath({name: 'portrait'})
  }

  @Builder
  MyPageMap(name: string) {
    if (name === 'portrait') {
      PortraitPage()
    } else if (name === 'landscape') {
      LandscapePage()
    } else if (name === 'UNSPECIFIED') {
      UnspecifiedPage()
    } else if (name === 'PORTRAIT_INVERTED') {
      PortraitInvertedPage()
    } else if (name === 'LANDSCAPE_INVERTED') {
      LandscapInvertedPage()
    }
  }

  build() {
    Navigation(this.stack) {
    }
    .width('100%')
    .height('100%')
    .hideNavBar(true)
    .navDestination(this.MyPageMap)
  }
}