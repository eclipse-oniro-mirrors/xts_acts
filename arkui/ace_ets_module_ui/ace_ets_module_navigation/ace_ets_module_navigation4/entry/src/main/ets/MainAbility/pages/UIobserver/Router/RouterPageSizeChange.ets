import { uiObserver } from '@kit.ArkUI';

function myPageRouterPageSizeCallback(info: uiObserver.RouterPageInfo): void {
  console.info(`testTag pageSize changeTo ${(info && info.size) ? JSON.stringify(info.size) : 'NA'}`);
  AppStorage.SetOrCreate('info', info);
}

@Entry
@Component
struct RouterPageSizeChange {

  aboutToAppear(): void {
    // 可以通过注册监听的方式获取页面大小信息
    this.getUIContext().getUIObserver().onRouterPageSizeChange(myPageRouterPageSizeCallback);
  }

  aboutToDisappear(): void {
    this.getUIContext().getUIObserver().offRouterPageSizeChange(myPageRouterPageSizeCallback);
  }

  build() {
    Column() {
      Button('on').onClick(() => {
        this.getUIContext().getUIObserver().onRouterPageSizeChange(myPageRouterPageSizeCallback);
      }).id('onId').height('10%').margin({top: '5%'});
      Button('off').onClick(() => {
        this.getUIContext().getUIObserver().offRouterPageSizeChange(myPageRouterPageSizeCallback);
      }).id('offId').height('10%');
      Button('push').onClick(() => {
        this.getUIContext().getRouter().pushUrl({url:'MainAbility/pages/UIobserver/Router/ChangePage'})
      }).id('pushId').height('10%');
      Button('querySize').onClick(() => {
        // 也可以主动获取页面大小信息
        let info: RouterPageInfo | undefined = this.queryRouterPageInfo();
        let size: Size | undefined = info?.size;
        console.info(`testTag pageSize info: ${info ? JSON.stringify(info) : 'NA'}`)
        console.info(`testTag pageSize: ${size ? JSON.stringify(size) : 'NA'}`)
      }).height('10%');
    }
    .width('100%')
    .height('100%')
  }
}