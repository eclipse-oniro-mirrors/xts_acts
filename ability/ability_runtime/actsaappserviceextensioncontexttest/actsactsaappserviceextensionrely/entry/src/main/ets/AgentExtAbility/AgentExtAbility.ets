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
import { AgentExtensionAbility, Want, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[AppServiceExtAbility]';

export default class AgentExt extends AgentExtensionAbility {
  // 创建AgentExtensionAbility
  onCreate(want: Want):void {
    hilog.info(0x0000, TAG, `onCreate, want: ${want.abilityName}, bundlename: ${want.bundleName}`);
    hilog.info(0x0000, TAG, `onCreate, want: ${this.context.filesDir}`);
  }

  onConnect(want: Want, proxy: common.AgentHostProxy):void {
    hilog.info(0x0000, TAG, `onConnect, want: ${want.abilityName}, bundlename: ${want.bundleName}`);
  }

  onDisconnect(want: Want, proxy: common.AgentHostProxy):void {
    hilog.info(0x0000, TAG, `onDisconnect, want: ${want.abilityName}, bundlename: ${want.bundleName}`);
  }

  onData(proxy : common.AgentHostProxy, data : string ):void {
    hilog.info(0x0000, TAG, `onData, data: ${data}`);
  }

  onAuth(proxy : common.AgentHostProxy, handshakeData : string ):void {
    hilog.info(0x0000, TAG, `onAuth, handshakeData: ${handshakeData}`);
  }

  onDestroy():void {
    hilog.info(0x0000, TAG, `onDestroy`);
  }
}
