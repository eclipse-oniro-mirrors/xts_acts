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
import { UIAbility, Want } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class abilityStage03 extends UIAbility {

  onCreate(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 onCreate');
    globalThis.stageContext03 = this.context
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 onDestroy');
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 onForeground');
    commonEventManager.publish('ACTS_TEST_EMIT_NEW',  ()=> {
      hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 publish ACTS_TEST_EMIT_NEW');
    });
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 onBackground');
  }
}