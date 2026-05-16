/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { commonEventManager } from '@kit.BasicServicesKit';
import { UIAbility, Want } from '@kit.AbilityKit';

export default class abilityStage02 extends UIAbility {

  onCreate(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 onCreate');
    globalThis.stageContext02 = this.context
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 onDestroy');
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 onForeground');
    commonEventManager.publish('ACTS_TEST_EMIT',  ()=> {
      hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_EMIT');
    });
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 onBackground');
  }
}