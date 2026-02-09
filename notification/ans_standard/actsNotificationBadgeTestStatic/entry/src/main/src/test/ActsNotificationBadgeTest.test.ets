/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import notificationManager from '@ohos.notificationManager'
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let testAbilityContext: common.UIAbilityContext;
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundle_name: string = "com.example.badgetest.static"

export default function ActsNotificationBadgeTest() {
  describe('ActsNotificationBadgeTest', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test START')

    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll end');

      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      console.info(`button1 is ${JSON.stringify(button1)}`);
      if (button1 !== null) {
        await Utils.msSleep(1000);
        await button1.click();
        await Utils.msSleep(1000);
      } else {
        console.info('null button1');
      }
      notificationManager.requestEnableNotification(testAbilityContext).then(() => {
        console.info(`${TAG} requestEnableNotification succeeded`);
      }).catch((err: Error) :void=> {
        console.info(`${TAG} requestEnableNotification err: `+ JSON.stringify(err));
        expect(err).assertNull()
      });
      await Utils.msSleep(1500)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TAG} button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await Utils.msSleep(1000);
        await button.click();
        await Utils.msSleep(1000);

      } else {
        console.info('${TAG} null button');
        expect(button).assertContain('允许')
      }

    })

     /**
      * @tc.number  Sub_Notification_Ans_Corner_Query_Static_0004
      * @tc.name    Sub_Notification_Ans_Corner_Query_Static_0004
      * @tc.desc    non-system application invokes the onBadgeNumberQuery and offBadgeNumberQuery interfaces.
      * @tc.size    MediumTest
      * @tc.type    Function
      * @tc.level   Level 2
      */
    it('Sub_Notification_Ans_Corner_Query_Static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG :string = "Sub_Notification_Ans_Corner_Query_Static_0004 "
      try{
        notificationManager.onBadgeNumberQuery(
          async (bundleOption: notificationManager.BundleOption) => {
            return 1;
          }
        );
      } catch(err: BusinessError) {
        hilog.info(0x0000, TAG, `onBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202)
      }
      await Utils.msSleep(500)
      try{
        notificationManager.offBadgeNumberQuery();
      } catch(err: BusinessError) {
        hilog.info(0x0000, TAG, `offBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202)
        console.info(TAG + "Sub_Notification_Ans_Corner_Query_0004 PASS");
        done()
      }
    })
    
    /**
     * @tc.name   Sub_Notification_Ans_Corner_SetNum_Static_0900
     * @tc.number Sub_Notification_Ans_Corner_SetNum_Static_0900
     * @tc.desc   verify the callback function of setBadgeNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Corner_SetNum_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        notificationManager.setBadgeNumber(10, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} Sub_Notification_Ans_Corner_SetNum_Static_0900 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(err.code == 801).assertTrue()
              done()
            }else{
              expect(false).assertTrue()
              done()
            }
          } else {
            console.info(`${TAG} Sub_Notification_Ans_Corner_SetNum_Static_0900 success`)
            expect(err).assertEqual(null);
            done();
          }
        })
      } catch (err:BusinessError) {
        console.info(`${TAG} Sub_Notification_Ans_Corner_SetNum_Static_0900 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Corner_SetNum_Static_1000
     * @tc.number Sub_Notification_Ans_Corner_SetNum_Static_1000
     * @tc.desc   verify the promise function of setBadgeNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Corner_SetNum_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let count: int = 0;
      try {
        notificationManager.setBadgeNumber(10).then(() => {
          console.info(`${TAG} Sub_Notification_Ans_Corner_SetNum_Static_1000 success`)
          count++;
          expect(count).assertEqual(1);
          done();
        }).catch((err: Error) :void => {
          console.info(`${TAG} Sub_Notification_Ans_Corner_SetNum_Static_1000 failed, error code: ${err.code}, message: ${err.message}`)
          if(err.code == 801){
            expect(err.code == 801).assertTrue()
            done()
          }else{
            expect(false).assertTrue()
            done()
          }

        })
      } catch (err:BusinessError) {
        console.info(`${TAG} Sub_Notification_Ans_Corner_SetNum_Static_1000 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })
  })
}