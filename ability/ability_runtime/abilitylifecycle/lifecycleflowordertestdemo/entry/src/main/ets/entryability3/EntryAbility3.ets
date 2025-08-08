import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
interface EventDataI {
  data: string
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

export default class EntryAbility3 extends UIAbility {
  private wantParam: ESObject = {};
  private abilityLifeArr: Array<string> = []
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onCreate');
    this.wantParam = want.parameters?.parameter ?? ''
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onDestroy');
  }

  onWillForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onWillForeground');
    this.abilityLifeArr.push('onWillForeground')
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onDidForeground');
    this.abilityLifeArr.push('onDidForeground')
    console.info('wantParam=>', this.wantParam.toString(), this.abilityLifeArr.toString())
    let commonEventData: EventDataI = {
      data: this.abilityLifeArr.toString()
    };
    commonEventManager.publish('0200', commonEventData, (err) => {
      console.info('====> [onWillBackground_0200 result] publish: ' + JSON.stringify(err));
    });
    this.abilityLifeArr = []
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', async (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'testTag', 'Ability_test EntryAbility3 hidden event');
        this.abilityLifeArr.push('hidden event')
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'testTag', 'Ability_test EntryAbility3 show event');
        this.abilityLifeArr.push('show event')
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'testTag', 'Ability_test EntryAbility3 resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'testTag', 'Ability_test EntryAbility3 active event');
        await sleep(1000)
        this.context.moveAbilityToBackground().then(() => {
          console.log(`Ability_test EntryAbility3 moveAbilityToBackground success.`);
        }).catch((err: BusinessError) => {
          console.log(`Ability_test EntryAbility3 moveAbilityToBackground error: ${JSON.stringify(err)}.`);
          if(err.code == 16000061){
            let commonEventData: EventDataI = {
              data: '16000061'
            };
            commonEventManager.publish('0200', commonEventData, (err) => {
              console.info('====> [onWillForeground_0200 result] publish: ' + JSON.stringify(err));
            });
          }
        });
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'testTag', 'Ability_test EntryAbility3 paused event');
      }
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onForeground');
    this.abilityLifeArr.push('onForeground')
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability_test EntryAbility3 onBackground');
  }
}
