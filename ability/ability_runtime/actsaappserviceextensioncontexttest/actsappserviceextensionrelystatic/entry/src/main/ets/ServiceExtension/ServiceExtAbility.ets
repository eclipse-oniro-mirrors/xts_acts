/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { ServiceExtensionAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import rpc from '@ohos.rpc';
import Want from '@ohos.app.ability.Want';
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';

const TAG: string = 'testTag';
class StubTest extends rpc.RemoteObject{
  constructor(des: string) {
    super(des);
    hilog.info(0x0000, TAG, 'rely ServiceExtAbility StubTest');
  }
  onConnect(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    hilog.info(0x0000, TAG, 'rely ServiceExtAbility StubTest onConnect');
  }
}

export default class ServiceExtAbility extends ServiceExtensionAbility {

  onCreate(want: Want): void {
    hilog.info(0x0000, TAG, `rely ServiceExtAbility onCreate, want: ${JSON.stringify(want)}`);
  }

  onRequest(want: Want, startId: number): void {
    hilog.info(0x0000, TAG, `rely ServiceExtAbility onRequest, want: ${JSON.stringify(want)}, startId: ${startId}`);
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(0x0000, TAG, `rely ServiceExtAbility onConnect, want: ${JSON.stringify(want)}`);
    return new StubTest('test');
  }

  onDisconnect(want: Want):  Promise<void>|undefined {
    hilog.info(0x0000, TAG, `rely ServiceExtAbility onDisconnect, want: ${JSON.stringify(want)}`);
    return undefined;
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'rely ServiceExtAbility onDestroy');
  }
};