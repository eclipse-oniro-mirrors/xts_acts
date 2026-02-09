import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 从want中获取调用方的CALLER_REQUEST_CODE，并保存
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
  }

  onForeground(): void {

  }
}
