import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
let sessionGlobal: UIExtensionContentSession | undefined;
const DOMAIN = 0x0000;

export default class EntryEmbeddedUIExtAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(DOMAIN, 'testTag', `onCreate`);
  }

  onForeground() {
    hilog.info(DOMAIN, 'testTag', `onForeground`);
  }

  onBackground() {
    hilog.info(DOMAIN, 'testTag', `onBackground`);
    if (sessionGlobal != undefined) {
      sessionGlobal.terminateSelf();
    }else {
      console.log("sessionGlobal is undefined");
    }
  }

  onDestroy() {
    hilog.info(DOMAIN, 'testTag', `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    const storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    session.loadContent('entryembeddeduiextability/pages/EntryEmbeddedUIExtAbilityPage', storage);
    sessionGlobal = session;
    hilog.info(DOMAIN, 'testTag', `onSessionCreate done`);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
      // handle error
    });
    hilog.info(DOMAIN, 'testTag', `onSessionDestroy`);
  }
}
