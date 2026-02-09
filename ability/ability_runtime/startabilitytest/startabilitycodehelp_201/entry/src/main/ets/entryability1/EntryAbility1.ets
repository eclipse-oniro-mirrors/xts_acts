import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

export default class EntryAbility1 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground111');
    let tag = 'startUIServiceExtensionAbility_201 onBackground';
    let subscriber: commonEventManager.CommonEventSubscriber;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['startUIServiceExtensionAbility_201']
    };
    commonEventManager.createSubscriber(subscribeInfo)
      .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        console.info(`${tag}-createSubscriber success`);
        subscriber = commonEventSubscriber;
        commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
      })
      .catch((err: BusinessError) => {
        console.error(`${tag} createSubscriber failed, code is ${err.code}, message is ${err.message}`);
      });
    let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
      console.info(`subscribeCallBack success1- ${data.data}`);

      let mpEnable = ''
      try {
        mpEnable = systemParameterEnhance.getSync('const.abilityms.enable_uiservice');
        console.info('mpEnable = ', mpEnable)
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }

      if (mpEnable == 'true') {
        let startWant: Want = {
          bundleName: 'com.acts.myapplicationb_201',
          abilityName: 'UIServiceExtAbility',
        };
        this.context.startUIServiceExtensionAbility(startWant)
          .then(() => {
            console.log(`try to startUIServiceExtensionAbility`);
          }).catch((err: Error) => {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          commonEventManager.publish('startUIServiceExtensionAbility', {code: code}, (err) => {
            console.info('====>startUIServiceExtensionAbility ' + JSON.stringify(err));
          });
          console.log(`startUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        });
      }

      commonEventManager.unsubscribe(subscriber);
    };
  }
}
