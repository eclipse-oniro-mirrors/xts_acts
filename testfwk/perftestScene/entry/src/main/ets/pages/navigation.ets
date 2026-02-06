// Index.ets
@Component
struct Page01 {

  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Button('push Page01')
        .width('80%')
        .onClick(() => {
          this.pageInfos.pushPathByName('Page01', '');
        })
        .margin({top: 10, bottom: 10})
      Button('push Dialog01')
        .width('80%')
        .onClick(() => {
          this.pageInfos.pushPathByName('Dialog01', '');
        })
        .margin({top: 10, bottom: 10})
    }
    .title('Page01')
  }
}

@Component
struct Dialog01 {

  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Stack() {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Gray)
          .opacity(0.1)
          .onClick(() => {
            this.pageInfos.pop();
          })
        // Add controls for business processing
        Column() {
          Text('Dialog01')
            .fontSize(30)
            .fontWeight(2)
          Button('push Page01')
            .width('80%')
            .onClick(() => {
              this.pageInfos.pushPathByName('Page01', '');
            })
            .margin({top: 10, bottom: 10})
          Button('push Dialog01')
            .width('80%')
            .onClick(() => {
              this.pageInfos.pushPathByName('Dialog01', '');
            })
            .margin({top: 10, bottom: 10})
          Button('pop')
            .width('80%')
            .onClick(() => {
              this.pageInfos.pop();
            })
            .margin({top: 10, bottom: 10})
        }
        .padding(10)
        .width(250)
        .backgroundColor(Color.White)
        .borderRadius(10)
      }
    }
    .hideTitleBar(true)
    // Set the mode property of this NavDestination to DIALOG
    .mode(NavDestinationMode.DIALOG)
  }
}

@Entry
@Component
struct Index {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: string) {
    if (name == 'Page01') {
      Page01()
    } else if (name == 'Dialog01') {
      Dialog01()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('push Page01')
        .width('80%')
        .onClick(() => {
          this.pageInfos.pushPathByName('Page01', '');
        })
    }
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .title('主页')
    .navDestination(this.PagesMap)
  }
}
