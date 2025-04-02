/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility'
import rpc from '@ohos.rpc';
import commonEvent from '@ohos.commonEvent'

let message;
let commonEventData = {
  parameters: {
    message: message,
  }
}

class StubTest extends rpc.RemoteObject {
  constructor(des) {
    super(des)
  }

  onRemoteRequest(code, data, reply, option) {
    console.info('ServiceAbilitySec onRemoteRequest');
    if (code === 1) {
      let op1 = data.readInt();
      let op2 = data.readInt();
      reply.writeInt(op1 + op2);
      console.info('ServiceAbilitySec op1:' + op1 + ' op2:' + op2);
    }
    return true;
  }
}

let strAction = '';
let remoteOBJ = new StubTest("test");

export default class ServiceAbilitySec extends ServiceExtensionAbility {
  onCreate(want) {
    strAction = want.action;
    console.info('ServiceAbilitySec onCreate');
    commonEventData.parameters.message = want;
    if (strAction == "Acts_StopServiceExtension_0200" || strAction == "Acts_StopServiceExtension_0400" ||
      strAction == "Acts_StopServiceExtension_0600") {
      commonEvent.publish("ACTS_StopEvent_Second", commonEventData, (err) => {
        console.info("====>" + strAction + " Second publish err: " + JSON.stringify(err));
      })
    }
  }

  onDestroy() {
    console.info('ServiceAbilitySec onDestroy');
  }

  onRequest(want, startId) {
    console.info('ServiceAbilitySec onRequest');
  }

  onConnect(want) {
    console.info('ServiceAbilitySec onConnect');
    return remoteOBJ;
  }

  onDisconnect(want) {
    console.info('ServiceAbilitySec onDisconnect');
  }

  onReconnect(want) {
    console.info('ServiceAbility onReconnect');
  }

  onConfigurationUpdate(newConfig) {
    console.info('ServiceAbility onConfigurationUpdate');
  }

  onDump(params) {
    console.info('ServiceAbility onDump');
    return params;
  }
};