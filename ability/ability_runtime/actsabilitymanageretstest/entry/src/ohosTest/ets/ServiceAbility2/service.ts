/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import particleAbility from '@ohos.ability.particleAbility';
import rpc from '@ohos.rpc';
import { BusinessError } from '@ohos.base';

class StubTest2 extends rpc.RemoteObject {
  constructor(des) {
    super(des);
  }

  onRemoteRequest(code, data, reply, option) {
    console.info('ServiceAbility2 onRemoteRequest');
    if (code === 1) {
      let op1 = data.readInt();
      let op2 = data.readInt();
      reply.writeInt(op1 + op2);
      console.info('ServiceAbility2 op1:' + op1 + ' op2:' + op2);
    }
    return true;
  }
}

function getNowTime() {
  return new Date().getTime();
}

function getDurationTime(msg, startTime, endTime) {
  console.info(msg + 'Get Interface startTime: ' + startTime);
  console.info(msg + 'Get Interface endTime: ' + endTime);
  let duration = (endTime - startTime);
  console.info(msg + 'Get Interface Duration: ' + duration);
  return duration;
}

async function sleep(time: number) {
  let now = new Date();
  let exitTime = now.getTime() + time;
  while (true) {
    now = new Date();
    if (now.getTime() > exitTime)
      break;
  }
  console.info(`sleep ${time} over...`);
}

export default {
  onStart() {
    console.info('ServiceAbility2 onStart');
  },
  onStop() {
    console.info('ServiceAbility2 onStop');
  },
  onCommand(want, startId) {
    console.info('ServiceAbility2 onCommand');
    let request = {
      "bundleName": "com.ohos.acecollaboration",
      "abilityName": "com.ohos.acecollaboration.ServiceAbility"
    }
    let options = {
      onConnect: async function (element: any, proxy: any) {
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onConnect element.deviceId : ' + JSON.stringify(element.deviceId));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onConnect element.bundleName : ' + JSON.stringify(element.bundleName));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onConnect element.abilityName : ' + JSON.stringify(element.abilityName));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onConnect element.uri : ' + JSON.stringify(element.uri));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onConnect element.shortName : ' + JSON.stringify(element.shortName));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onConnect proxy : ' + JSON.stringify(proxy));
      },
      onDisconnect: async function (element1: any) {
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onDisconnect element.deviceId : ' + JSON.stringify(element1.deviceId));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onDisconnect element.bundleName : ' + JSON.stringify(element1.bundleName));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onDisconnect element.abilityName: ' + JSON.stringify(element1.abilityName));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onDisconnect element.uri : ' + JSON.stringify(element1.uri));
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onDisconnect element.shortName : ' + JSON.stringify(element1.shortName));
      },
      onFailed: async function (code: any) {
        console.log('particleAbility_connectAbility_test_0100 ConnectAbility onFailed errCode : ' + code);
      },
    }

    let connection_succeeded: number;
    console.info('particleAbility_connectAbility_test_0100  start ');
    let timeOldStamp = getNowTime();
    let connection = particleAbility.connectAbility(request, options);
    let timeNewStamp = getNowTime();
    getDurationTime('particleAbility_connectAbility_test_0100 connectability', timeOldStamp, timeNewStamp);
    connection_succeeded = connection;
    console.info('particleAbility_connectAbility_test_0100 service  request is:' + JSON.stringify(request));
    console.info('particleAbility_connectAbility_test_0100 options is:' + JSON.stringify(options));
    console.info('particleAbility_connectAbility_test_0100 data is: ' + JSON.stringify(connection));
    console.info('particleAbility_connectAbility_test_0100  connection=: ' + connection);
    sleep(5000);
    console.info('particleAbility_connectAbility_test_0100  disconnectability start ');
    timeOldStamp = getNowTime();
    particleAbility.disconnectAbility(connection_succeeded)
      .then((data: any) => {
        let timeNewStamp = getNowTime();
        getDurationTime('particleAbility_connectAbility_test_0100 disconnectability', timeOldStamp, timeNewStamp);
        console.info('particleAbility_connectAbility_test_0100 disconnectability succeeded: ' + JSON.stringify(data));
      })
      .catch((error: BusinessError) => {
        console.error('particleAbility_connectAbility_test_0100 disconnectability failed. Cause: ' + JSON.stringify(error));
      })
  },
  onConnect(want) {
    console.info('ServiceAbility2 onConnect');
    return new StubTest2("test");
  }
}