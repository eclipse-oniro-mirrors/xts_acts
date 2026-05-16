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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { BusinessError } from '@ohos.base';

let commonTag: string = "GetSubscribeInfo"

export default function actsNotificationAnsThreePartyGetSubscribeInfoTest() {
  describe('actsNotificationAnsThreePartyGetSubscribeInfoTest', () => {
    /**
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_Static_1017
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_Static_1017
      * @tc.desc      【getSubscribeInfo】从未订阅过，调用查询接口结果为空
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1017', Level.LEVEL2, (done: () => void) => {
      let TAG: string = commonTag + "Sub_Notification_Ans_ThreePartyWatch_Static_1017 ";
      notificationExtensionSubscription.getSubscribeInfo()
        .then(
        (data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
          console.info(TAG +`getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
          expect(data.length).assertEqual(0)
          done();
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`getSubscribeInfo fail: ${err.code}: ${err.message}`);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
    })
  })
}