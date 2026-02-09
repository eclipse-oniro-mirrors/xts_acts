import { common, EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

import { bundleManager } from '@kit.AbilityKit';
const TAG: string = '[ExampleEmbeddedAbilityBundle]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: 'onCreate'
      }
    }
    commonEventManager.publish('EmbeddedAbility_same_bundle', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbility3 publish: ${JSON.stringify(error)}`);
    })
  }

  onForeground() {

    hilog.info(0x0000, 'testTag', `onForeground`)
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', `onBackground`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: '333'
      }
    }
    commonEventManager.publish('OnBackground1', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbility3 publish: ${JSON.stringify(error)}`);
    })
  }

  onDestroy() {

    hilog.info(0x0000, 'testTag', `onDestroy`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: '222'
      }
    }
    commonEventManager.publish('OnDestroy1', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbility4 publish: ${JSON.stringify(error)}`);
    })
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let storage: LocalStorage = new LocalStorage(param);
    session.loadContent('EmbeddedUIExtAbility/pages/BundlePage', storage);
      let abilityResult: common.AbilityResult = {
        resultCode: 0,
        want: {
          abilityName: 'EmbeddedUIExtAbilityBundle',
          parameters: {
            'result': 123456
          }
        }
      };
      session?.terminateSelfWithResult(abilityResult)
        .then(() => {
          console.info(`Successed in terminating self with result.`);
        })
        .catch((err: BusinessError) => {
          console.error(`Failed to terminate self with result, code: ${err.code}, msg: ${err.message}`);
        });
  }

  onSessionDestroy(session: UIExtensionContentSession) {

    console.log(TAG, `onSessionDestroy`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: '111'
      }
    }
    commonEventManager.publish('OnSessionDestroy1', commonEventPublishData, async (error) => {
      hilog.info(0x0000, 'testTag1', '%{public}s', `EmbeddedAbility5 publish: ${JSON.stringify(error)}`);
    })
  }
}