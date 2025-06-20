import { AbilityConstant, ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import Want from '@ohos.app.ability.Want';
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

export default class EntryAbility extends UIAbility {
  private wantParam: ESObject = {};
  private abilityLifeArr: Array<string> = []

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onCreate');
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    console.log('EntryAbility onCreate parameter:' + want.parameters?.parameter)
    if (want.parameters?.parameter) {
      this.abilityLifeArr = []
    }
    this.wantParam = want.parameters?.parameter ?? ''
    if (this.wantParam == '0100' || this.wantParam == '0300' || this.wantParam == '0900' || this.wantParam == '1000') {
      this.abilityLifeArr.push('onCreate')
    }
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onNewWant');

    console.log('EntryAbility onCreate parameter:' + want.parameters?.parameter)
    this.wantParam = want.parameters?.parameter ?? ''
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWindowStageCreate');
    if (this.wantParam == '0100' || this.wantParam == '0300' || this.wantParam == '0900' || this.wantParam == '1000') {
      this.abilityLifeArr.push('onWindowStageCreate')
    }
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });

    windowStage.on('windowStageEvent', (data) => {
      if (data == window.WindowStageEventType.HIDDEN) {
        hilog.info(0x0000, 'testTag', 'Ability_test hidden event');
      } else if (data === window.WindowStageEventType.SHOWN) {
        hilog.info(0x0000, 'testTag', 'Ability_test show event');
        if (this.wantParam == '0100' || this.wantParam == '0200' || this.wantParam == '0300' ||
          this.wantParam == '0400' || this.wantParam == '0900' || this.wantParam == '1000') {
          this.abilityLifeArr.push('show event')
        }
      } else if (data === window.WindowStageEventType.RESUMED) {
        hilog.info(0x0000, 'testTag', 'Ability_test resume event');
      } else if (data === window.WindowStageEventType.ACTIVE) {
        hilog.info(0x0000, 'testTag', 'Ability_test active event');
      } else if (data === window.WindowStageEventType.PAUSED) {
        hilog.info(0x0000, 'testTag', 'Ability_test paused event');
      }
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWindowStageDestroy');
    this.abilityLifeArr.push('onWindowStageDestroy')
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onForeground');
    if (this.wantParam == '0100' || this.wantParam == '0200' || this.wantParam == '0300' || this.wantParam == '0400' ||
      this.wantParam == '0900' || this.wantParam == '1000') {
      this.abilityLifeArr.push('onForeground')
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onBackground');
  }

  async onWillForeground(): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWillForeground');
    if (this.wantParam == '0100' || this.wantParam == '0200' || this.wantParam == '0300' || this.wantParam == '0400' ||
      this.wantParam == '1000') {
      this.abilityLifeArr.push('onWillForeground')
    }
    if(this.wantParam == '0900'){
      this.abilityLifeArr.push('onWillForeground')
      setTimeout(()=>{
        console.info('Ability_test onWillForeground setTimeout 0900')
      }, 3000)
    }
  }

  onDidForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onDidForeground');

    if (this.wantParam == '0100' || this.wantParam == '0200' || this.wantParam == '0300' || this.wantParam == '0400' ||
      this.wantParam == '0900') {
      this.abilityLifeArr.push('onDidForeground')
      console.info('abilityLifeArr=>111',this.wantParam.toString(), JSON.stringify(this.abilityLifeArr))
      let commonEventData: EventDataI = {
        data: this.abilityLifeArr.toString()
      };
      commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
        console.info('====> [OnWillForeground_0200 result] publish: ' + JSON.stringify(err));
      });
    }

    if (this.wantParam == '1000') {
      console.info('pzz wantParam=>', this.wantParam)
      setTimeout(() => {
        this.abilityLifeArr.push('onDidForeground')
        console.info('pzz abilityLifeArr=>1', JSON.stringify(this.abilityLifeArr))
        let commonEventData: EventDataI = {
          data: this.abilityLifeArr.toString()
        };
        commonEventManager.publish(this.wantParam.toString(), commonEventData, (err) => {
          console.info('====> pzz [OnWillForeground_0200 result] publish: ' + JSON.stringify(err));
        });
      }, 3000)
    }
    console.info('pzz abilityLifeArr=>', JSON.stringify(this.abilityLifeArr))
  }

  onWillBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onWillBackground');
    let commonEventData: EventDataI = {
      data: 'onWillBackground'
    };
    commonEventManager.publish('onWillBackground', commonEventData, (err) => {
      console.info('====> [onWillBackground_0003 result] publish: ' + JSON.stringify(err));
    });
  }

  onDidBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability_test onDidBackround');
    console.info('this.wantParam=', this.wantParam, this.wantParam == 'onDidForeground_0004')
    if (this.wantParam === 'onDidForeground_0004') {
      let commonEventData: EventDataI = {
        data: 'onDidBackground'
      };
      commonEventManager.publish('onDidBackground', commonEventData, (err) => {
        console.info('====> [onDidBackground_0004 result] publish: ' + JSON.stringify(err));
      });
    }
  }
}