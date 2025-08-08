/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import notificationManager from '@ohos.notificationManager'
import { BusinessError } from '@ohos.base'

export default function ActsNotificationBadgeTest() {
  describe('SUB_NOTIFICATION_ANS_BADGE_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test START')
    /*
     * @tc.number: Sub_Notification_Ans_Corner_SetNum_0900
     * @tc.name: setBadgeNumber()
     * @tc.desc: verify the callback function of setBadgeNumber
     */
    it('Sub_Notification_Ans_Corner_SetNum_0900', Level.LEVEL0, async (done: Function) => {
      try {
        notificationManager.setBadgeNumber(10, (err) => {
          if (err) {
            console.log(`Sub_Notification_Ans_Corner_SetNum_0900 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(true).assertTrue()
              done()
            }else{
              expect(false).assertTrue()
              done()
            }
          } else {
            console.log("Sub_Notification_Ans_Corner_SetNum_0900 success")
            expect(true).assertTrue()
            done();
          }
        })
      } catch (err) {
        console.log(`Sub_Notification_Ans_Corner_SetNum_0900 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Corner_SetNum_1000
     * @tc.name: setBadgeNumber()
     * @tc.desc: verify the promise function of setBadgeNumber
     */
    it('Sub_Notification_Ans_Corner_SetNum_1000', Level.LEVEL0, async (done: Function) => {
      try {
        await notificationManager.setBadgeNumber(10).then(() => {
          console.log("Sub_Notification_Ans_Corner_SetNum_1000 success")
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError) => {
          console.log(`Sub_Notification_Ans_Corner_SetNum_1000 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(true).assertTrue()
              done()
            }else{
              expect(false).assertTrue()
              done()
            }

        })
      } catch (err) {
        console.log(`Sub_Notification_Ans_Corner_SetNum_1000 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })
  })
}