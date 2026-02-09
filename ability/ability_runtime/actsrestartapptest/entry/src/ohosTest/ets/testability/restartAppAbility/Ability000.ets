import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';

const DOMAIN = 0x0000;
const caseName = 'SUB_Ability_AbilityRuntime_restartApp_0100';

export default class Ability000 extends EmbeddedUIExtensionAbility {
  onCreate(): void {
    hilog.info(DOMAIN, 'testTag', caseName + `Ability000 onCreate`);
  }

  onForeground(): void {
    hilog.info(DOMAIN, 'testTag', caseName + `Ability000 onForeground`);
  }

  onBackground(): void {
    hilog.info(DOMAIN, 'testTag', caseName + `Ability000 onBackground`);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', caseName + `Ability000 onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession): void {
    const storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    session.loadContent('testability/pages/Ability000Page', storage);
    hilog.info(DOMAIN, 'testTag', caseName + `Ability000 onSessionCreate done`);
  }

  onSessionDestroy(session: UIExtensionContentSession): void {
    session.terminateSelf().catch(() => {
    });
    hilog.info(DOMAIN, 'testTag', caseName + `Ability000 onSessionDestroy`);
  }
}
