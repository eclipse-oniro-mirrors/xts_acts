/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import reminderAgentManager from '@ohos.reminderAgentManager'
import hilog from '@ohos.hilog'
import { Component,Driver,ON,On,MatchPattern,MouseButton,WindowMode,UIElementInfo,UiDirection,PointerMatrix,DisplayRotation } from '@ohos.UiTest'
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsReminderAgentManagerErrorCodeStaticTest() {
  describe('ActsReminderAgentManagerErrorCodeStaticTest', () => {


    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })


    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003
     * @tc.desc   test cancelReminder callback function errorCode is 1700003
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        reminderAgentManager.cancelAllReminders().then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003 cancelAllReminders promise")
        }).catch((err: Error) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003 promise err code:" + err?.code + " message:" + err?.message);
        });
        const reminderId: int = 1231;
        try {
          reminderAgentManager.cancelReminder(reminderId, (err: BusinessError | null) => {
            if (err?.code) {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003 cancelReminder callback err code:" + err?.code + " message:" + err?.message);
              expect(err?.code == 1700003).assertTrue();
              done();
            } else {
              console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003 cancelReminder callback");
              expect(false).assertTrue();
              done();
            }
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_003 cancelReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004
     * @tc.desc   Test cancelReminder promise function errorCode is 1700003
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        reminderAgentManager.cancelAllReminders().then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004 cancelAllReminders promise")
        }).catch((err: Error) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004 promise err code:" + err?.code + " message:" + err?.message);
        });
        const reminderId: int = 1231;
        try {
          reminderAgentManager.cancelReminder(reminderId).then(() => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004 cancelReminder promise");
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004 promise err code:" + err.code + " message:" + err.message);
            expect(err.code == 1700003).assertTrue();
            done();
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_004 cancelReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005
     * @tc.desc   Test addExcludeDate function errorCode is 1700003
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        reminderAgentManager.cancelAllReminders().then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005 cancelAllReminders promise")
        }).catch((err: Error) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005 promise err code:" + err?.code + " message:" + err?.message);
        });
        const reminderId: int = 1231;
        let date: Date = new Date();
        try {
          reminderAgentManager.addExcludeDate(reminderId, date).then(() => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005 addExcludeDate promise");
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005 promise err code:" + err.code + " message:" + err.message);
            expect(err.code == 1700003).assertTrue();
            done();
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_005 addExcludeDate error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006
     * @tc.desc   Test deleteExcludeDates function errorCode is 1700003
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        reminderAgentManager.cancelAllReminders().then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006 cancelAllReminders promise")
        }).catch((err: Error) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006 promise err code:" + err?.code + " message:" + err?.message);
        });
        const reminderId: int = 1231;
        try {
          reminderAgentManager.deleteExcludeDates(reminderId).then(() => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006 addExcludeDate promise");
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006 promise err code:" + err.code + " message:" + err.message);
            expect(err.code == 1700003).assertTrue();
            done();
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_006 deleteExcludeDates error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007
     * @tc.desc   Test getExcludeDates function errorCode is 1700003
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        reminderAgentManager.cancelAllReminders().then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007 cancelAllReminders promise")
        }).catch((err: Error) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007 promise err code:" + err?.code + " message:" + err?.message);
        });
        const reminderId: int = 1231;
        try {
          reminderAgentManager.getExcludeDates(reminderId).then(() => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007 addExcludeDate promise");
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007 promise err code:" + err.code + " message:" + err.message);
            expect(err.code == 1700003).assertTrue();
            done();
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_007 getExcludeDates error.code:" + error.code);
        }
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008
     * @tc.desc   test updateReminder promise function with reminderId is not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('----------------------SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008---------------------------');
      reminderAgentManager.cancelAllReminders().then(() => {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008 cancelAllReminders promise")
      }).catch((err) => {
        console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008 promise err code:" + err.code + " message:" + err.message);
        expect(false).assertTrue()
      });
      const reminderId = 1231;
      let timer: reminderAgentManager.ReminderRequestTimer = {
        reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 10
      }
      try {
        reminderAgentManager.updateReminder(reminderId, timer).then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008 update reminder succeed");
          expect(false).assertTrue();
        }).catch((err) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008 promise err code:" + err.code + " message:" + err.message);
          expect(err.code).assertEqual(1700003);
          done();
        });
      } catch (error) {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_008 publishReminder error.code:" + error.code);
      }
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009
     * @tc.desc   test updateReminder promise function with reminderId is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('----------------------SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009---------------------------');
      reminderAgentManager.cancelAllReminders().then(() => {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009 cancelAllReminders promise")
      }).catch((err) => {
        console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009 promise err code:" + err.code + " message:" + err.message);
        expect(false).assertTrue()
      });
      const reminderId = -1;
      let timer: reminderAgentManager.ReminderRequestTimer = {
        reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 10
      }
      try {
        reminderAgentManager.updateReminder(reminderId, timer).then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009 update reminder succeed");
          expect(false).assertTrue();
        }).catch((err) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009 promise err code:" + err.code + " message:" + err.message);
          expect(err.code).assertEqual(1700007);
          done();
        });
      } catch (error) {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_009 publishReminder error.code:" + error.code);
      }
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010
     * @tc.desc   test cancelReminderOnDisplay promise function with reminderId is -1 and errCode is 1700007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('----------------------SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010---------------------------');
      reminderAgentManager.cancelAllReminders().then(() => {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010 cancelAllReminders promise")
      }).catch((err) => {
        console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010 promise err code:" + err.code + " message:" + err.message);
        expect(false).assertTrue()
      });
      const reminderId = -1;
      try {
        reminderAgentManager.cancelReminderOnDisplay(reminderId).then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010 update reminder succeed");
          expect(false).assertTrue();
        }).catch((err) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010 promise err code:" + err.code + " message:" + err.message);
          expect(err.code).assertEqual(1700007);
          done();
        });
      } catch (error) {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_010 cancelReminderOnDisplay error.code:" + error.code);
      }
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011
     * @tc.desc   test cancelReminderOnDisplay promise function with reminderId is 1221 and errCode is 1700003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('----------------------SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011---------------------------');
      reminderAgentManager.cancelAllReminders().then(() => {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011 cancelAllReminders promise")
      }).catch((err) => {
        console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011 promise err code:" + err.code + " message:" + err.message);
        expect(false).assertTrue()
      });
      const reminderId = 1221;
      try {
        reminderAgentManager.cancelReminderOnDisplay(reminderId).then(() => {
          console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011 reminderErrorCode_1000 update reminder succeed");
          expect(false).assertTrue();
        }).catch((err) => {
          console.error("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011 promise err code:" + err.code + " message:" + err.message);
          expect(err.code).assertEqual(1700003);
          done();
        });
      } catch (error) {
        console.log("SUB_RESOURCESCHEDULE_REMINDER_ERR_TASK_STATIC_XTS_011 cancelReminderOnDisplay error.code:" + error.code);
      }
    })

  })
}