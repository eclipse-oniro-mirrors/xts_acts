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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { logGenerator, succeedGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';

import common from '@ohos.app.ability.common';

let ctx = getContext(this) as common.UIAbilityContext;

export default function ActsAllowTest() {
  describe('SUB_ACTS_ALLOW_TEST', () => {
    const TAG = 'SUB_ACTS_ALLOW_TEST ===>';
    let log = logGenerator(TAG);
    log('SUB_ACTS_ALLOW_TEST START');

    /*
     * @tc.number    : Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_0100
     * @tc.name      : function requestEnableNotification(context): Promise<void>
     * @tc.desc      : requestEnableNotification allow button is clicked
     */
    it('Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_0100', 0,
      async (done: () => void) => {
        let fn = async (resolve: () => void, reject: (arg1: Error) => void): Promise<void> => {
          let succeed = succeedGenerator(TAG, resolve, done);
          let exit = exitGenerator(TAG, reject);
          notificationManager.requestEnableNotification(ctx).then(() => {
            succeed(`requestEnableNotification succeeded`);
          }).catch((err: Error) => {
            exit(`requestEnableNotification err: JSON.stringify(err)`);
          });
          await sleep(1500);
          let driver = Driver.create();
          await sleep(1500)
          let button = await driver.findComponent(ON.text('允许'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await sleep(1500);
            await button.click();
            done()
          } else {
            exit('null button');
          }
        };
        return new Promise<void>((resolve, reject) => {
          fn(resolve, reject);
        });
      }
    );

    /*
    * @tc.number    : Sub_Notification_Ans_OpenNotification_Settings_0004
    * @tc.name      : 【openNotificationSettings】非系统应用调用openNotificationSettings接口拉起设置页面
    * @tc.desc      : 非系统应用调用openNotificationSettings接口拉起设置页面
    */
    it('Sub_Notification_Ans_OpenNotification_Settings_0004', 0,
      async (done: () => void) => {
        let fn = async (resolve: () => void, reject: (arg1: Error) => void): Promise<void> => {
          let succeed = succeedGenerator(TAG, resolve, done);
          let exit = exitGenerator(TAG, reject);
          notificationManager.openNotificationSettings(ctx).then(() => {
            succeed(`openNotificationSettings succeeded`);
          }).catch((err: Error) => {
            exit(`openNotificationSettings err: JSON.stringify(err)`);
          })
          await sleep(1500);
          let driver = Driver.create();
          await sleep(1500)
          let button = await driver.findComponent(ON.text('通知管理'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            done()
          } else {
            exit('找不到通知管理');
          }
        };
        return new Promise<void>((resolve, reject) => {
          fn(resolve, reject);
        });
      }
    );
  });

};
