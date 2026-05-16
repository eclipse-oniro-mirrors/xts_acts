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
import { describe, afterEach, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationExtensionSubscription } from '@kit.NotificationKit';
import common from '@ohos.app.ability.common';

let ctx = getContext(this) as common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let tag = 'ActsNotificationAnsOpenWindowWithResultWithoutAbilityTest'

export default function ActsNotificationAnsOpenWindowWithResultWithoutAbilityTest() {
  describe('ActsNotificationAnsOpenWindowWithResultWithoutAbilityTest', () => {
    afterEach(async () => {
      await sleep(2000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0400
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0400
     * @tc.desc   [openSubscriptionSettingsWithResult] The NotificationSubscriberExtensionAbility of an app does not implement the openSubscriptionSettingsWithResult API, and error 1600023 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0400', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0400'
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else if (err?.code === 201) {
            expect(err.code).assertEqual(201);
            done();
          } else {
            expect(err.code).assertEqual(1600023);
            done();
          }
        });
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(err.code).assertEqual(1600023);
          done();
        }
      }
    })
  })
}