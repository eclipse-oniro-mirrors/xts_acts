/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import reminderAgentManager from '@ohos.reminderAgentManager';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function publishReminderNopTest() {
  describe('publishReminderNopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number:SUB_publishReminderNop001
     * @tc.name: publishReminderNop001
     * @tc.desc:Using the publishReminder callback method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("publishReminderNop001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------publishReminderNop001----before----');
      let timer: reminderAgentManager.ReminderRequestTimer = {
        reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 10
      }

      reminderAgentManager.publishReminder(timer, (err: BusinessError, reminderId: number) => {
        if (err.code) {
          console.error(`publishReminderNop001 fail, promise: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          console.log("callback, reminderId = " + reminderId);
        }
      });
      console.info('--------publishReminderNop001----after----');
    })

    /*
     * @tc.number:SUB_publishReminderNop002
     * @tc.name: publishReminderNop002
     * @tc.desc:Using the publishReminder then method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("publishReminderNop002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------publishReminderNop002----before----');
      let timer: reminderAgentManager.ReminderRequestTimer = {
        reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 10
      }

      reminderAgentManager.publishReminder(timer).then((reminderId: number) => {
        console.log("promise, reminderId = " + reminderId);
      }).catch((err: BusinessError) => {
        console.error("promise err code:" + err.code + " message:" + err.message);
        expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      });
      console.info('--------publishReminderNop002----after----');
    })
  })
}

