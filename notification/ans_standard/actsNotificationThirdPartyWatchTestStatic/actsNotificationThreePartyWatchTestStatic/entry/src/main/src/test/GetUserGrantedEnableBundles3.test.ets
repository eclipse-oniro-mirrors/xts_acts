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
import hilog from '@ohos.hilog'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { BusinessError } from '@ohos.base';

let commonTag: string = "GetUserGrantedEnableBundles"
export default function actsNotificationAnsThreePartyGetUserGrantedEnableBundles3Test() {
  describe('actsNotificationAnsThreePartyGetUserGrantedEnableBundles3Test', () => {
     /**
     * @tc.number    Sub_Notification_Ans_ThreePartyWatch_Static_1058
     * @tc.name      Sub_Notification_Ans_ThreePartyWatch_Static_1058
     * @tc.desc      【getUserGrantedEnabledBundles-public】有授权应用，接口调用正常
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1058', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_Static_1058 ";
      try {
        const result = await notificationExtensionSubscription.getUserGrantedEnabledBundles();
        console.info(TAG + ` 111111Result: ${JSON.stringify(result)}`);
        expect(Array.isArray(result)).assertTrue();
        if (result.length > 0) {
          const firstItem = result[0];
          if (typeof firstItem === 'string') {
            console.info(TAG + ` Returned string array format`);
            expect(typeof firstItem === 'string').assertTrue();
          } else {
            console.info(TAG + ` Returned object array format`);
            console.info(TAG + ` typeof firstItem.bundleName: ${typeof firstItem.bundleName}`);
            console.info(TAG + ` typeof firstItem.appIndex: ${typeof firstItem.appIndex}`);
            console.info(TAG + ` typeof firstItem.appName: ${typeof firstItem.appName}`);
            expect(typeof firstItem.bundleName === 'string').assertTrue();
            expect(typeof firstItem.appIndex === 'int').assertTrue();
            if (firstItem.appName) {
              expect(typeof firstItem.appName === 'string').assertTrue();
            }
          }
        }
        hilog.info(0x000, TAG, "Test completed successfully");
      } catch (err) {
        err = err as BusinessError
        console.error(TAG + " Test failed: " + ` ${err.code}, ${err.message}`);
        if (err.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
        }
      } finally {
        done();
      }
    });
  })
}