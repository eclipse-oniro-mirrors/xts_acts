import { AbilityStage, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用HAP首次加载时触发，可以在此执行该Module的初始化操作（例如资源预加载、线程创建等）。
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[MyAbilityStage] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[MyAbilityStage] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('AbilityStage_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[MyAbilityStage] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[MyAbilityStage] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onAcceptWant(want: Want): string {
    const abilityName = want.abilityName;
    const instanceKey = want.parameters?.instanceKey as string;
    hilog.info(0x0000, 'AbilityStage', `onAcceptWant: ${abilityName}, instanceKey: ${instanceKey}`);
    if (abilityName === 'TestAbility3') {
      const newInstanceId = `instance_${Date.now()}_${Math.random()}`;
      hilog.info(0x0000, 'AbilityStage', `${abilityName}: ${newInstanceId}`);
      return newInstanceId;
    }
    return '';
  }
}