import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';

const TAG: string = 'ExtensionAbility'

export default class ExtensionAbility extends UIAbility {
  onCreate() {
    console.log(TAG, `UIExtensionProvider onCreate`)
  }

  onForeground() {
    console.log(TAG, `UIExtensionProvider onForeground`)
  }

  onBackground() {
    console.log(TAG, `UIExtensionProvider onBackground`)
  }

  onDestroy() {
    console.log(TAG, `UIExtensionProvider onDestroy`)
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {

  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `UIExtensionProvider onSessionDestroy`)
  }
}
