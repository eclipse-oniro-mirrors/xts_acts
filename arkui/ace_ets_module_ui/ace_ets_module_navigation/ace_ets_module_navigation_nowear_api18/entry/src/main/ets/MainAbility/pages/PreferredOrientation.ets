import { window } from '@kit.ArkUI';

@Component
struct PortraitPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Button('push LANDSCAPE page').onClick(() => {
          this.stack?.pushPath({name: 'landscape'})
        })
          .id('landscapeId')
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
        Button('push UnspecifiedPage page').onClick(() => {
          this.stack?.pushPath({name: 'UNSPECIFIED'})
        })
          .id('unspecifiedId')
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
        Button('push PORTRAIT_INVERTED page').onClick(() => {
          this.stack?.pushPath({name: 'PORTRAIT_INVERTED'})
        })
          .id('portraitInvertedId')
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
        Button('push LANDSCAPE_INVERTED page').onClick(() => {
          this.stack?.pushPath({name: 'LANDSCAPE_INVERTED'})
        })
          .id('lanscapeInvertedId')
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
        Button('push PORTRAIT page').onClick(() => {
          this.stack?.pushPath({name: 'portrait'})
        })
        .id('portraitId')
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