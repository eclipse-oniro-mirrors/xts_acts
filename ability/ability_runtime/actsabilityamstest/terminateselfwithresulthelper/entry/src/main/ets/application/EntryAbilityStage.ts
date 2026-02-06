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

let actsEntryOnDestroy = 'Acts_EntryOnDestroy';
let actsEntryCreate = 'Acts_EntryCreate';
let tag = '[ACTS_StartAbility EntryAbilityStage]';

function sleep(delay: number){
  let start = (new Date()).getTime();
  while ((new Date()).getTime() - start < delay) {
    continue;
  }
}

export default class EntryAbilityStage extends AbilityStage {
  onCreate(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage onCreate`);
    commonEvent.publish(actsEntryCreate, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `EntryAbilityStage Acts_EntryCreate publish err:  ${JSON.stringify(err)}`);
    })

  }

  onDestroy(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage onDestroy`);
    commonEvent.publish(actsEntryOnDestroy, (err) => {
      hilog.info(0x0000, tag, '%{public}s',
        `EntryAbilityStage Acts_EntryOnDestroy publish err:  ${JSON.stringify(err)}`);
    })
    sleep(1000);
  }
}