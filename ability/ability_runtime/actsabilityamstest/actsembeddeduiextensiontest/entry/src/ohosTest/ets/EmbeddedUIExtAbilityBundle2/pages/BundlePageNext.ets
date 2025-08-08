import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

@Entry
@Component
struct BundlePages {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility BundlePage2 aboutToAppear');

  }
  @State message:string = 'ni'
  private want: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EmbeddedUIExtAbilityDefault',
    parameters: {
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
            console.log('bd2','success')
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('EmbeddedAbility',JSON.stringify(error),this.message)
            let commonEventPublishData: commonEventManager.CommonEventPublishData ={
              parameters:{
                data:error.code
              }
            }
            commonEventManager.publish('reason', commonEventPublishData, async (error) =>{
              hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbilitybd2 publish: ${JSON.stringify(error)}`);
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}