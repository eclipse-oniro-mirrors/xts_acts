import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';


const TAG: string = '[ExampleEmbeddedAbilityDefault]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: 'onCreate'
      }
    }
    commonEventManager.publish('EmbeddedAbility_same_Default', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbilityDefault publish: ${JSON.stringify(error)}`);
    })
  }

  onForeground() {
    console.log(TAG, `onForeground`);
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', `onBackground`)
  }

  async onDestroy() {
    console.log(TAG, `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let storage: LocalStorage = new LocalStorage(param);
    session.loadContent('pages/DefaultPage', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}