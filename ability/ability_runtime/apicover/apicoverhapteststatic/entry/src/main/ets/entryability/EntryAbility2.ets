import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent ok');
      hilog.info(0x0000, 'testTag EntryAbility2', 'onWindowStageCreate ok');
    });
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 windowStage' + windowStage);
    AppStorage.setOrCreate<window.WindowStage>('windowStage', windowStage)
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onForeground');
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 context' + this.context);
    AppStorage.setOrCreate<common.UIAbilityContext>('abilityContext', this.context)
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 launchWant' + this.launchWant);
    AppStorage.setOrCreate<Want>('launchWant', this.launchWant)
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 lastRequestWant' + this.lastRequestWant);
    AppStorage.setOrCreate<Want>('lastRequestWant', this.lastRequestWant)
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onDestroy');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onBackground');
  }

  onWindowStageWillDestroy() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onWindowStageWillDestroy');
  }

  onWindowStageRestore() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onWindowStageRestore');
  }

  onNewWant() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onNewWant');
  }

  onDump() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onDump');
  }

  onShare() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onShare');
  }

  onBackPressed() {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'EntryAbility2 onBackPressed');
    return true;
  }

  onDestroyAsync(): Promise<void> {
    hilog.info(0x0000, 'testTag  EntryAbility2', 'onDestroyAsync');
    return new Promise<void>((resolve: (a: undefined)=>void, reject: (err: Error)=>void): void => {
      hilog.info(0x0000, 'testTag  EntryAbility2', 'onDestroyAsync resolve 1');
      resolve(undefined);
      hilog.info(0x0000, 'testTag  EntryAbility2', 'onDestroyAsync resolve 2');
    });
  }
}