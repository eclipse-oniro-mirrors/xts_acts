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

import hilog from '@ohos.hilog';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility';
import rpc from '@ohos.rpc';
import Want from '@ohos.app.ability.Want';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

class StubTest extends rpc.RemoteObject {
  constructor(des: string) {
    super(des);
  }

  onConnect(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
  }
}

class AppServiceExtAbility2 extends AppServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility2 onCreate`);

  }
  onRequest(want: Want, startId: int) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility2 onRequest`);
    try { 
      this.context.terminateSelf(); 
    } catch (err) {
      hilog.info(0x0000, 'testTag', '%{public}s', `AppServiceExtensionAbility terminateSelf error: ${JSON.stringify(err)}`);
    }
  }
  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility2 onConnect`);
    return new StubTest('test');
  }
  onDisconnect(want: Want) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility2 onDisconnect`);
  }
  onDestroy() {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility2 onDestroy`);
  }
}