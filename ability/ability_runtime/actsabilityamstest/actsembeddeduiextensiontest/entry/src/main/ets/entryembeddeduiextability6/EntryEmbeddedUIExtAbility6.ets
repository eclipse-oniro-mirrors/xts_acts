import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class EntryEmbeddedUIExtAbility6 extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(0x0000, 'testTag', `onCreate`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: 'default'
      }
    }
    commonEventManager.publish('default', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `onCreate publish: ${JSON.stringify(error)}`);
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
    session.loadContent('entryembeddeduiextability6/pages/EntryEmbeddedUIExtAbility6Page', storage);
    hilog.info(0x0000, 'testTag', `onSessionCreate done`)
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    hilog.info(0x0000, 'testTag', `onSessionDestroy`)
  }
}
