import { commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let storage = LocalStorage.getShared()
const LOG_TAG: string = 'Second'

@Entry(storage)
@Component
struct Extension {
  @State message: string = 'EmbeddedUIExtensionAbility Index';
  private want: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EmbeddedUIExtAbility',
    parameters: {}
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width('100%')
        .height('90%')
        .onError((error) => {
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            parameters: {
              data: error.code
            }
          }
          commonEventManager.publish('EmbeddedUIExtension_Pull', commonEventPublishData, async (error) => {
            hilog.info(0x0000, LOG_TAG, '%{public}s', `pulling_up_fail: ${JSON.stringify(error)}`);
          })
          hilog.info(0x0000, LOG_TAG, 'embeddedUIExt onError: %{public}s', JSON.stringify(error));
        })
        .onTerminated((info) => {
          hilog.info(0x0000, LOG_TAG, 'embeddedUIExt onTerminated: %{public}s', JSON.stringify(info));
        })
    }.width('100%').height('100%')
  }
}