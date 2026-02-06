/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import base, { BusinessError } from '@ohos.base';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function ActsAnsNotificationBadgeNoSystemTest() {
  let TEST_SUITE_NAME = 'ActsAnsNotificationBadgeNoSystemTest ===>'

  describe('ActsAnsNotificationBadgeNoSystemTest', () => {

    /**
     * @tc.name   Sub_Notification_Ans_Corner_Query_0004
     * @tc.number Sub_Notification_Ans_Corner_Query_0004
     * @tc.desc   non-system application invokes the onBadgeNumberQuery and offBadgeNumberQuery interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Corner_Query_0004', Level.LEVEL2, async  (done : Function) => {
      let TAG:string = 'Sub_Notification_Ans_Corner_Query_0004'
      try{
        notificationManager.onBadgeNumberQuery(
          async (bundleOption: notificationManager.BundleOption) => {
            return 1;
          }
        );
      } catch(err) {
        console.error(TEST_SUITE_NAME + TAG + `OnBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202);
      }
      await sleep(1000)
      try{
        notificationManager.offBadgeNumberQuery();
      } catch(err) {
        console.error(TEST_SUITE_NAME + TAG + `OffBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202);
        done();
      }

    })


  })
}
