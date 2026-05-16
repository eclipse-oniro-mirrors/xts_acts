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

import notificationManager from '@ohos.notificationManager';

import { Driver, ON } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level } from '@ohos/hypium';
import { logGenerator, succeedGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';

import common from '@ohos.app.ability.common';

let ctx = getContext(this) as common.UIAbilityContext;

export default function ActsCallbackTest() {
  describe('SUB_ACTS_CALLBACK_TEST', () => {
    const TAG = 'SUB_ACTS_CALLBACK_TEST ===>';
    let log = logGenerator(TAG);
    log('SUB_ACTS_CALLBACK_TEST START');

    /**
     * @tc.name   Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_0100
     * @tc.number Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_0100
     * @tc.desc   requestEnableNotification allowed button is clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_0100', Level.LEVEL2,
      async (done: () => void) => {
        let fn = async (resolve: () => void, reject: (arg1: Error) => void): Promise<void> => {
          let succeed = succeedGenerator(TAG, resolve, done);
          let exit = exitGenerator(TAG, reject);
          notificationManager.requestEnableNotification(ctx, (err) => {
            if (err) {
              exit(`requestEnableNotification err: JSON.stringify(err)`);
              return;
            };
            succeed(`requestEnableNotification succeeded`);
          });
          await sleep(1500);
          let driver = Driver.create();
          await sleep(1500)
          let button = await driver.findComponent(ON.text('允许'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await sleep(1500);
            await button.click();
            done();
          } else {
            exit('null button');
          }
        };
        return new Promise<void>((resolve, reject) => { fn(resolve, reject); });
      }
    );
  });
};
