/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import commonEvent from '@ohos.commonEvent';

function PublishCallBack(err) {
  if (err.code) {
    console.error("callTest publish failed " + JSON.stringify(err));
  } else {
    console.info("callTest publish success!!!");
  }
}

export default {
  onInitialized(abilityInfo) {
    console.info('DataAbility onInitialized');
  },
  call(method, arg, extras) {
    console.info('DataAbility call test000');
    console.info('call succeeded data111 ' + JSON.stringify(extras));
    var temp = JSON.stringify(extras);
    if (extras != undefined || extras != null) {
      console.info('call commonEvent.publish start!!!!');
      commonEvent.publish("call_event", {
        parameters: {
          "assertData": JSON.stringify(JSON.parse(temp))
        }
      }, PublishCallBack);
    }
    return extras;
  }
};