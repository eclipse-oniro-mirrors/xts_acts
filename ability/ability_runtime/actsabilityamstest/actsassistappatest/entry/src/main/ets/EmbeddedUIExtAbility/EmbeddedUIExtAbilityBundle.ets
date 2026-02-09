import { EmbeddedUIExtensionAbility, ExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

import { bundleManager } from '@kit.AbilityKit';

const TAG: string = '[ExampleEmbeddedAbility]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {

    extensionAbilityType: bundleManager.ExtensionAbilityType.EMBEDDED_UI
    console.log(TAG, `onCreate`)
    hilog.info(0x0000, 'testTag', JSON.stringify(bundleManager.ExtensionAbilityType.EMBEDDED_UI))
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: JSON.stringify(bundleManager.ExtensionAbilityType.EMBEDDED_UI)
      }
    }
    commonEventManager.publish('Enum_Embedded_ui', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `onCreate publish: ${JSON.stringify(error)}`);
    })
  }

  onForeground() {
    console.log(TAG, `onForeground`);
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', `onBackground`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: '111'
      }
    }
    commonEventManager.publish('AbilityOnBackgroundA', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `onForeground publish: ${JSON.stringify(error)}`);
    })
  }

  onDestroy() {
    console.log(TAG, `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let storage: LocalStorage = new LocalStorage(param);
    session.loadContent('pages/BundlePage', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}