import { HalfScreenLaunchComponent } from '@kit.ArkUI';

@Entry
@Component
struct HalfScreenLaunchComponentTest {
  appId: string = '5765880207853275489'; //手机充值

  build() {
    Column() {
      HalfScreenLaunchComponent({
        appId: this.appId,
        options: {},
        onTerminated:  (info:TerminationInfo)=> {
          console.log('onTerminated info = '+ info.want);
        },
        onError: (err) => {
          console.error(' onError code: ' + err.code + ', message: ', err.message);
        }
      }) {
        Column() {
          Image($r('app.media.app_icon'))
          Text('拉起手机充值')
        }.width('80vp').height('80vp').margin({bottom:30})
      } // 通过尾随必包形式传入content
    }
  }

}