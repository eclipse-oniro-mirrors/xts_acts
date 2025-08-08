import { HalfScreenLaunchComponent, LaunchController } from '@kit.ArkUI';

@Entry
@Component
struct HalfScreenLaunchComponentTest {
  appId: string = '5765880207853275489'; //手机充值
  controller: LaunchController = new LaunchController();
  build() {
    Column() {
      HalfScreenLaunchComponent({
        content: this.ColumChild,
        appId:this.appId,
        options: {},
        onTerminated:  (info:TerminationInfo)=>{
        console.log('onTerminated info = '+info.want);
        },
        onError: (err) => {
          console.error(' onError code: ' + err.code + ', message: ', err.message);
        },
        onReceive: (data) => {
          console.info('onReceive, data: ' + data['ohos.atomicService.window']);
        }
      }).width('100%').height('80vp')
    }
  }
  @Builder
  ColumChild() {
    Column() {
      Image($r('app.media.icon')).height(80).width(80)
      TextArea({text:'launch atomicservice'}).width(300)
    }.width('100%').height(100)
  }
}