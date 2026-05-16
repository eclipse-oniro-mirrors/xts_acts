import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
let code: number = 0;

export default class HookAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    code = want.parameters!['startHookAbility'] as number;
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
    if (code == 1001) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'code is 1001');
      this.context.moveAbilityToBackground();
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
    this.context.revokeDelegator().then(() => {
      console.info('revokeDelegator success');
    }).catch((err: BusinessError) => {
      let want: Want = {
        bundleName: 'com.example.hookabilityhap',
        abilityName: 'EntryAbility'
      };
      let resultCode = err.code;
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };
      this.context.terminateSelfWithResult(abilityResult);
      console.error(`revokeDelegator failed, code is ${err.code}, message is ${err.message}`);
    });
  }
}
