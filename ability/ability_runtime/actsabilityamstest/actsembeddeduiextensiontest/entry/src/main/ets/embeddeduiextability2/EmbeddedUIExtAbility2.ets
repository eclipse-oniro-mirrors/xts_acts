import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';

export default class EmbeddedUIExtAbility2 extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(0x0000, 'testTag', `onCreate`);
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
    session.loadContent('embeddeduiextability2/pages/EmbeddedUIExtAbility2Page', storage);
    hilog.info(0x0000, 'testTag', `onSessionCreate done`)
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    hilog.info(0x0000, 'testTag', `onSessionDestroy`)
  }
}
