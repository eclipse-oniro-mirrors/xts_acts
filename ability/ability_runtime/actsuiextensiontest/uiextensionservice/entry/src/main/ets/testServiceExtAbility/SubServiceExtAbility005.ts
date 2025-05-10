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

import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import commonEventManager from '@ohos.commonEventManager'
import SubServiceExtStub from '../IdlServiceExt/SubService/sub_service_ext_stub';
import { subCallback } from '../IdlServiceExt/SubService/sub_service_ext';
import Logger from '../util/Logger';

class ServiceExtStub extends SubServiceExtStub{

  sub(num1: number, num2: number, callback: subCallback): void{
      let res = num1 - num2
      callback(0,res)
      Logger.info(`sub result: ${res}`)
  }
}

let successDifferentAppEvent005 = 'ACTS_UIExtension_DifferentApp005_Success';
export default class SubServiceExtAbility005 extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`onConnect , want: ${want.abilityName}`)
    return new ServiceExtStub("sub service stub")
  }

  onDisconnect(want) {
    commonEventManager.publish(successDifferentAppEvent005, (err) => { });
    Logger.info(`onDisconnect, want: ${want.abilityName}`)
  }

  onDestroy() {
    Logger.info(`onDestroy`)
  }
}