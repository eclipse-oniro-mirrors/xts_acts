import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';
import { Hypium } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testsuite from '../../src/test/List.test';
import common from '@ohos.app.ability.common';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
class MyAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      hilog.info(0x0000, 'testTag', 'MyAbility EntryAbility onCreate');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
      abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
      if (abilityDelegatorArguments != undefined) {
        hilog.info(0x0000, 'testTag', ' abilityDelegatorArguments is not undefined');
      } else {
        hilog.info(0x0000, 'testTag', ' abilityDelegatorArguments is undefined');
      }
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      hilog.info(0x0000, 'testTag', '%{public}s', 'onCreate end');
    } catch (err) {
      hilog.error(0x0000, 'testTag', ' onCreate err: ' + err);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'MyAbility EntryAbility onWindowStageCreate');
    try {
      let pathDir = this.context.filesDir
      Hypium.set('pathDir', pathDir)
      Hypium.set('Context', this.context)
      hilog.info(0x0000, 'testTag', ' set pathDir: ' + pathDir);
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        MyCallback.runCasesOfCallback();
        if (err?.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }

  onBackground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}