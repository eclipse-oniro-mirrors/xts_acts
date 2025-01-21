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

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

export function publishEvent(event: string, reason: AbilityConstant.LastExitReason, exitMsg: string) {
  let options: CommonEventManager.CommonEventPublishData = {
    code: 0,
    bundleName: "com.acts.lastexitreasontest",
    parameters: {
      "lastExitReason": reason,
      "lastExitMessage": exitMsg
    },
    isOrdered: false
  }
  let publishCB = (err: BusinessError) => {
    if (err) {
      console.error(`publish failed, err: ${JSON.stringify(err)}`);
    } else {
      console.info("publish success");
    }
  }
  CommonEventManager.publish(event, options, publishCB);
}
