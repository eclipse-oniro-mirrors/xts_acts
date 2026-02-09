import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

@Entry
@Component
struct Default {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility default aboutToAppear');

  }

  @State message: string = 'ni'
  private want: Want = {
    bundleName: 'com.example.assistappa',
    abilityName: 'EntryEmbeddedUIExtAbilityInstance',
    parameters: {}
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
            console.log('shuzi', JSON.stringify(EmbeddedType.EMBEDDED_UI_EXTENSION))
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('default ', JSON.stringify(error))
            let commonEventPublishData: commonEventManager.CommonEventPublishData = {
              parameters: {
                data: error.code
              }
            }
            commonEventManager.publish('ExtensionDefault', commonEventPublishData, async (error) => {
              hilog.info(0x0000, 'testTag1', '%{public}s', `Embeddedextension publish: ${JSON.stringify(error)}`);
            })
          })
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
            console.log('shuzi', JSON.stringify(EmbeddedType.EMBEDDED_UI_EXTENSION))
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('default ', JSON.stringify(error))
            let commonEventPublishData: commonEventManager.CommonEventPublishData = {
              parameters: {
                data: error.code
              }
            }
            commonEventManager.publish('ExtensionDefault', commonEventPublishData, async (error) => {
              hilog.info(0x0000, 'testTag1', '%{public}s', `Embeddedextension publish: ${JSON.stringify(error)}`);
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}