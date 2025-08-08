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

import notification from '@ohos.notification';

import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY,MatchPattern,
  DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level } from '@ohos/hypium';
import { logGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';

export default function ActsNotificationRequestTest() {
  describe('SUB_NOTIFICATION_ANS_REQUEST_TEST', () => {
    const TAG = 'SUB_NOTIFICATION_ANS_REQUEST_TEST ===>';
    let log = logGenerator(TAG);
    log('SUB_NOTIFICATION_ANS_REQUEST_TEST START');

    /*
     * @tc.number    : Sub_Notification_Ans_Notification_Request_0100
     * @tc.name      : function requestEnableNotification(callback): void
     * @tc.desc      : requestEnableNotification click allowed
     */
    it('Sub_Notification_Ans_Publish_Publish_0900', Level.LEVEL1, async (done: () => void) => {
      let fn = async (resolve: () => void, reject: (arg1: Error) => void): Promise<void> => {
        let exit = exitGenerator(TAG, reject);
        notification.requestEnableNotification(async (err) => {
          log(`come in requestEnableNotification`);
          if (err.code) {
            exit(`requestEnableNotification err: ${err.code}`);
            return;
          }
          log(`requestEnableNotification success`);
          resolve();
          done();
        });
        await sleep(1500);
        let driver = await UiDriver.create();
        await sleep(1500)
        log(`driver is ${JSON.stringify(driver)}`);
        let button = await driver.findComponent(BY.text('允许'));
        log(`button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await sleep(1500);
          await button.click();
        } else {
          exit('null button');
        }
      };
      return new Promise<void>((resolve, reject) => { fn(resolve, reject) });
    });
  });
};
