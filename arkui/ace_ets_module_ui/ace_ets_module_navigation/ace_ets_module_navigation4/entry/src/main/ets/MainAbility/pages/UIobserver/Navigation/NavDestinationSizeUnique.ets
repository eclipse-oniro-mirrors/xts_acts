import { uiObserver } from '@kit.ArkUI';

function destSizeCallback(info: uiObserver.NavDestinationInfo): void {
  console.info(`testTag destSize changeTo ${(info && info.size) ? JSON.stringify(info.size) : 'NA'}`)
  AppStorage.SetOrCreate('uniqueNavDestinationInfo', info);
}

@Component
struct SizeUniquePageOne {
  @Consume('stack') stack: NavPathStack;
  private navUniqueId: number = 0;
  @State pageOneWidth:string='100%';
  @State pageOneHeight:string='100%';

  aboutToAppear(): void {
    let info = this.queryNavigationInfo();
    if (info) {
      this.navUniqueId = (info.uniqueId != undefined && info.uniqueId != null) ? info.uniqueId : -1;
      console.log(`testTag navigationUniqueId: ${this.navUniqueId}`)
    }
  }

  build() {
    NavDestination() {
      Column({space: 2}) {
        Button('on').onClick(() => {
          this.getUIContext().getUIObserver().onNavDestinationSizeChangeByUniqueId(this.navUniqueId, destSizeCallback);
        }).height('5%').id('onId')

        Button('off').onClick(() => {
          this.getUIContext().getUIObserver().offNavDestinationSizeChangeByUniqueId(this.navUniqueId, destSizeCallback);
        }).height('5%').id('offId')

        Button('onUn').onClick(() => {
          this.getUIContext().getUIObserver().onNavDestinationSizeChangeByUniqueId(undefined, destSizeCallback);
        }).height('5%').id('onUnId')

        Button('offUn').onClick(() => {
          this.getUIContext().getUIObserver().offNavDestinationSizeChangeByUniqueId(undefined, destSizeCallback);
        }).height('5%').id('offUnId')

        Button('onNull').onClick(() => {
          this.getUIContext().getUIObserver().onNavDestinationSizeChangeByUniqueId(null, destSizeCallback);
        }).height('5%').id('onNullId')

        Button('offNUll').onClick(() => {
          this.getUIContext().getUIObserver().offNavDestinationSizeChangeByUniqueId(null, destSizeCallback);
        }).height('5%').id('offNullId')

        Button('pop').onClick(() => {
          this.stack.pop();
        }).height('5%').id('popId')

        Button('changeSize')
          .onClick(() => {
            this.pageOneWidth='50%';
            this.pageOneHeight='50%';
          }).height('5%').id('changeSizeId')
      }
    }
    .title('pageOne')
    .width(this.pageOneWidth)
    .height(this.pageOneHeight)
  }
}

@Entry
@Component
struct NavDestinationSizeUnique {
  @Provide('stack') stack: NavPathStack = new NavPathStack();

  @Builder
  MyPageMap(name: string) {
    SizeUniquePageOne()
  }

  build() {
    Navigation(this.stack) {
      Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}){
        Button('push').onClick(() => {
          this.stack.pushPathByName('pageOne', '')
        }).height('10%').id('pushId')
      }
    }
    .width('100%')
    .height('100%')
    .navDestination(this.MyPageMap)
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
  }
}