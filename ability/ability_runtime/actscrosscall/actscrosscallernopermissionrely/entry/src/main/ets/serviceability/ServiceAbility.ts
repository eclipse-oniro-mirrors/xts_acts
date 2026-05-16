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
import commonEvent from '@ohos.commonEventManager'
import rpc from '@ohos.rpc';
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility'

class StubTest extends rpc.RemoteObject {
  constructor(des) {
    super(des)
  }

  onRemoteRequest(code, data, reply, option) {
    console.info('ServiceAbility onRemoteRequest');
    if (code === 1) {
      let op1 = data.readInt();
      let op2 = data.readInt();
      reply.writeInt(op1 + op2);
      console.info('ServiceAbility op1:' + op1 + ' op2:' + op2);
    }
    return true;
  }
}
var actionStr;
var accountId;
var message;
var commonEventData = {
  parameters:{
    message:message,
  }
}
let remoteOBJ = new StubTest("test");
export default class ServiceAbility extends ServiceExtensionAbility {
  onCreate(want){
    actionStr = want.parameters.action;
    accountId = want.parameters.accountId;
    console.info('ServiceAbility onCreate want:' + JSON.stringify(want));
    globalThis.terminate = () => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info("====>ServiceAbility terminateSelf end");
        }).catch((err) => {
          console.info("====>ServiceAbility terminateSelf err:" + JSON.stringify(err));
        });
      }, 50)
    };

    if (actionStr === 'Acts_CrossUserCall_0800') {
      this.context.startAbilityByCallWithAccount({
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
      }, accountId).then((data) => {
        console.info('====>' + actionStr + ' startAbilityByCall data:' + JSON.stringify(data));
      }).catch((err) => {
        console.info('====>' + actionStr + ' startAbilityByCall err:' + JSON.stringify(err));
        commonEventData.parameters.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + ' publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }
  }
  onDestroy() {
    console.info('ServiceAbility onDestroy');
  }

  onRequest(want, startId) {
    console.info('ServiceAbility onRequest');
  }

  onConnect(want) {
    console.info('ServiceAbility onConnect');
    return remoteOBJ;
  }

  onDisconnect(want) {
    console.info('ServiceAbility onDisconnect');
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