/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Want } from '@kit.AbilityKit';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility'
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'testTag';

class StubTest extends rpc.RemoteObject{
  constructor(des: string) {
    hilog.info(0x0000, TAG, 'Rely AppService2 StubTest');
    super(des);
  }

  onConnect(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    hilog.info(0x0000, TAG, 'Rely AppService2 StubTest onConnect');
  }
}

export default class AppService2 extends AppServiceExtensionAbility {
  onCreate(want: Want): void {
    hilog.info(0x0000, TAG, `Rely AppService2 onCreate, want: ${JSON.stringify(want)}`);
  }

  onRequest(want: Want, startId: number): void {
    hilog.info(0x0000, TAG, `Rely AppService2 onRequest, want: ${JSON.stringify(want)}, startId: ${startId}`);
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(0x0000, TAG, `Rely AppService2 onConnect, want: ${JSON.stringify(want)}`);
    return new StubTest('test');
  }

  onDisconnect(want: Want): void {
    hilog.info(0x0000, TAG, `Rely AppService2 onDisconnect, want: ${JSON.stringify(want)}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'Rely AppService2 onDestroy');
  }
};