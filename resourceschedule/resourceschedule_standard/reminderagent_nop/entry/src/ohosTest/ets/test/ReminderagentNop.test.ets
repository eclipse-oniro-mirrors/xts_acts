/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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

    /*
     * @tc.number:SUB_getAllValidReminders001
     * @tc.name: SUB_getAllValidReminders001
     * @tc.desc:Using the publishReminder then method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SUB_getAllValidReminders001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_getAllValidReminders001----before----');
      reminderAgentManager.getAllValidReminders().then((reminders: Array<reminderAgentManager.ReminderInfo>) => {
      console.log("promise, getAllValidReminders length = " + reminders.length);
      for (let i = 0; i < reminders.length; i++) {
        console.log("getAllValidReminders, reminderId = " + reminders[i].reminderId);
        console.log("getAllValidReminders, reminderType = " + reminders[i].reminderReq.reminderType);
        const actionButton = reminders[i].reminderReq.actionButton || [];
        for (let j = 0; j < actionButton.length; j++) {
          console.log("getAllValidReminders, actionButton.title = " + actionButton[j]?.title);
          console.log("getAllValidReminders, actionButton.type = " + actionButton[j]?.type);
        }
      }
      }).catch((err: BusinessError) => {
        console.error("SUB_getAllValidReminders001 promise err code:" + err.code + " message:" + err.message);
        expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
        });
        console.info('--------SUB_getAllValidReminders001----after----');
    })

    /*
     * @tc.number:SUB_addExcludeDate001
     * @tc.name: SUB_addExcludeDate001
     * @tc.desc:Using the publishReminder then method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SUB_addExcludeDate001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_getAllValidSUB_addExcludeDate001Reminders001----before----');
      let reminderId: number = 1;
      let date = new Date();
      reminderAgentManager.addExcludeDate(reminderId, date).then(() => {
        console.log("SUB_addExcludeDate001 addExcludeDate promise");
      }).catch((err: BusinessError) => {
        console.error("SUB_addExcludeDate001 promise err code:" + err.code + " message:" + err.message);
        expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      });
        console.info('--------SUB_addExcludeDate001----after----');
    })

    /*
     * @tc.number:SUB_getExcludeDates001
     * @tc.name: SUB_getExcludeDates001
     * @tc.desc:Using the publishReminder then method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SUB_getExcludeDates001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_getAllValidSUB_getExcludeDatese001Reminders001----before----');
      let reminderId: number = 1;
      reminderAgentManager.getExcludeDates(reminderId).then((dates) => {
      console.log("SUB_getExcludeDates001 getExcludeDates promise length: " + dates.length);
      for (let i = 0; i < dates.length; i++) {
	      console.log("SUB_getExcludeDates001 getExcludeDates promise date is: " + dates[i].toString());
      }
      }).catch((err: BusinessError) => {
        console.error("SUB_getExcludeDates001 promise err code:" + err.code + " message:" + err.message);
        expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      });
        console.info('--------SUB_getExcludeDates001----after----');
    })

    /*
     * @tc.number:SUB_deleteExcludeDates001
     * @tc.name: SUB_deleteExcludeDates001
     * @tc.desc:Using the deleteExcludeDates then method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SUB_deleteExcludeDates001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_deleteExcludeDates001----before----');
      let reminderId: number = 1;
      reminderAgentManager.deleteExcludeDates(reminderId).then(() => {
        console.log("SUB_deleteExcludeDates001 deleteExcludeDates promise");
      }).catch((err: BusinessError) => {
        console.error("SUB_deleteExcludeDates001 promise err code:" + err.code + " message:" + err.message);
        expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      });
        console.info('--------SUB_deleteExcludeDates001----after----');
    })

    /*
     * @tc.number:SUB_updateReminder001
     * @tc.name: SUB_updateReminder001
     * @tc.desc:Using the updateReminder then method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SUB_updateReminder001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_updateReminder001----before----');
      let reminderId: number = 1;
      let timer: reminderAgentManager.ReminderRequestTimer = {
        reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 10
      }
      reminderAgentManager.updateReminder(reminderId, timer).then(() => {
        console.log("SUB_updateReminder001 updateReminder promise");
      }).catch((err: BusinessError) => {
        console.error("SUB_updateReminder001 promise err code:" + err.code + " message:" + err.message);
        expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      });
        console.info('--------SUB_updateReminder001----after----');
    })
    
  })
}

