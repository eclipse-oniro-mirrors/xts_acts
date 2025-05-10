/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import AbilityStage from '@ohos.app.ability.AbilityStage';
import commonEvent from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import { Want } from '@kit.AbilityKit';

let Acts_EntryOnDestroy = "Acts_EntryOnDestroy";
let Acts_EntryCreate = "Acts_EntryCreate"
let tag = '[ACTS_StartAbility EntryAbilityStage]';

export default class EntryAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage onCreate`);
    AppStorage.setOrCreate<number>('onAcceptWant', 0);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage onDestroy`);
  }

  onAcceptWant(want: Want): string {
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage onAcceptWant: ` + JSON.stringify(want));
    let number = AppStorage.get<number>('onAcceptWant');
    number += 1;
    AppStorage.setOrCreate<number>('onAcceptWant', number);
    if (want.abilityName === 'EntryAbility' || want.abilityName === 'EntryAbility2' || want.abilityName === 'EntryAbility3') {
      // 返回的字符串Key标识为自定义拼接的字符串内容
      if (want.parameters) {
        return `SpecifiedAbilityInstance_${want.parameters.instanceKey}`;
      }
    }
    return '';
  }
}