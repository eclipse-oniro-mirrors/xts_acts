import { common } from '@kit.AbilityKit'
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
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
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
          })
        Button("openNotificationSettingsWithResult")
          .onClick(() => {
            try {
              let context = getContext(this) as common.UIAbilityContext;
              notificationManager.openNotificationSettingsWithResult(context).then((data) => {
                hilog.info(0x0000, 'testTag', `[ANS] openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
              }).catch((err: BusinessError) => {
                hilog.error(0x0000, 'testTag', `[ANS] openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
              });
            } catch (err) {
              console.error(`failed to call openNotificationSettingsWithResult, code is ${err.code}, message is ${err.message}`)
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
