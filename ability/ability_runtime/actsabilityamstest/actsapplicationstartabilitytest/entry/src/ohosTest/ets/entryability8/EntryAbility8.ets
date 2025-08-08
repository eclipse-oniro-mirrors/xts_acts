import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {
  private onCreateFlag = false;
  private onWindowStageCreateFlag = false;
  private onForegroundFlag = false;
  private onBackgroundFlag = false;
  private onNewWantFlag = false;
  private onDestroyFlag = false;
  private onForegroundNumber = 0;
  private TEST_CASE_NAME = '';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', ' singleEntry Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onCreateFlag)}`);
    this.TEST_CASE_NAME = want.action as string;
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} singleEntry Ability onCreate`);
    this.onCreateFlag = true;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME}Ability ohosTest onDestroy`);
    this.onDestroyFlag = true;
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onWindowStageCreateFlag)}`);
    this.onWindowStageCreateFlag = true;
    let context: common.UIAbilityContext;
    context = getContext() as common.UIAbilityContext;
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag',
          `${this.TEST_CASE_NAME} Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '`);
        return;
      }
      hilog.info(0x0000, 'testTag', `${this.TEST_CASE_NAME} Succeeded in loading the content.`);
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability onWindowStageDestroy`);
  }

  onNewWant(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability onBackground`);
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability onForeground`);
    this.onForegroundFlag = true;
    this.onForegroundNumber = this.onForegroundNumber + 1
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onCreateFlag': this.onCreateFlag,
          'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
          'onForegroundFlag': this.onForegroundFlag
        }
      }
    }
    commonEventManager.publish(`${this.TEST_CASE_NAME}_onForegroundHap_1`, commonEventData,
      (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s',
          `onConnect ${this.TEST_CASE_NAME}, 50==: ${JSON.stringify(result)}`);
      });

    let want: Want = {
      deviceId: '', // deviceId为空表示本设备
      bundleName: 'com.example.actsapplicationstartabilitytest',
      abilityName: 'EntryAbility_7',
      action: this.TEST_CASE_NAME,
      parameters: {
        instanceKey: this.TEST_CASE_NAME
      }
    };
    this.context.startAbility(want).then((data) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Succeeded in starting EntryAbility_7  ${data}`);
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${this.TEST_CASE_NAME} Failed to start SpecifiedAbility. err.Code is ${err.code}  err.message is ${err.message}`);
    })
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability ohosTest onBackground`);
    this.onBackgroundFlag = true;
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onBackgroundFlag': this.onBackgroundFlag
        }
      }
    }
    commonEventManager.publish(`${this.TEST_CASE_NAME}_onBackgroundHap_1`, commonEventData, (result) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} onConnect, 50==: ${JSON.stringify(result)}`);
    });
    setTimeout(() => {
      this.context.terminateSelf();
    }, 1000)
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}