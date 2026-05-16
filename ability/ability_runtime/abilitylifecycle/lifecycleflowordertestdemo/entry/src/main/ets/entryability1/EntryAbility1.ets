import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';

interface EventDataI {
  data: string
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

export default class EntryAbility1 extends UIAbility {
  private abilityLifeArr: Array<string> = []
  private wantParam: ESObject = {};

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onCreate1');
    this.wantParam = want?.parameters?.parameter ?? ''
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onNewWant1');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onForeground');
  }

  onWillForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onWillForeground');
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onDidForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onWindowStageCreate');
    windowStage.loadContent('pages/Index1', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'lifecycleflowordertestdemo', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', async (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility1 hidden event');
        this.abilityLifeArr.push('hidden event')
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility1 show event');
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility1 resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility1 active event');
        await sleep(1000)
        this.context.moveAbilityToBackground().then(() => {
          console.log(`lifecycleflowordertestdemo moveAbilityToBackground success.`);
        }).catch((err: BusinessError) => {
          console.log(`lifecycleflowordertestdemo moveAbilityToBackground error: ${JSON.stringify(err)}.`);
          if(err.code == 16000061){
            let commonEventData: EventDataI = {
              data: '16000061'
            };
            commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
              console.info('lifecycleflowordertestdemo ====> [onWillBackground_0100 moveAbilityToBackground result] publish: ' + JSON.stringify(err));
            });
          }
        });
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'lifecycleflowordertestdemo', 'Ability_test EntryAbility1 paused event');
      }
    })
  }

  onWillBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onWillBackground');
    this.abilityLifeArr.push('onWillBackground')
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onBackground');
    this.abilityLifeArr.push('onBackground')
  }

  onDidBackground(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onDidBackground');
    this.abilityLifeArr.push('onDidBackground')
    console.info('wantParam=>', this.wantParam.toString(), this.abilityLifeArr.toString())
    let commonEventData: EventDataI = {
      data: this.abilityLifeArr.toString()
    };
    commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
      console.info('lifecycleflowordertestdemo ====> [onWillBackground_0100 result] publish: ' + JSON.stringify(err));
    });
    this.abilityLifeArr = []
  }

  onWindowStageWillDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onWindowStageWillDestroy');
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onWindowStageDestroy');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertestdemo', '%{public}s', 'Ability_test EntryAbility1 onDestroy');
  }
}
