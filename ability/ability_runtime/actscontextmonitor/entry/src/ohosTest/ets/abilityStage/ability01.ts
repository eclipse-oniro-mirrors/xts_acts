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
import { AbilityStage } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@ohos.base';

export default class AbilityStage01 extends AbilityStage {

  public eventCallback(argOne?: number, argTwo?: number): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `eventCallback success, argOne is: ${argOne}, argTwo is: ${argTwo}`);
    globalThis.argOneResult = argOne;
    globalThis.argTwoResult = argTwo;
  }

  onCreate(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage01 onCreate');
    globalThis.stageContext01 = this.context;
    try {
      this.context.eventHub.on('event01', this.eventCallback);
    } catch (e) {
      let code: number = (e as BusinessError).code;
      let msg: string = (e as BusinessError).message;
      hilog.info(0x0000, 'testTag', '%{public}s', `EventHub emit error, code: ${code}, msg: ${msg}`);
    }
    try {
      this.context.eventHub.emit('event01', 1, 2);
    } catch (e) {
      let code: number = (e as BusinessError).code;
      let msg: string = (e as BusinessError).message;
      console.error(`EventHub emit error, code: ${code}, msg: ${msg}`);
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage01 onDestroy');
    this.context.eventHub.off('event01', this.eventCallback);
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage01 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage01 onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage01 onBackground');
  }
}