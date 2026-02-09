import { EmbeddedUIExtensionAbility, StartOptions, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = '[ExampleEmbeddedAbility0700]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`)
  }

  onForeground() {
    console.log(TAG, `onForeground`)
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', `onBackground`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: 'onBackground'
      }
    }
    commonEventManager.publish('EmbeddedAbility_same_Type', commonEventPublishData, async (error) => {
      hilog.info(0x0000, TAG, '%{public}s', `Type publish: ${JSON.stringify(error)}`);
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
    session.loadContent('pages/Index', storage);

    let want1: Want = {
      deviceId: '',
      bundleName: 'com.example.act_embeddeduiextension',
      abilityName: 'EntryAbilityd',
    }
    session.startAbility(want1, (err: BusinessError) => {
      if (err) {
        console.error(`${TAG}Failed to startAbility, code: ${err.code}, msg: ${err.message}`);
        return;
      }
      console.info(`${TAG}Successed in startAbility`);
    })
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}