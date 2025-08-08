/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import rpc from '@ohos.rpc';
import { BusinessError } from '@kit.BasicServicesKit';
import { common, Want } from '@kit.AbilityKit';

let logTag = "[IpcClient_TestService_log:]";
let bundleNameRpc: string = "com.acts.ipcstage.service";
let abilityNameRpc: string = "ServiceAbility";
let context: common.UIAbilityContext;
let proxy: rpc.IRemoteObject;

export default class TestService {
  toConnectAbility() {
    console.info(logTag + " -----toConnectAbility-----");
    return new Promise<object>((resolve)=>{
      console.info(logTag + '-----connectServiceExtensionAbility is begin-----');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.log(logTag + 'connectServiceExtensionAbility, context: ' + context);
      let want: Want = {
        deviceId: '',
        bundleName: bundleNameRpc,
        abilityName: abilityNameRpc
      };
      let connect: common.ConnectOptions = {
        onConnect (elementName, remoteProxy) {
          console.log(logTag + 'onConnect called, remoteProxy: ' + remoteProxy);
          resolve(remoteProxy);
          proxy = remoteProxy;
        },
        onDisconnect (elementName) {
          console.log(logTag + "...onDisconnect...");
        },
        onFailed() {
          console.log(logTag + "...onFailed...");
        }
      }
      let connection: number;
      try {
        connection = context.connectServiceExtensionAbility(want, connect);
        console.info(logTag + "connectServiceExtensionAbility success. got id: " + connection);
      } catch (err) {
        console.info(logTag + "connectServiceExtensionAbility failed. got id: " + err);
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(logTag + ` ***** connectServiceExtensionAbility failed. err code is ${code}, message is ${message}`);
      }
    })
  }
  getRemoteproxy() {
    console.log(logTag + "getRemoteproxy is " + proxy);
    return proxy;
  }
}
