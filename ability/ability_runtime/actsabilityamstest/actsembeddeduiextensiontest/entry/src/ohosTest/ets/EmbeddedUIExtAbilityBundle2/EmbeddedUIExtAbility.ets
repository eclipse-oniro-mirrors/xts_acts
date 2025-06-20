import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

import { bundleManager } from '@kit.AbilityKit';

const TAG: string = '[ExampleEmbeddedAbilityBundle2]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreatebd2===`)
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
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let storage: LocalStorage = new LocalStorage(param);
    session.loadContent('EmbeddedUIExtAbilityBundle2/pages/BundlePageNext', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}