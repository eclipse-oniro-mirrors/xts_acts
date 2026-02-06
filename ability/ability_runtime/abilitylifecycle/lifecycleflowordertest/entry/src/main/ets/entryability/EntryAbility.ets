import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(0x0000, 'lifecycleflowordertest', '%{public}s', 'EntryAbility onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'lifecycleflowordertest', '%{public}s', 'EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'lifecycleflowordertest', '%{public}s', 'EntryAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'lifecycleflowordertest', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'lifecycleflowordertest', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'lifecycleflowordertest', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // EntryAbility has brought to foreground
    hilog.info(0x0000, 'lifecycleflowordertest', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground(): void {
    // EntryAbility has back to background
    hilog.info(0x0000, 'lifecycleflowordertest', '%{public}s', 'EntryAbility onBackground');
  }
}