import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { emitter } from '@kit.BasicServicesKit';

export default class AbilityA extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityA onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let innerEvent: emitter.InnerEvent = {
      eventId: 1
    };

    // 收到eventId为1的事件后执行回调函数
    emitter.once(innerEvent, () => {
      this.context.terminateSelf();
      console.info('emitter terminateSelf');
    });
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityA onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityA onWindowStageCreate');
    windowStage.loadContent('testability/AbilityA/pages/Index.ets', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityA onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityA onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityA onBackground');
  }
}