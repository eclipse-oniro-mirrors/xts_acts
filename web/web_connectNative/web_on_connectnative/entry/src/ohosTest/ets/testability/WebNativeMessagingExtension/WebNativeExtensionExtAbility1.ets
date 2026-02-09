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
import { BusinessError,commonEventManager } from '@kit.BasicServicesKit';

import { hilog } from '@kit.PerformanceAnalysisKit';
import WebNativeMessagingExtensionAbility, { ConnectionInfo } from '@ohos.web.WebNativeMessagingExtensionAbility';
const TAG: string = 'testTag';

export default class WebExtensionAbility1 extends WebNativeMessagingExtensionAbility {
   onConnectNative(connect: ConnectionInfo): void {
      hilog.info(0x0000, TAG, `WebExtensionAbility1 onConnectNative, connectionId: ${connect.connectionId} fdRead: ${connect.fdRead} fdWrite: ${connect.fdWrite}`);
	  this.context.stopNativeConnection(1);
   }

   onDisconnectNative(connect: ConnectionInfo): void {
      hilog.info(0x0000, TAG, `WebExtensionAbility1 onDisconnectNative, connectionId: ${connect.connectionId}`);
   }

   onDestroy(): void {
      hilog.info(0x0000, TAG, `WebExtensionAbility1 onDestory`);
   }
};