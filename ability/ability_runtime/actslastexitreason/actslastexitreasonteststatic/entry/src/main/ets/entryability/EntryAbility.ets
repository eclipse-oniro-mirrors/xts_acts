import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement'

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    hilog.info(0x0000, 'testTag EntryAbility', 'launchParam: ' + JSON.stringify(launchParam));
    AppStorage.setOrCreate<AbilityConstant.LaunchParam>("launchParam",  launchParam);
    hilog.info(0x0000, 'testTag EntryAbility', 'launchParam.lastExitDetailInfo: ' + JSON.stringify(launchParam.lastExitDetailInfo));
    let Info = launchParam.lastExitDetailInfo as AbilityConstant.LastExitDetailInfo;
    AppStorage.setOrCreate<AbilityConstant.LastExitDetailInfo>("lastExitDetailInfo", Info);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      hilog.info(0x0000, 'testTag EntryAbility', 'onWindowStageCreate ok');
    });
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onDestroy');

  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackground');
  }
}