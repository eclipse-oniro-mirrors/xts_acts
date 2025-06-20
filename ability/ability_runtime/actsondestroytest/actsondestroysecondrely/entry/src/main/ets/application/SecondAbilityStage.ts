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

export default class SecondAbilityStage extends AbilityStage {
  onCreate(): void {
    console.info('SecondAbilityStage onCreate');
  }

  onDestroy(): void {
    console.info('SecondAbilityStage onDestroy');
    commonEvent.publish('Acts_SecondOnDestroy', (err) => {
      console.info('Acts_EntryOnDestroy publish err: ' + JSON.stringify(err));
    })
    let startTime = (new Date()).valueOf();
    while (true) {
      let endTime = (new Date()).valueOf();
      if ((endTime - startTime) > 1000) {
          console.info('SecondAbilityStage onDestroy publish end');
          break;
      }
    }
  }
}