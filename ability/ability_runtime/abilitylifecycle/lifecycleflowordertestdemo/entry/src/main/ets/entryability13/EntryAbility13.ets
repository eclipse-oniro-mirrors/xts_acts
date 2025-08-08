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

export default class EntryAbility13 extends UIAbility {
  private abilityLifeArr: Array<string> = []
  private wantParam: ESObject = {};

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onCreate');
    this.wantParam = want.parameters?.parameter ?? ''
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onNewWant1');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onForeground');
  }

  onWillForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onWillForeground');
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onDidForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onWindowStageCreate');
    windowStage.loadContent('pages/Index1', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'lifecycleflowordertestdemo', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', async (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility13 hidden event');
        this.abilityLifeArr.push('hidden event')
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility13 show event');
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility13 resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility13 active event');
        await sleep(1000)
        this.context.terminateSelf()
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility13 paused event');
      }
    })
  }

  onWillBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onWillBackground');
    this.abilityLifeArr.push('onWillBackground')
    setTimeout(() => {
      console.info('lifecycleflowordertestdemo EntryAbility13 onWillBackground setTimeout 1300')
    }, 3000)
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onBackground');
    this.abilityLifeArr.push('onBackground')
  }

  onDidBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onDidBackground');
    this.abilityLifeArr.push('onDidBackground')
  }

  onWindowStageWillDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onWindowStageWillDestroy');
    this.abilityLifeArr.push('onWindowStageWillDestroy')

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onWindowStageDestroy');
    this.abilityLifeArr.push('onWindowStageDestroy')
  }

  onDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility13 onDestroy');
    this.abilityLifeArr.push('onDestroy')
    console.info('lifecycleflowordertestdemo EntryAbility13 wantParam=>', this.wantParam.toString(), this.abilityLifeArr.toString())
    let commonEventData: EventDataI = {
      data: this.abilityLifeArr.toString()
    };
    commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
      console.info('lifecycleflowordertestdemo EntryAbility13 ====> [onWillBackground_0200 result] publish: ' + JSON.stringify(err));
    });
  }
}
