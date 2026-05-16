import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';

interface EventDataI {
  data: string
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

export default class EntryAbility2 extends UIAbility {
  private abilityLifeArr: Array<string> = []
  private wantParam: ESObject = {};

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onCreate');
    this.wantParam = want.parameters?.parameter ?? ''
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onNewWant');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onForeground');
  }

  onWillForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onWillForeground');
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onDidForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onWindowStageCreate');
    windowStage.loadContent('pages/Index1', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'lifecycleflowordertestdemo', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', async (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility2 hidden event');
        this.abilityLifeArr.push('hidden event')
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility2 show event');
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility2 resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility2 active event');
        await sleep(1000)
        this.context.terminateSelf()
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility2 paused event');
      }
    })
  }

  onWillBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onWillBackground');
    this.abilityLifeArr.push('onWillBackground')
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onBackground');
    this.abilityLifeArr.push('onBackground')
  }

  onDidBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onDidBackground');
    this.abilityLifeArr.push('onDidBackground')
  }

  onWindowStageWillDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onWindowStageWillDestroy');
    this.abilityLifeArr.push('onWindowStageWillDestroy')
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onWindowStageDestroy');
    this.abilityLifeArr.push('onWindowStageDestroy')
  }

  onDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility2 onDestroy');
    this.abilityLifeArr.push('onDestroy')
    console.info('lifecycleflowordertestdemo EntryAbility2 wantParam=>', this.wantParam.toString(), this.abilityLifeArr.toString())
    let commonEventData: EventDataI = {
      data: this.abilityLifeArr.toString()
    };
    commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
      console.info('lifecycleflowordertestdemo EntryAbility2 ====> [onWillBackground_0200 result] publish: ' + JSON.stringify(err));
      this.context.terminateSelf()
    });

  }
}
