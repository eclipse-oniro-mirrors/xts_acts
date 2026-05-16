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
import NotificationSubscriberExtensionAbility from '@ohos.application.NotificationSubscriberExtensionAbility';
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';

export default class DynamicNotificationSubscriberExtensionAbility extends NotificationSubscriberExtensionAbility {
  onDestroy(): void {
    console.log(`ansTest 1.2 on destory`);
  }

  onReceiveMessage(notificationInfo: notificationExtensionSubscription.NotificationInfo): void {
    console.log(`ansTest 1.2 on receive message ${JSON.stringify(notificationInfo)}`);
  }

  onCancelMessages(hashCodes: Array<string>): void {
    console.log(`ansTest 1.2 on cancel message ${JSON.stringify(hashCodes)}`);
  }
}