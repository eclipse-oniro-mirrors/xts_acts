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
import { common } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
let ctx = getContext(this) as common.UIAbilityContext;

export default function ActsNotificationBadgeTest() {
  describe('SUB_NOTIFICATION_ANS_BADGE_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test START')
    beforeAll(async (done: Function) => {
      await sleep(1500);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      console.info(`button1 is ${JSON.stringify(button1)}`);
        if (button1 !== null) {
          await sleep(1000);
          await button1.click();
          await sleep(1000);
        } else {
          console.info('null button1');
        }
      notificationManager.requestEnableNotification(ctx).then(() => {
        console.info(`${TAG} requestEnableNotification succeeded`);
      }).catch((err: Error) => {
        console.info(`${TAG} requestEnableNotification err: `+ JSON.stringify(err));
        expect(err).assertNull()
        done()
      });
      await sleep(1500)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TAG} button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
        done()
      } else {
        console.info('${TAG} null button');
        expect(button).assertContain('允许')
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Corner_Query_0004
     * @tc.name    Sub_Notification_Ans_Corner_Query_0004
     * @tc.desc    non-system application invokes the onBadgeNumberQuery and offBadgeNumberQuery interfaces.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Corner_Query_0004', Level.LEVEL2, async (done: Function) => {
      TAG = TAG + "Sub_Notification_Ans_Corner_Query_0004 "
      try{
        notificationManager.onBadgeNumberQuery(
          async (bundleOption: notificationManager.BundleOption) => {
            return 1;
          }
        );
      } catch(err) {
        hilog.info(0x0000, TAG, `onBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202)
      }
      await sleep(500)
      try{
        notificationManager.offBadgeNumberQuery();
      } catch(err) {
        hilog.info(0x0000, TAG, `offBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202)
        console.info(TAG + "Sub_Notification_Ans_Corner_Query_0004 PASS");
        done()
      }
    })


    /**
     * @tc.name   Sub_Notification_Ans_Corner_SetNum_0900
     * @tc.number Sub_Notification_Ans_Corner_SetNum_0900
     * @tc.desc   verify the callback function of setBadgeNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Corner_SetNum_0900', Level.LEVEL0, async (done: Function) => {
      let count :number = 0
      try {
        notificationManager.setBadgeNumber(10, (err) => {
          if (err) {
            console.log(`Sub_Notification_Ans_Corner_SetNum_0900 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(err.code).assertEqual(801)
              done()
            }else{
              expect(false).assertTrue()
              done()
            }
          } else {
            count++
            console.log("Sub_Notification_Ans_Corner_SetNum_0900 success")
            expect(count).assertEqual(1)
            done();
          }
        })
      } catch (err) {
        console.log(`Sub_Notification_Ans_Corner_SetNum_0900 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Corner_SetNum_1000
     * @tc.number Sub_Notification_Ans_Corner_SetNum_1000
     * @tc.desc   verify the promise function of setBadgeNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Corner_SetNum_1000', Level.LEVEL0, async (done: Function) => {
      let count :number = 0
      try {
        await notificationManager.setBadgeNumber(10).then(() => {
          count++
          console.log("Sub_Notification_Ans_Corner_SetNum_1000 success")
          expect(count).assertEqual(1)
          done();
        }).catch((err: BusinessError) => {
          console.log(`Sub_Notification_Ans_Corner_SetNum_1000 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(err.code).assertEqual(801)
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