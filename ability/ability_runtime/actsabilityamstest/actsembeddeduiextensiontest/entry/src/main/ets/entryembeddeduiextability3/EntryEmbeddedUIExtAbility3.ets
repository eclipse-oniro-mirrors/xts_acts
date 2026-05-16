import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import { commonEventManager } from '@kit.BasicServicesKit';

const tag: string = 'embed3'

export default class EntryEmbeddedUIExtAbility3 extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(0x0000, tag, `onCreate`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: 'onCreate'
      }
    }
    commonEventManager.publish('EmbeddedAbility3', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbility3 publish: ${JSON.stringify(error)}`);
    })
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', `onForeground`)
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', `onBackground`)
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', `onDestroy`)
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    session.loadContent('entryembeddeduiextability3/pages/EntryEmbeddedUIExtAbility3Page', storage);
    hilog.info(0x0000, 'testTag', `onSessionCreate done`)
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    hilog.info(0x0000, 'testTag', `onSessionDestroy`)
  }
}
