import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';


class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag sjd EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag sjd EntryAbility', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent entering');
        MyCallback.runCasesOfCallback();
        if (err && err.code) {
          hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent ok');
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent catch error：-----------' + e.message);
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}