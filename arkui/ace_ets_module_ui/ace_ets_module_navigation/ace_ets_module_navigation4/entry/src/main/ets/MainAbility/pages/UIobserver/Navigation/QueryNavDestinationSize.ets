import { uiObserver } from '@kit.ArkUI';

@Component
struct PageOneContent {
  @Consume('stack') stack: NavPathStack;

  build() {
    Column() {
      Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}) {
        Button('queryDestSize').onClick(() => {
          // 也可以主动获取NavDestination页面大小信息
          let info = this.queryNavDestinationInfo();
          console.info(`testTag destSize: ${(info && info.size) ? JSON.stringify(info.size) : 'NA'}`)
        })
        Button('pop').onClick(() => {
          this.stack.pop();
        }).height('10%').id('popId1')
      }
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct QuerySizePageOne {
  build() {
    NavDestination() {
      PageOneContent()
    }
    .title('pageOne')
  }
}

@Entry
@Component
struct QueryNavDestinationSize {
  @Provide('stack') stack: NavPathStack = new NavPathStack();

  @Builder
  MyPageMap(name: string) {
    if (name == 'pageOne') {
      QuerySizePageOne()
    }
  }

  destSizeCallback(info: uiObserver.NavDestinationInfo): void {
    console.info(`testTag destSize changeTo ${(info && info.size) ? JSON.stringify(info.size) : 'NA'}`)
    AppStorage.setOrCreate('navDestinationInfo', info);
  }

  build() {
    Navigation(this.stack) {
      Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}){
        Button('on').onClick(() => {
          this.getUIContext().getUIObserver().onNavDestinationSizeChange(this.destSizeCallback);
        }).height('10%').id('onId1')
        Button('off').onClick(() => {
          this.getUIContext().getUIObserver().offNavDestinationSizeChange(this.destSizeCallback);
        }).height('10%').id('offId1')
        Button('push').onClick(() => {
          this.stack.pushPathByName('pageOne', '')
        }).height('10%').id('pushId1')
      }
    }
    .width('100%')
    .height('100%')
    .navDestination(this.MyPageMap)
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
  }
}