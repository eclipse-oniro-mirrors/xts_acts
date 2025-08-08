/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { url } from '@kit.ArkTS';
import { rpc } from '@kit.IPCKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@ohos.base';
import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { uiExtension } from '@kit.ArkUI';

export default class UiAbility07 extends EmbeddedUIExtensionAbility {
  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    console.info('UiAbility07 onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let uri = want?.uri
    console.info('UiAbility07 JSON.stringify(want) is',JSON.stringify(want));
    if(want.parameters.appLinkingOnly == true){
      console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1400 appLinkingOnly==true');
    }
  }
}