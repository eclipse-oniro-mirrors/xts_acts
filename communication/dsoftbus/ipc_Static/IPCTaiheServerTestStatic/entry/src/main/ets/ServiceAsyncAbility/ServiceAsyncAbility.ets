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
let tag: string = 'testTag_server_async';

class Stub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  async onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence,
    options: rpc.MessageOption): Promise<boolean> {
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ Async Ability begin ++++++++++++++++++');
    hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest');
    
    if (code == 201) {
      hilog.info(domain, tag, '%{public}s', 'code is 201: async promise without CallingInfo');
      try {
        let num: int = data.readInt();
        let str: string = data.readString();
        hilog.info(domain, tag, '%{public}s', 'async readInt: ' + num + ', readString: ' + str);
        
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          setTimeout(() => {
            hilog.info(domain, tag, '%{public}s', 'async processing completed for code 201');
            reply.writeInt(num);
            reply.writeString(str);
            resolve(true);
          }, 1000);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'code 201 exception: ' + err);
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          resolve(false);
        });
      }
    }
    
    if (code == 202) {
      hilog.info(domain, tag, '%{public}s', 'code is 202: async multiple parameters');
      try {
        let num1: int = data.readInt();
        let num2: int = data.readInt();
        let str: string = data.readString();
        let dbl: double = data.readDouble();
        hilog.info(domain, tag, '%{public}s', 'async readInt1: ' + num1 + ', readInt2: ' + num2 + 
                   ', readString: ' + str + ', readDouble: ' + dbl);
        
        let sum: int = num1 + num2;     
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          setTimeout(() => {
            reply.writeInt(sum);
            reply.writeString(str);
            reply.writeDouble(dbl);
            hilog.info(domain, tag, '%{public}s', 'async processing completed for code 202');
            resolve(true);
          }, 1000);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'code 202 exception: ' + err);
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          resolve(false);
        });
      }
    }
    
    if (code == 203) {
      hilog.info(domain, tag, '%{public}s', 'code is 203: async callback mode');
      try {
        let num: int = data.readInt();
        let str: string = data.readString();
        hilog.info(domain, tag, '%{public}s', 'async readInt: ' + num + ', readString: ' + str);
        
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          setTimeout(() => {
            hilog.info(domain, tag, '%{public}s', 'async processing completed for code 203');
            reply.writeInt(num);
            reply.writeString(str);
            resolve(true);
          }, 1000);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'code 203 exception: ' + err);
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          resolve(false);
        });
      }
    }
    
    if (code == 204) {
      hilog.info(domain, tag, '%{public}s', 'code is 204: async long delay');
      try {
        let num: int = data.readInt();
        let str: string = data.readString();
        hilog.info(domain, tag, '%{public}s', 'async readInt: ' + num + ', readString: ' + str);
        
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          setTimeout(() => {
            reply.writeInt(num);
            reply.writeString(str);
            hilog.info(domain, tag, '%{public}s', 'async processing completed for code 204 with long delay');
            resolve(true);
          }, 9000);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'code 204 exception: ' + err);
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
          resolve(false);
        });
      }
    }
    
    hilog.info(domain, tag, '%{public}s', 'unknown code: ' + code);
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ Async Ability end ++++++++++++++++++');
    return false;
  }
}

export default class ServiceAsyncAbility extends ServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncAbility onCreate');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
  }

  onConnect(want: Want): rpc.RemoteObject | Promise<rpc.RemoteObject> {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncAbility onConnect');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    return new Stub('rpcTestAbility');
  }

  onDisconnect() {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncAbility onDisconnect');
  }

  onRequest(want: Want, startId: int) {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncAbility onRequest');
    hilog.info(domain, tag, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(domain, tag, '%{public}s', 'startId param:' + JSON.stringify(startId) ?? '');
  }

  onDestroy() {
    hilog.info(domain, tag, '%{public}s', 'ServiceAsyncAbility onDestroy');
  }
};