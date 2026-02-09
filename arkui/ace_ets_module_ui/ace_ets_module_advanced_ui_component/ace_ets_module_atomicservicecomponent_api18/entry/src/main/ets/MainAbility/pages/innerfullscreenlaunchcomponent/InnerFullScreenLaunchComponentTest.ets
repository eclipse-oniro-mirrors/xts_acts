import { InnerFullScreenLaunchComponent, LaunchController } from '@kit.ArkUI';

@Entry
@Component
struct InnerFullScreenLaunchComponentTest {

  @Builder
  ColumChild() {
    Column() {
      Text('InnerFullScreenLaunchComponent').fontSize(16).margin({top: 100})
      Button('start 日出日落')
        .onClick(()=>{
          let appId1: string = '5765880207854372375';
          this.controller.launchAtomicService(appId1, {});
        }).height(30).width('50%').margin({top: 50})
      Button('start 充值')
        .onClick(()=>{
          let appId2: string = '5765880207853275489';
          this.controller.launchAtomicService(appId2, {});
        }).height(30).width('50%').margin({top: 50})
    }.backgroundColor(Color.Pink).height('100%').width('100%')
  }
  controller: LaunchController = new LaunchController();

  build() {
    Column() {
      InnerFullScreenLaunchComponent({
          content: this.ColumChild,
          controller: this.controller,
          onReceive: (data) => {
            console.info('onReceive, data: ' + data['ohos.atomicService.window']);
          }
        })
    }
    .width('100%').height('100%')
  }
}