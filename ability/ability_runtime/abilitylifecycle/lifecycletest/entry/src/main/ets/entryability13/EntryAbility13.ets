import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';

interface EventDataI {
  data: string
}


export default class EntryAbility13 extends UIAbility {
  private abilityLifeArr: Array<string> = []
  private wantParam: ESObject = {};

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onCreate1');
    this.wantParam = want.parameters?.parameter ?? ''
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onNewWant1');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onForeground');
  }

  onWillForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWillForeground');
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onDidForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWindowStageCreate1');
    windowStage.loadContent('pages/Index1', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'testTag', 'Ability_test hidden event');
        this.abilityLifeArr.push('hidden event')
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'testTag', 'Ability_test show event');
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'testTag', 'Ability_test resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'testTag', 'Ability_test active event');
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'testTag', 'Ability_test paused event');
      }
    })
  }

  onWillBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWillBackground');
    this.abilityLifeArr.push('onWillBackground')
    setTimeout(() => {
      console.info('Ability_test onWillBackground setTimeout 1300')
    }, 3000)
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onBackground');
    this.abilityLifeArr.push('onBackground')
  }

  onDidBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onDidBackground');
    this.abilityLifeArr.push('onDidBackground')
  }

  onWindowStageWillDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWindowStageWillDestroy');
    this.abilityLifeArr.push('onWindowStageWillDestroy')

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWindowStageDestroy');
    this.abilityLifeArr.push('onWindowStageDestroy')
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onDestroy1');
    this.abilityLifeArr.push('onDestroy')
    console.info('wantParam=>1', this.wantParam.toString(), this.abilityLifeArr.toString())
    let commonEventData: EventDataI = {
      data: this.abilityLifeArr.toString()
    };
    commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
      console.info('====> [onWillBackground_0200 result] publish: ' + JSON.stringify(err));
    });
  }
}
