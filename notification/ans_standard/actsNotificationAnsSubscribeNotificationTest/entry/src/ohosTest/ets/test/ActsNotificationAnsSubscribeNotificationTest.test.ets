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

import { describe, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationSubscribe } from '@kit.NotificationKit';

let bundleName = 'com.example.actsnotificationanssubscribenotificationtest'

export default function ActsNotificationAnsSubscribeNotificationTest() {
  describe('ActsNotificationAnsSubscribeNotificationTest', () => {

    /**
     * @tc.name   SUB_Notification_Ans_subscribeNotification_0100
     * @tc.number SUB_Notification_Ans_subscribeNotification_0100
     * @tc.desc   The third-party application calls the subscribeNotification interface and reports error 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_subscribeNotification_0100', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_subscribeNotification_0100'
      let onConnect = (data: notificationSubscribe.SubscribeCallbackData) => {
        console.info(testNum + `Consume callback: ${JSON.stringify(data)}`);
      }
      let subscriber: notificationSubscribe.NotificationSubscriber = {
        onConsume: onConnect
      };
      try {
        await notificationSubscribe.subscribeNotification(subscriber).then(() => {
          console.info(testNum + "subscribeNotification success");
          expect().assertFail()
          done()
        }).catch((err: BusinessError) => {
          console.error(testNum + `subscribeNotification fail: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done()
        });
      } catch (err) {
        console.error(testNum + `getAllNotificationEnabledBundles fail: ${JSON.stringify(err)}${err.message}`);
        if (err.code === 801) {
          expect(err.code).assertEqual(801)
          done()
        } else {
          expect(err.code).assertEqual(202)
          done()
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_subscribeNotification_0200
     * @tc.number SUB_Notification_Ans_subscribeNotification_0200
     * @tc.desc   The third-party application calls the subscribeNotification interface with the info parameter, and an error code 202 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_subscribeNotification_0200', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_subscribeNotification_0200'
      let onConnect = (data: notificationSubscribe.SubscribeCallbackData) => {
        console.info(testNum + `Consume callback: ${JSON.stringify(data)}`);
      }
      let subscriber: notificationSubscribe.NotificationSubscriber = {
        onConsume: onConnect
      };
      let subscribeInfo: notificationSubscribe.NotificationSubscribeInfo = {
        bundleNames: [bundleName],
      }
      try {
        await notificationSubscribe.subscribeNotification(subscriber, subscribeInfo).then(() => {
          console.info(testNum + "subscribeNotification success");
          expect().assertFail()
          done()
        }).catch((err: BusinessError) => {
          console.error(testNum + `subscribeNotification fail: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done()
        });
      } catch (err) {
        console.error(testNum + `getAllNotificationEnabledBundles fail: ${JSON.stringify(err)}${err.message}`);
        if (err.code === 801) {
          expect(err.code).assertEqual(801)
          done()
        } else {
          expect(err.code).assertEqual(202)
          done()
        }
      }
    })
  })
}