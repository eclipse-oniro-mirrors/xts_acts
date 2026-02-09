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

export default class EntryAbility14 extends UIAbility {
  private abilityLifeArr: Array<string> = []
  private wantParam: ESObject = {};

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onCreate1');
    this.wantParam = want.parameters?.parameter ?? ''
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onNewWant1');
  }

  onForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onForeground');
  }

  onWillForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onWillForeground');
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onDidForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onWindowStageCreate1');
    windowStage.loadContent('pages/Index1', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'lifecycleflowordertestdemo', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', async (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility14 hidden event');
        this.abilityLifeArr.push('hidden event')
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility14 show event');
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility14 resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility14 active event');
        await sleep(1000)
        this.context.terminateSelf()
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility14 paused event');
      }
    })
  }

  onWillBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onWillBackground');
    this.abilityLifeArr.push('onWillBackground')
  }

  onBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onBackground');
    this.abilityLifeArr.push('onBackground')
    setTimeout(() => {
      console.info('Ability_test EntryAbility14 onBackground setTimeout 1400')
    }, 3000)
  }

  onDidBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onDidBackground');
    this.abilityLifeArr.push('onDidBackground')
  }

  onWindowStageWillDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onWindowStageWillDestroy');
    this.abilityLifeArr.push('onWindowStageWillDestroy')

  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onWindowStageDestroy');
    this.abilityLifeArr.push('onWindowStageDestroy')
  }

  onDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility14 onDestroy1');
    this.abilityLifeArr.push('onDestroy')
    console.info('lifecycleflowordertestdemo EntryAbility14 wantParam=>', this.wantParam.toString(), this.abilityLifeArr.toString())
    let commonEventData: EventDataI = {
      data: this.abilityLifeArr.toString()
    };
    commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
      console.info('lifecycleflowordertestdemo EntryAbility14 ====> [onWillBackground_0200 result] publish: ' + JSON.stringify(err));
    });
  }
}
