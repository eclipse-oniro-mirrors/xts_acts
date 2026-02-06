import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';

class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 entering');
        if (err && err.code) {
          hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 ok');
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 catch error：-----------' + e.message);
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onDestroy');
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onForeground');
    let abilityResult: common.AbilityResult = {
      resultCode: 111,
      want: {
        bundleName: 'com.acts.openlinktest,static',
        moduleName: 'entry',
        abilityName: 'EntryAbility2'
      },
    };
    setTimeout(async () => {
      this.context.terminateSelfWithResult(abilityResult, (err: BusinessError<void> | null) => {
        if (err?.code !== 0) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'secondAbility terminateSelf errCode:' + JSON.stringify(err?.code) +
            'errMessage:' + JSON.stringify(err?.message));
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', 'secondAbility terminateSelf sucess');
        }
      })
    }, 300);
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onBackground');
  }

  onWindowStageWillDestroy(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageWillDestroy');
  }
}