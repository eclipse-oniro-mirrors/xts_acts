import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

@Entry
@Component
struct HostInstance {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility HostInstance aboutToAppear');

  }

  @State message: string = 'ni'
  private want1: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EntryEmbeddedUIExtAbilityInstance',
    moduleName: 'entry_test',
    parameters: {
      'ohos.extension.processMode.hostSpecified': 'com.example.act_embeddeduiextension:embeddedUI'
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent(this.want1, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error: BusinessError) => {
            let commonEventPublishData: commonEventManager.CommonEventPublishData = {
              parameters: {
                data: error.code
              }
            }
            commonEventManager.publish('Start_Fail', commonEventPublishData, async (error) => {
              hilog.info(0x0000, 'testTag1', '%{public}s', `HostInstance6 publish: ${JSON.stringify(error)}`);
            })
            this.message = 'Error: code = ' + error.code;
            console.log('EmbeddedAbility4', JSON.stringify(error))
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}