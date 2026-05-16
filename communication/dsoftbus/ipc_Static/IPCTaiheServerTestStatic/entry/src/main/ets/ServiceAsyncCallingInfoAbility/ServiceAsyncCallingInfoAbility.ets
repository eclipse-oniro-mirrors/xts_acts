/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';

let domain: int = 0x0000;
let tag: string = 'testTag_server_callinginfo';

class Stub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  async onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence,
    options: rpc.MessageOption, callingInfo: rpc.CallingInfo): Promise<boolean> {
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ CallingInfo Ability begin ++++++++++++++++++');
    hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest with CallingInfo');
    
    if (code == 200) {
      hilog.info(domain, tag, '%{public}s', 'code is 200: async promise with CallingInfo');
      try {
        let callerPid: int = callingInfo.callerPid;
        let getCallingPid: int = rpc.IPCSkeleton.getCallingPid();
        hilog.info(domain, tag, '%{public}s', ' callerPid: ' + callerPid);
        hilog.info(domain, tag, '%{public}s', ' getCallingPid: ' + getCallingPid);
        let callerUid: int = callingInfo.callerUid;
        let getCallingUid: int = rpc.IPCSkeleton.getCallingUid();
        hilog.info(domain, tag, '%{public}s', ' callerUid: ' + callerUid);
        hilog.info(domain, tag, '%{public}s', ' getCallingUid: ' + getCallingUid);
        let callerTokenId: long = callingInfo.callerTokenId;
        let remoteDeviceId: string = callingInfo.remoteDeviceId;
        let localDeviceId: string = callingInfo.localDeviceId;
        let isLocalCalling: boolean = callingInfo.isLocalCalling;
       
        let num: int = data.readInt();
        let str: string = data.readString();
        hilog.info(domain, tag, '%{public}s', 'async readInt: ' + num + ', readString: ' + str);
        
        reply.writeInt(callerPid);
        reply.writeInt(callerUid);
        
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          setTimeout(() => {
            hilog.info(domain, tag, '%{public}s', 'async processing completed for code 200 with CallingInfo');
            resolve(true);
          }, 1000);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'code 200 exception: ' + err);
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          resolve(false);
        });
      }
    }
    
    hilog.info(domain, tag, '%{public}s', 'unknown code: ' + code);
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ CallingInfo Ability end ++++++++++++++++++');
    return false;
  }
}

export default class ServiceAsyncCallingInfoAbility extends ServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncCallingInfoAbility onCreate');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
  }

  onConnect(want: Want): rpc.RemoteObject | Promise<rpc.RemoteObject> {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncCallingInfoAbility onConnect');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    return new Stub('rpcCallingInfoAbility');
  }

  onDisconnect() {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncCallingInfoAbility onDisconnect');
  }

  onRequest(want: Want, startId: int) {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncCallingInfoAbility onRequest');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(domain, tag, '%{public}s', 'startId param:' + JSON.stringify(startId) ?? '');
  }

  onDestroy() {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncCallingInfoAbility onDestroy');
  }
};