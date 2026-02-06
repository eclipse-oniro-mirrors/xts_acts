/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: int = 0x0000;
let tag: string = 'testTag';

let context: common.UIAbilityContext | undefined;

export default function actsNotificationThirdPartyWatchWithoutAbilityTest() {

  describe("actsNotificationThirdPartyWatchWithoutAbilityTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.withoutAbility.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    });


    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1002
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1002
     * @tc.desc       test openSubscriptionSettings App Not Implement NotificationSubscriberExtensionAbility 1600023
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1002";
        let NAME = "openSubscriptionSettings";
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await notificationExtensionSubscription.openSubscriptionSettings(context!)
            .then(() => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(1600023);
              done();
            }
            })
        } catch (err) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })
  })
}