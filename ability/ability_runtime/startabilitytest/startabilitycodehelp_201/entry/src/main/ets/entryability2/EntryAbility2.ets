import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

export default class EntryAbility2 extends UIAbility {
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
    let tag = 'connectUIServiceExtensionAbility onBackground';
    let subscriber: commonEventManager.CommonEventSubscriber;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['connectUIServiceExtensionAbility_201']
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

      let dataCallBack: common.UIServiceExtensionConnectCallback = {
        // 接收数据
        onData: (data: Record<string, Object>) => {
          console.log(`dataCallBack received data`, JSON.stringify(data));
        },
        // 连接断开
        onDisconnect: () => {
          console.log(`dataCallBack onDisconnect`);
        }
      }
      if (mpEnable == 'true') {
        let startWant: Want = {
          bundleName: 'com.acts.myapplicationb_201',
          abilityName: 'UIServiceExtAbility',
        };
        this.context.connectUIServiceExtensionAbility(startWant,
          dataCallBack)
          .then((proxy: common.UIServiceProxy) => {
            console.log(`try to connectUIServiceExtensionAbility`, JSON.stringify(proxy));
          }).catch((err: Error) => {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;

          commonEventManager.publish('connectUIServiceExtensionAbility', {
            code: code
          }, (err) => {
            console.info('====>0200 ' + JSON.stringify(err));
          });
          console.log(`connectUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        });
      }

      commonEventManager.unsubscribe(subscriber);
    };
  }
}
