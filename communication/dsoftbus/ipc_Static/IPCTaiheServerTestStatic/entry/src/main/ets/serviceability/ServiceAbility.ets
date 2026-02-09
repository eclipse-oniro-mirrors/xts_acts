/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import rpc from '@ohos.rpc';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag_server'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class Stub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  onRemoteMessageRequest(
    code: int,
    data: rpc.MessageSequence,
    reply: rpc.MessageSequence,
    options: rpc.MessageOption
    ): boolean {
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject begin ++++++++++++++++++');
    hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest');
    if (code == 1) {
      hilog.info(domain, tag, '%{public}s', 'code is 1');
      let res = data.readInt();
      hilog.info(domain, tag, '%{public}s', 'readInt, res is :' + res);
      reply.writeInt(res);
      return true;
    }
    if (code == 2) {
      hilog.info(domain, tag, '%{public}s', 'code is 2');
      let res = data.readInt();
      hilog.info(domain, tag, '%{public}s', 'readInt, res is :' + res);
      let resS = data.readString();
      hilog.info(domain, tag, '%{public}s', 'readString, res is :' + resS);
      reply.writeInt(res);
      reply.writeString(resS);
      return true;
    }
    if (code == 100) {
      hilog.info(domain, tag, '%{public}s', 'code is 100');
      let remoteObject = data.readRemoteObject();
      let option2 = new rpc.MessageOption();
      let data2 = rpc.MessageSequence.create();
      let reply2 = rpc.MessageSequence.create();
      remoteObject.sendMessageRequest(1, data2, reply2, option2)
        .then((result: rpc.RequestResult) => {
          hilog.info(domain, tag, '%{public}s', '100 send request done, error code: ' + result.errCode );
        })
        .catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', '100 send request got exception: ' +err);
        })
        .finally(() => {
          data2.reclaim();
          reply2.reclaim();
          hilog.info(domain, tag, '%{public}s', 'case 100 test done');
        })
      hilog.info(domain, tag, '%{public}s', 'onRemoteMessageRequest success');
      return true;
    } else {
      hilog.info(domain, tag, '%{public}s', 'code err:' + code);
    }
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject end ++++++++++++++++++');
    return false;
  }
}

export default class ServiceAbility extends ServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(domain, tag, '%{public}s', 'IpcStageServer ServiceAbility onCreate');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
  }

  onConnect(want: Want): rpc.RemoteObject | Promise<rpc.RemoteObject> {
    hilog.info(domain, tag, '%{public}s', 'IpcStageServer ServiceAbility onConnect');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    return new Stub('rpcTestAbility');
  }

  onDisconnect() {
    hilog.info(domain, tag, '%{public}s', 'IpcStageServer ServiceAbility onDisconnect');
  }

  onRequest(want: Want, startId: int){
    hilog.info(domain, tag, '%{public}s', 'IpcStageServer ServiceAbility onRequest');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(domain, tag, '%{public}s', 'startId param:' + JSON.stringify(startId) ?? '');
  }

  onDestroy() {
    hilog.info(domain, tag, '%{public}s', 'IpcStageServer ServiceAbility onDestroy');
  }
};