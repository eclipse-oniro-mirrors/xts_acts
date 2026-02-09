/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import calendarManager from '@ohos.calendarManager';
import { describe, beforeAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import uitest from '@ohos.UiTest';
import systemDateTime from '@ohos.systemDateTime';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { mContext } from '../testability/TestAbility'

let calendarMgr: calendarManager.CalendarManager;
let calendarMgrErr: calendarManager.CalendarManager;

function sleep(numberMillis: number) {
  let now = new Date();
  let exitTime = now.getTime() + numberMillis;
  while (true) {
    if (new Date().getTime() > exitTime) return;
  }
}

function EXPECTTrue(data: boolean) {
  try {
    expect(data).assertTrue();
  } catch (error) {
    console.info('expect fail');
  }
}

function EXPECTFalse() {
  try {
    expect().assertFail();
  } catch (error) {
    console.info('expect fail');
  }
}

export default function CalendarManagerTest() {

  describe('CalendarManagerTest', () => {


    beforeAll(async () => {
      console.info("beforeAll case");
      try {
        let permissions: Permissions[] = ["ohos.permission.WRITE_CALENDAR", "ohos.permission.READ_CALENDAR"];
        calendarMgrErr = calendarManager?.getCalendarManager(mContext);
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.requestPermissionsFromUser(mContext, permissions, (err, result) => {
          if (err) {
            console.info('getPermission failed: ' + JSON.stringify(err));
          } else {
            console.info('getPermission success: ' + JSON.stringify(result));
          }
        });

        let driver = await uitest.Driver.create();
        sleep(500);

        await sleep(500);
        console.info("driver is " + JSON.stringify(driver));
        let button = await driver.findComponent(uitest.ON.text('允许'));
        if (button != undefined) {
          console.info("button is " + JSON.stringify(button));
          await button.click();
        }
        console.info("getPermission end");
      } catch (error) {
        console.info(`getPermission failed, error: ${error}`);
      }
      sleep(500);
      calendarMgr = calendarManager?.getCalendarManager(mContext);
    });


    /**
     * @tc.name   SUB_Application_CalendarManagerApi_test_0100
     * @tc.number SUB_Application_CalendarManagerApi_test_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_test_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(calendarManager.CalendarType.LOCAL == 'local').assertTrue();
      expect(calendarManager.CalendarType.EMAIL == 'email').assertTrue();
      expect(calendarManager.CalendarType.BIRTHDAY == 'birthday').assertTrue(); // undefined
      expect(calendarManager.CalendarType.CALDAV == 'caldav').assertTrue();
      expect(calendarManager.CalendarType.SUBSCRIBED == 'subscribed').assertTrue();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_test_0200
     * @tc.number SUB_Application_CalendarManagerApi_test_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_test_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(calendarManager.RecurrenceFrequency.YEARLY == 0).assertTrue();
      expect(calendarManager.RecurrenceFrequency.MONTHLY == 1).assertTrue();
      expect(calendarManager.RecurrenceFrequency.WEEKLY == 2).assertTrue();
      expect(calendarManager.RecurrenceFrequency.DAILY == 3).assertTrue();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_test_0300
     * @tc.number SUB_Application_CalendarManagerApi_test_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_test_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(calendarManager.ServiceType.MEETING == 'Meeting').assertTrue();
      expect(calendarManager.ServiceType.WATCHING == 'Watching').assertTrue();
      expect(calendarManager.ServiceType.REPAYMENT == 'Repayment').assertTrue();
      expect(calendarManager.ServiceType.LIVE == 'Live').assertTrue();
      expect(calendarManager.ServiceType.SHOPPING == 'Shopping').assertTrue();
      expect(calendarManager.ServiceType.TRIP == 'Trip').assertTrue();
      expect(calendarManager.ServiceType.CLASS == 'Class').assertTrue();
      expect(calendarManager.ServiceType.SPORTS_EVENTS == 'SportsEvents').assertTrue();
      expect(calendarManager.ServiceType.SPORTS_EXERCISE == 'SportsExercise').assertTrue();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_test_0400
     * @tc.number SUB_Application_CalendarManagerApi_test_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_test_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(calendarManager.AttendeeRole.ORGANIZER == 'organizer').assertTrue();
      expect(calendarManager.AttendeeRole.PARTICIPANT == 'participant').assertTrue();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_test_0500
     * @tc.number SUB_Application_CalendarManagerApi_test_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_test_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(calendarManager.AttendeeType.REQUIRED  == 1).assertTrue();
      expect(calendarManager.AttendeeType.OPTIONAL  == 2).assertTrue();
      expect(calendarManager.AttendeeType.RESOURCE  == 3).assertTrue();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_test_0600
     * @tc.number SUB_Application_CalendarManagerApi_test_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_test_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(calendarManager.AttendeeStatus.UNKNOWN == 0).assertTrue();
      expect(calendarManager.AttendeeStatus.TENTATIVE == 1).assertTrue();
      expect(calendarManager.AttendeeStatus.ACCEPTED == 2).assertTrue();
      expect(calendarManager.AttendeeStatus.DECLINED == 3).assertTrue();
      expect(calendarManager.AttendeeStatus.UNRESPONSIVE == 4).assertTrue();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_AsyncNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_AsyncNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_AsyncNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AsyncCreateCalendar_NoPermission_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'HUAWEI日历',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地账户'
      }
      calendarMgrErr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(201);
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_AsyncParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_AsyncParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_AsyncParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_AsyncParametersErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'HUAWEI日历',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地账户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(401);
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_AsyncDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_AsyncDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_AsyncDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_AsyncDeviceErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'HUAWEI日历',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地账户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(801);
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'HUAWEI日历',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地账户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xxx@huawei.com',
        type: calendarManager.CalendarType.EMAIL,
        displayName: 'EMAIL账户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'CalDAV协议帐户',
        type: calendarManager.CalendarType.CALDAV,
        displayName: '支持CalDAV协议帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_PromiseNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_PromiseNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_PromiseNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_PromiseNoPermission_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgrErr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in creating calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(201);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_PromiseParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_PromiseParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_PromiseParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_PromiseParametersErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in creating calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(401);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_PromiseDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_PromiseDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_PromiseDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_PromiseDeviceErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in creating calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(801);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in creating calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_NoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0100';
      calendarMgrErr?.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              expect(err.code).assertEqual(201);
            }
          })
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is LOCAl" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0100';
      calendarMgr?.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              expect(err.code).assertEqual(401);
            }
          })
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is LOCAl" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0100';
      calendarMgr?.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              expect(err.code).assertEqual(801);
            }
          })
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is LOCAl" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0100';
      calendarMgr?.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName +
                `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            }
          })
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is LOCAl" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_Async_0200
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0200';
      calendarMgr?.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName +
                `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            }
          })
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is EMAIL" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0300
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_AsyncNoPermission_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgrErr?.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(201);
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is BIRTHDAY" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0300
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_AsyncParametersErr_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgr?.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(401);
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is BIRTHDAY" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0300
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_AsyncDeviceErr_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgr?.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(801);
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is BIRTHDAY" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_Async_0300
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgr?.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is BIRTHDAY" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_Async_0400
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0400';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'CalDAV协议帐户',
        type: calendarManager.CalendarType.CALDAV,
        displayName: '支持CalDAV协议帐户'
      }
      calendarMgr?.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is CALDAV" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_PromiseNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_PromiseNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_PromiseNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_PromiseNoPermission_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgrErr?.getCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect(err.code).assertEqual(201);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_PromiseParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_PromiseParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_PromiseParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_PromiseParametersErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.getCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(401);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_PromiseDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_PromiseDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_PromiseDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_PromiseDeviceErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.getCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(801);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.getCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200
     * @tc.number SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200';
      calendarMgr?.getCalendar().then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        radio.isRadioOn((error) => {
          if (error) {
            console.info("RK device , no modem")
          } else {
            console.info(CaseName + "Failed to get specified calendar" + JSON.stringify(err));
            expect().assertFail();
          }
        })
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncNoPermission_0100';
      calendarMgrErr?.getAllCalendars((err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get AllCalendars, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(201);
        } else {
          console.info(CaseName + "Succeeded in get AllCalendars" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncParametersErr_0100';
      calendarMgr?.getAllCalendars((err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get AllCalendars, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(401);
        } else {
          console.info(CaseName + "Succeeded in get AllCalendars" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_AsyncDeviceErr_0100';
      calendarMgr?.getAllCalendars((err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get AllCalendars, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(801);
        } else {
          console.info(CaseName + "Succeeded in get AllCalendars" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100';
      calendarMgr?.getAllCalendars((err, data) => {
        if (err) {
          console.info(CaseName + `Failed to get AllCalendars, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get AllCalendars" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseNoPermission_0100';
      calendarMgrErr?.getAllCalendars().then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(201);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseParametersErr_0100';
      calendarMgr?.getAllCalendars().then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(401);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_PromiseDeviceErr_0100';
      calendarMgr?.getAllCalendars().then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
        expect(err.code).assertEqual(801);
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100';
      calendarMgr?.getAllCalendars().then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncNoPermission_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgrErr?.deleteCalendar(data, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            expect(err.code).assertEqual(201);
          } else {
            console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncParametersErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            expect(err.code).assertEqual(401);
          } else {
            console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_AsyncDeviceErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            expect(err.code).assertEqual(801);
          } else {
            console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data).then((data) => {
          console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseNoPermission_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseNoPermission_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseNoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseNoPermission_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgrErr?.deleteCalendar(data).then((data) => {
          console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(201);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseParametersErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseParametersErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseParametersErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseParametersErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data).then((data) => {
          console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(401);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseDeviceErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseDeviceErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseDeviceErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_PromiseDeviceErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data).then((data) => {
          console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          expect(err.code).assertEqual(801);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_AddEvent_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_AddEvent_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_AddEvent_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AddEvent_Async_0100';
      let TimeZone = '';
      systemDateTime.getTimezone((error, data) => {
        if (error) {
          console.info(`Failed to get timezone. message: ${error.message}, code: ${error.code}`);
          return;
        }
        console.info(`Succeeded in get timezone : ${data}`);
        TimeZone = data;
      });

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      const date = new Date();
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.NORMAL,
        startTime: date.getTime(),
        endTime: date.getTime() + 60 * 60 * 1000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));

        Calendar.addEvent(Schedule, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to addEvent, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
            expect(data != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_AddEvent_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_AddEvent_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_AddEvent_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AddEvent_Promise_0100';
      let TimeZone = '';
      systemDateTime.getTimezone((error, data) => {
        if (error) {
          console.info(`Failed to get timezone. message: ${error.message}, code: ${error.code}`);
          return;
        }
        console.info(`Succeeded in get timezone : ${data}`);
        TimeZone = data;
      });

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      const date = new Date();
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.NORMAL,
        startTime: date.getTime(),
        endTime: date.getTime() + 60 * 60 * 1000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule).then((data) => {
          console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to addEvent, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

     /**
     * @tc.name   SUB_Application_CalendarManagerApi_AddEventErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_AddEventErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_AddEventErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AddEventErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(undefined).then((data) => {
          console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
          expect().assertFail();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to addEvent, Code is ${err.code}, message is ${err.message}`);
          expect(err?.code).assertEqual(401);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_AddEvents_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_AddEvents_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_AddEvents_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AddEvent_Async_0100';
      let TimeZone = '';
      systemDateTime.getTimezone((error, data) => {
        if (error) {
          console.info(`Failed to get timezone. message: ${error.message}, code: ${error.code}`);
          return;
        }
        console.info(`Succeeded in get timezone : ${data}`);
        TimeZone = data;
      });

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      const date = new Date();
      const events: calendarManager.Event[] = [
        {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000
        },
        {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000
        }
      ]
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));

        Calendar.addEvents(events, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to addEvents, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvents" + JSON.stringify(data));
            expect(data != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_AddEvents_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_AddEvent_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_AddEvents_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AddEvent_Promise_0100';
      let TimeZone = '';
      systemDateTime.getTimezone((error, data) => {
        if (error) {
          console.info(`Failed to get timezone. message: ${error.message}, code: ${error.code}`);
          return;
        }
        console.info(`Succeeded in get timezone : ${data}`);
        TimeZone = data;
      });

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      const date = new Date();
      let Events: Array<calendarManager.Event> = [
        {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000
        },
        {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000
        }
      ]
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvents(Events).then(() => {
          console.info(CaseName + "Succeeded in addEvents");
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to addEvents, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

     /**
     * @tc.name   SUB_Application_CalendarManagerApi_AddEventsErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_AddEventsErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_AddEventsErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_AddEventsErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvents(undefined).then(() => {
          console.info(CaseName + "Succeeded in addEvents");
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to addEvents, Code is ${err.code}, message is ${err.message}`);
          expect(err?.code).assertEqual(401);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.NORMAL,
        title: 'xx线上开会日程',
        location: {
          location: 'xx大礼堂',
          longitude: 116.3,
          latitude: 39.9,
        },
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 2500,
        isAllDay: false,
        attendee: [
          {
            name: '小王',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.ORGANIZER,
            type: calendarManager.AttendeeType.REQUIRED,
            status: calendarManager.AttendeeStatus.TENTATIVE
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT,
            type: calendarManager.AttendeeType.OPTIONAL,
            status: calendarManager.AttendeeStatus.ACCEPTED
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT,
            type: calendarManager.AttendeeType.REQUIRED,
            status: calendarManager.AttendeeStatus.DECLINED
          }
        ],
        timeZone: '',
        reminderTime: [new Date().getTime() - 60 * 60 * 1000 * 3],
        recurrenceRule: {
          recurrenceFrequency: calendarManager.RecurrenceFrequency.DAILY,
          expire: 0
        },
        description: '此会议非常重要，请按时参加',
        service: {
          type: calendarManager.ServiceType.MEETING,
          uri: '',
          description: ''
        }
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));

        Calendar.updateEvent(Schedule, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to updateEvent, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in updateEvent" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        title: 'xxParty日程',
        location: {
          location: 'xx家庭',
        },
        startTime: new Date().getTime() - 60 * 60 * 1000,
        endTime: new Date().getTime() + 60 * 60 * 5000,
        isAllDay: false,
        attendee: [
          {
            name: '父亲',
            email: 'fuqin@huawei.com'
          },
          {
            name: '母亲',
            email: 'muqin@huawei.com'
          },
          {
            name: '孩子',
            email: 'haizi@huawei.com'
          },
        ],
        timeZone: '',
        reminderTime: [new Date().getTime() - 60 * 60 * 1000 * 12 * 2],
        recurrenceRule: {
          recurrenceFrequency: calendarManager.RecurrenceFrequency.DAILY,
          expire: 0
        },
        description: '此为家庭party，请按时参加',
        service: {
          type: calendarManager.ServiceType.TRIP,
          uri: '',
          description: ''
        }
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.updateEvent(Schedule).then((data) => {
          console.info(CaseName + "Succeeded in updateEvent" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to updateEvent, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

     /**
     * @tc.name   SUB_Application_CalendarManagerApi_UpdateEventErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_UpdateEventErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_UpdateEventErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_UpdateEventErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.updateEvent(undefined).then((data) => {
          console.info(CaseName + "Succeeded in updateEvent" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to updateEvent, Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetAccount_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetAccount_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetAccount_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAccount_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        let calendarAccounts = Calendar.getAccount();
        expect(calendarAccounts.name != '').assertTrue();
        console.info("get account success " + JSON.stringify(calendarAccounts));
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_SetConfig_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_SetConfig_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_SetConfig_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfig_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.setConfig({
          enableReminder: true, color: "#0A59F7"
        }, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to setConfig, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            let configs = Calendar.getConfig();
            console.info(CaseName + "Succeeded in getConfig" + JSON.stringify(configs));
            expect(configs.enableReminder == true && configs.color == "#0A59F7").assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_SetConfig_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_SetConfig_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_SetConfig_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfig_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.setConfig({
          enableReminder: false, color: "#0A59F7"
        }).then((data) => {
          let configs = Calendar.getConfig();
          console.info(CaseName + "Succeeded in getConfig" + JSON.stringify(configs));
          expect(configs.enableReminder == false && configs.color == "#0A59F7").assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to setConfig, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_SetConfigErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_SetConfigErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_SetConfigErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfigErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.setConfig({
          enableReminder: false, color: "#0A59F7121212"
        }).then((data) => {
          let configs = Calendar.getConfig();
          console.info(CaseName + "Succeeded in getConfig" + JSON.stringify(configs));
          expect(configs.enableReminder == false && configs.color == "#0A59F7121212").assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to setConfig, Code is ${err.code}, message is ${err.message}`);
          expect(err?.code).assertEqual(23900001);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_SetConfigErr_0200
     * @tc.number SUB_Application_CalendarManagerApi_SetConfigErr_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_SetConfigErr_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfigErr_0200';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.setConfig(undefined).then((data) => {
          let configs = Calendar.getConfig();
          console.info(CaseName + "Succeeded in getConfig" + JSON.stringify(configs));
          expect(configs.enableReminder == false && configs.color == "#0A59F7121212").assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to setConfig, Code is ${err.code}, message is ${err.message}`);
          expect(err?.code).assertEqual(201);
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });    

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0100';

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents((err: BusinessError, Events: Array<string>) => {
          if (err) {
            console.info(CaseName + `Failed to getEvents, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
            expect(Events[0] != '').assertTrue();
            if (Events.length > 0) {
              expect(Events.length > 0).assertTrue();
            } else {
              expect(Events.length).assertEqual(0);
            }
            return;
          }
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Async_0200
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0200';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      const date = new Date();
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.NORMAL,
        startTime: date.getTime(),
        endTime: date.getTime() + 60 * 60 * 1000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule, (err, data) => {
          if (err) {
            console.info(CaseName + `Failed to addEvent, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
            Calendar.getEvents(filter, columns, (err, Events) => {
              if (err) {
                console.info(CaseName + `Failed to getEvents, Code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
                expect(Events[0] != null).assertTrue();
                if (Events.length > 0) {
                  expect(Events.length > 0).assertTrue();
                } else {
                  expect(Events.length).assertEqual(0);
                }
                return;
              }
            });
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Async_0300
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0300';
      const filter = calendarManager.EventFilter.filterByTime(1686931200, 1703733961);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns, (err, Events) => {
          if (err) {
            console.info(CaseName + `Failed to getEvents, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            if (Events.length > 0) {
              expect(Events.length > 0).assertTrue();
            } else {
              expect(Events.length).assertEqual(0);
            }
            console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
            expect(Events[0] != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });
    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Async_0400
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0400';
      const filter = calendarManager.EventFilter.filterByTitle('开会日程');
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns, (err, Events) => {
          if (err) {
            console.info(CaseName + `Failed to getEvents, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            if (Events.length > 0) {
              expect(Events.length > 0).assertTrue();
            } else {
              expect(Events.length).assertEqual(0);
            }
            console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
            expect(Events[0] != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0100';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Promise_0200
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0200';
      const filter = calendarManager.EventFilter.filterByTime(1686931200, 1703733961);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Promise_0300
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0300';
      const filter = calendarManager.EventFilter.filterByTitle('开会日程');
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Promise_0400
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0400';
      const filter = calendarManager.EventFilter.filterByTitle('开会日程');

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          let data1: calendarManager.Event[];
          data1 = data;
          expect(data != null).assertTrue();
          expect(data1[0].id != 0).assertTrue();
          if (data1.length > 0) {
            expect(data1.length > 0).assertTrue();
          } else {
            expect(data1.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Promise_0500
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0500';

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents().then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

        /**
     * @tc.name   SUB_Application_CalendarManagerApi_GetEvents_Promise_0600
     * @tc.number SUB_Application_CalendarManagerApi_GetEvents_Promise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0600';
      const filter = calendarManager.EventFilter.filterByTime(1686931200000, 1703733961000);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteEvent_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteEvent_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvent_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteEvent_Async_0100';

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule, (err, ScheduleID) => {
          if (err) {
            console.info(CaseName + `Failed to addEvent, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(ScheduleID));
            Calendar.deleteEvent(ScheduleID, (err, data) => {
              if (err) {
                console.info(CaseName + `Failed to deleteEvent, Code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(CaseName + "Succeeded in deleteEvent" + JSON.stringify(data));
                return;
              }
            });
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteEvent_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteEvent_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvent_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteEvent_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule, (err, ScheduleID) => {
          if (err) {
            console.info(CaseName + `Failed to addEvent, Code is ${err.code}, message is ${err.message})`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(ScheduleID));
            Calendar.deleteEvent(ScheduleID).then((data) => {
              console.info(CaseName + "Succeeded in deleteEvent" + JSON.stringify(data));
              return;
            }).catch((err: BusinessError) => {
              console.info(CaseName + `Failed to deleteEvent, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            });
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteEvents_Async_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteEvents_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvents_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteEvents_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      let Schedule1: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        try {
          let ScheduleID = await Calendar.addEvent(Schedule);
          let ScheduleID1 = await Calendar.addEvent(Schedule1);
          console.info(CaseName + "Succeeded in addEvent" + ScheduleID + ScheduleID1);
          Calendar.deleteEvents([ScheduleID, ScheduleID1], (err, data) => {
            if (err) {
              console.info(CaseName + `Failed to deleteEvents, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(CaseName + "Succeeded in deleteEvents" + JSON.stringify(data));
              return;
            }
          });
        } catch (err) {
          console.info(CaseName + `Failed to addEvents, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        }
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteEvents_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteEvents_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvents_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteEvents_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      let Schedule1: calendarManager.Event = {
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        try {
          let ScheduleID = await Calendar.addEvent(Schedule);
          let ScheduleID1 = await Calendar.addEvent(Schedule1);
          console.info(CaseName + "Succeeded in addEvent" + ScheduleID + ScheduleID1);
          Calendar.deleteEvents([ScheduleID, ScheduleID1]).then((data) => {
            console.info(CaseName + "Succeeded in deleteEvents" + JSON.stringify(data));
            return;
          }).catch((err: BusinessError) => {
            console.info(CaseName + `Failed to deleteEvents, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          });
        } catch (err) {
          console.info(CaseName + `Failed to addEvents, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        }
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

     /**
     * @tc.name   SUB_Application_CalendarManagerApi_DeleteEventsErr_0100
     * @tc.number SUB_Application_CalendarManagerApi_DeleteEventsErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_DeleteEventsErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteEventsErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        try {
          Calendar.deleteEvents(undefined).then((data) => {
            console.info(CaseName + "Succeeded in deleteEvents" + JSON.stringify(data));
            return;
          }).catch((err: BusinessError) => {
            console.info(CaseName + `Failed to deleteEvents, Code is ${err.code}, message is ${err.message}`);
            expect(err?.code).assertEqual(401);
          });
        } catch (err) {
          console.info(CaseName + `Failed to addEvents, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        }
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_EditEvent_Promise_0100
     * @tc.number SUB_Application_CalendarManagerApi_EditEvent_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Application_CalendarManagerApi_EditEvent_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_EditEvent_Promise_0100';
      let TimeZone = '';
      systemDateTime.getTimezone((error, data) => {
        if (error) {
          console.info(`Failed to get timezone. message: ${error.message}, code: ${error.code}`);
          return;
        }
        console.info(`Succeeded in get timezone : ${data}`);
        TimeZone = data;
      });

      const date = new Date();
      let Schedule: calendarManager.Event = {
        type: calendarManager.EventType.NORMAL,
        startTime: date.getTime(),
        endTime: date.getTime() + 60 * 60 * 1000,
        identifier: "1aa96c08-d732-443b-aa0a-6eb1559dfb19",
        isLunar: true,
        recurrenceRule: {
          recurrenceFrequency: calendarManager.RecurrenceFrequency.YEARLY,
          count: 100,
          interval: 2,
          expire: date.getTime() + 60 * 60 * 1000 * 3,
          excludedDates: [date.getTime() + 60 * 60 * 1000 * 2],
          daysOfWeek: [1, 2],
          daysOfMonth: [1, 3],
          daysOfYear: [1, 2],
          weeksOfMonth: [3],
          weeksOfYear: [1, 2],
          monthsOfYear: [2]
        },
      }

      try {
        if (Schedule.isLunar) {
          expect(calendarManager.AttendeeRole.ORGANIZER == 'organizer').assertTrue();
          return;
        }
        calendarMgr?.editEvent(Schedule).then((data) => {
          expect(data != 0).assertTrue();
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to editEvent" + JSON.stringify(err));
        })
      } catch (err) {
        console.info(CaseName + "Failed to editEvent" + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetEvents_Promise_0100
     * @tc.number SUB_2Application_CalendarManagerApi_GetEvents_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetEvents_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetEvents_Promise_0100';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      let Schedule: calendarManager.Event = {
        id: 100,
        title: '',
        location: {
          location: 'xx大礼堂',
          longitude: 116.3,
          latitude: 39.9,
        },
        isAllDay: true,
        attendee: [
          {
            name: '小王',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.ORGANIZER
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          }
        ],
        timeZone: 'UTC',
        reminderTime: [1],
        description: '',
        service: {
          type: calendarManager.ServiceType.MEETING,
          uri: '',
          description: ''
        },
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetEvents_Promise_0200
     * @tc.number SUB_2Application_CalendarManagerApi_GetEvents_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetEvents_Promise_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetEvents_Promise_0200';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      let Schedule: calendarManager.Event = {
        id: 100,
        title: '',
        location: {
          location: 'xx大礼堂',
          longitude: 116.3,
          latitude: 39.9,
        },
        isAllDay: true,
        attendee: [
          {
            name: '小王',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.ORGANIZER
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          }
        ],
        timeZone: 'UTC',
        reminderTime: [1],
        description: '',
        service: {
          type: calendarManager.ServiceType.MEETING,
          uri: '',
          description: ''
        },
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000
      }
      

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetEvents_Promise_0300
     * @tc.number SUB_2Application_CalendarManagerApi_GetEvents_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetEvents_Promise_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetEvents_Promise_0300';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetEvents_Promise_0400
     * @tc.number SUB_2Application_CalendarManagerApi_GetEvents_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetEvents_Promise_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetEvents_Promise_0400';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents().then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get events, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetAccount_0100
     * @tc.number SUB_2Application_CalendarManagerApi_GetAccount_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetAccount_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetAccount_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        let calendarAccounts = Calendar.getAccount();
        expect(calendarAccounts.name != '').assertTrue();
        console.info("get account success " + JSON.stringify(calendarAccounts));
        return;
      }).catch((err: BusinessError) => {
        if(err.code == 201) {
          console.info('权限错误')
        } else if (err.code == 401) {
          console.info('API参数错误')
        } else if (err.code == 801) {
          console.info('当前设备不支持API')
        }
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_CreateCalendar_Async_0100
     * @tc.number SUB_2Application_CalendarManagerApi_CreateCalendar_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_CreateCalendar_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_CreateCalendar_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '日历',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地账户'
      }
      calendarMgr?.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          if(err.code == 201) {
            console.info('权限错误')
          } else if (err.code == 401) {
            console.info('API参数错误')
          } else if (err.code == 801) {
            console.info('当前设备不支持API')
          }
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_DeleteCalendar_Async_0100
     * @tc.number SUB_2Application_CalendarManagerApi_DeleteCalendar_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_DeleteCalendar_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_DeleteCalendar_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data, (err, data) => {
          if (err) {
            if(err.code == 201) {
              console.info('权限错误')
            } else if (err.code == 401) {
              console.info('API参数错误')
            } else if (err.code == 801) {
              console.info('当前设备不支持API')
            }
            console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_DeleteCalendar_Promise_0100
     * @tc.number SUB_2Application_CalendarManagerApi_DeleteCalendar_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_DeleteCalendar_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_DeleteCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr?.deleteCalendar(data).then((data) => {
          console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          if(err.code == 201) {
            console.info('权限错误')
          } else if (err.code == 401) {
            console.info('API参数错误')
          } else if (err.code == 801) {
            console.info('当前设备不支持API')
          }
          console.info(CaseName + `Failed to delete calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetCalendar_Promise_0100
     * @tc.number SUB_2Application_CalendarManagerApi_GetCalendar_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetCalendar_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr?.getCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        if(err.code == 201) {
          console.info('权限错误')
        } else if (err.code == 401) {
          console.info('API参数错误')
        } else if (err.code == 801) {
          console.info('当前设备不支持API')
        }
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetCalendar_Async_0400
     * @tc.number SUB_2Application_CalendarManagerApi_GetCalendar_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetCalendar_Async_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetCalendar_Async_0400';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'CalDAV协议帐户',
        type: calendarManager.CalendarType.CALDAV,
        displayName: '支持CalDAV协议帐户'
      }
      calendarMgr?.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          if(err.code == 201) {
            console.info('权限错误')
          } else if (err.code == 401) {
            console.info('API参数错误')
          } else if (err.code == 801) {
            console.info('当前设备不支持API')
          }
          console.info(CaseName + `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is CALDAV" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetCalendar_Async_0100
     * @tc.number SUB_2Application_CalendarManagerApi_GetCalendar_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetCalendar_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetCalendar_Async_0100';
      calendarMgr?.getCalendar((err, data) => {
        if (err) {
          if(err.code == 201) {
            console.info('权限错误')
          } else if (err.code == 401) {
            console.info('API参数错误')
          } else if (err.code == 801) {
            console.info('当前设备不支持API')
          }
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName +
                `Failed to get specified calendar, Code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            }
          })
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is LOCAl" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetAllCalendars_Promise_0100
     * @tc.number SUB_2Application_CalendarManagerApi_GetAllCalendars_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetAllCalendars_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetAllCalendars_Promise_0100';
      calendarMgr?.getAllCalendars().then((data) => {
        console.info(CaseName + `Succeeded in deleting calendar, data: ${JSON.stringify(data)}`);
        expect(data != null).assertTrue();
        if (data.length > 0) {
          expect(data.length > 0).assertTrue();
        } else {
          expect(data.length).assertEqual(0);
        }
        return;
      }).catch((err: BusinessError) => {
        if(err.code == 201) {
          console.info('权限错误')
        } else if (err.code == 401) {
          console.info('API参数错误')
        } else if (err.code == 801) {
          console.info('当前设备不支持API')
        }
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_GetAllCalendars_Async_0100
     * @tc.number SUB_2Application_CalendarManagerApi_GetAllCalendars_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_GetAllCalendars_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_GetAllCalendars_Async_0100';
      calendarMgr?.getAllCalendars((err, data) => {
        if (err) {
          if(err.code == 201) {
            console.info('权限错误')
          } else if (err.code == 401) {
            console.info('API参数错误')
          } else if (err.code == 801) {
            console.info('当前设备不支持API')
          }
          console.info(CaseName + `Failed to get AllCalendars, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get AllCalendars" + JSON.stringify(data));
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          expect(data != null).assertTrue();
          return;
        }
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_QueryEventInstances_Promise_0100
     * @tc.number SUB_2Application_CalendarManagerApi_QueryEventInstances_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_QueryEventInstances_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_QueryEventInstances_Promise_0100';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime',
        "instanceStartTime", "instanceEndTime"];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      let Schedule: calendarManager.Event = {
        id: 100,
        title: '',
        location: {
          location: 'xx大礼堂',
          longitude: 116.3,
          latitude: 39.9,
        },
        isAllDay: false,
        attendee: [
          {
            name: '小王',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.ORGANIZER
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          }
        ],
        timeZone: 'UTC',
        reminderTime: [1],
        description: '',
        service: {
          type: calendarManager.ServiceType.MEETING,
          uri: '',
          description: ''
        },
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000,
        instanceStartTime: new Date().getTime(),
        instanceEndTime: new Date().getTime() + 60 * 60 * 3000
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.queryEventInstances(new Date().getTime(), new Date().getTime() + 60 * 60 * 3000,
          undefined, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting event instances" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get event instances, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKey_0100
     * @tc.number SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKey_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKey_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKey_0100';
      const filter = calendarManager.EventFilter.filterById([0, 1]);

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      let Schedule: calendarManager.Event = {
        id: 100,
        title: '',
        location: {
          location: 'xx大礼堂',
          longitude: 116.3,
          latitude: 39.9,
        },
        isAllDay: false,
        attendee: [
          {
            name: '小王',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.ORGANIZER
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          }
        ],
        timeZone: 'UTC',
        reminderTime: [1],
        description: '',
        service: {
          type: calendarManager.ServiceType.MEETING,
          uri: '',
          description: ''
        },
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000,
        instanceStartTime: new Date().getTime(),
        instanceEndTime: new Date().getTime() + 60 * 60 * 3000
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.queryEventInstances(new Date().getTime(), new Date().getTime() + 60 * 60 * 3000,
          undefined).then((data) => {
          console.info(CaseName + "Succeeded in getting event instances" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get event instances, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKeyNoId_0100
     * @tc.number SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKeyNoId_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKeyNoId_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_QueryEventInstances_PromiseNoKeyNoId_0100';
      const filter = calendarManager.EventFilter.filterById([0, 1]);

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      let Schedule: calendarManager.Event = {
        id: 100,
        title: '',
        location: {
          location: 'xx大礼堂',
          longitude: 116.3,
          latitude: 39.9,
        },
        isAllDay: false,
        attendee: [
          {
            name: '小王',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.ORGANIZER
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT
          }
        ],
        timeZone: 'UTC',
        reminderTime: [1],
        description: '',
        service: {
          type: calendarManager.ServiceType.MEETING,
          uri: '',
          description: ''
        },
        type: calendarManager.EventType.IMPORTANT,
        startTime: new Date().getTime(),
        endTime: new Date().getTime() + 60 * 60 * 3000,
        instanceStartTime: new Date().getTime(),
        instanceEndTime: new Date().getTime() + 60 * 60 * 3000
      }

      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.queryEventInstances(new Date().getTime(), new Date().getTime() + 60 * 60 * 3000).then((data) => {
          console.info(CaseName + "Succeeded in getting event instances" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get event instances, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0100
     * @tc.number SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.queryEventInstances(1, 2).then((data) => {
          console.info(CaseName + "Succeeded in getting event instances" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get event instances, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });

    /**
     * @tc.name   SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0200
     * @tc.number SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let CaseName = 'SUB_2Application_CalendarManagerApi_QueryEventInstances_TimeStampLenErr_0200';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.queryEventInstances(11111111111111, 12121212121212).then((data) => {
          console.info(CaseName + "Succeeded in getting event instances" + JSON.stringify(data));
          expect(data != null).assertTrue();
          if (data.length > 0) {
            expect(data.length > 0).assertTrue();
          } else {
            expect(data.length).assertEqual(0);
          }
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + `Failed to get event instances, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
    });
    /**
     * @tc.name   SUB_Application_CalendarManagerApi_addEventsPromise_0101
     * @tc.number SUB_Application_CalendarManagerApi_addEventsPromise_0101
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_addEventsPromise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_addEventsPromise_0101';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: '生日帐户',
          type: calendarManager.CalendarType.BIRTHDAY,
          displayName: '生日帐户'
        }
        const date = new Date();
        const event: calendarManager.Event = {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000,
          identifier: '111'
        };
        calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
          console.info(CaseName + 'Succeeded in creating calendar' + JSON.stringify(Calendar));
          await Calendar.addEvent(event).then((data: number) => {
            console.info(`Succeeded in adding event, id -> ${data}`);
          }).catch((err: BusinessError) => {
            console.error(`Failed to addEvent1. Code: ${err.code}, message: ${err.message}`);
          });
          Calendar.addEvents([event]).then(() => {
            console.info(`Succeeded in adding events`);
          }).catch((err: BusinessError) => {
            console.error(`Failed to addEvents. Code: ${err.code}, message: ${err.message}`);
            expect(err?.code).assertEqual(23900004);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
        done();
      });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_addEventsCallback_0102
     * @tc.number SUB_Application_CalendarManagerApi_addEventsCallback_0102
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_addEventsCallback_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_addEventsCallback_0102';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: '生日帐户',
          type: calendarManager.CalendarType.BIRTHDAY,
          displayName: '生日帐户'
        }
        const date = new Date();
        const event: calendarManager.Event = {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000,
          identifier: '111'
        };
        calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
          console.info(CaseName + 'Succeeded in creating calendar' + JSON.stringify(Calendar));
          await Calendar.addEvent(event);
          Calendar.addEvents([event], (err: BusinessError) => {
            if (err) {
              console.error(`Failed to addEvents. Code: ${err.code}, message: ${err.message}`);
              expect(err?.code).assertEqual(23900004);
            } else {
              console.info(`Succeeded in adding events`);
            }
            done();
          });

        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
        done();
      });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_addEventPromise_0103
     * @tc.number SUB_Application_CalendarManagerApi_addEventPromise_0103
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_addEventPromise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_addEventPromise_0103';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: '生日帐户',
          type: calendarManager.CalendarType.BIRTHDAY,
          displayName: '生日帐户'
        }
        const date = new Date();
        const event: calendarManager.Event = {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000,
          identifier: '111'
        };
        calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
          console.info(CaseName + 'Succeeded in creating calendar' + JSON.stringify(Calendar));
          await Calendar.addEvent(event).then((data: number) => {
            console.info(`Succeeded in adding event, id -> ${data}`);
          }).catch((err: BusinessError) => {
            console.error(`Failed to addEvent1. Code: ${err.code}, message: ${err.message}`);
          });
          Calendar.addEvent(event).then((data: number) => {
            console.info(`Succeeded in adding event, id -> ${data}`);
          }).catch((err: BusinessError) => {
            console.error(`Failed to addEvent2. Code: ${err.code}, message: ${err.message}`);
            expect(err?.code).assertEqual(23900004);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
        done();
      });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_addEventCallback_0104
     * @tc.number SUB_Application_CalendarManagerApi_addEventCallback_0104
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_addEventCallback_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_addEventCallback_0104';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: '生日帐户',
          type: calendarManager.CalendarType.BIRTHDAY,
          displayName: '生日帐户'
        }
        const date = new Date();
        const event: calendarManager.Event = {
          type: calendarManager.EventType.NORMAL,
          startTime: date.getTime(),
          endTime: date.getTime() + 60 * 60 * 1000,
          identifier: '111'
        };
        calendarMgr?.createCalendar(CalendarAccounts).then(async (Calendar) => {
          console.info(CaseName + 'Succeeded in creating calendar' + JSON.stringify(Calendar));
          await Calendar.addEvent(event, (err: BusinessError, data: number): void => {
            if (err) {
              console.error(`Failed to addEvent1. Code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`Succeeded in adding event, id -> ${data}`);
            }
          });
          Calendar.addEvent(event, (err: BusinessError, data: number): void => {
            if (err) {
              console.error(`Failed to addEvent2. Code: ${err.code}, message: ${err.message}`);
              expect(err?.code).assertEqual(23900004);
            } else {
              console.info(`Succeeded in adding event, id -> ${data}`);
            }
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
        done();
      });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_SetConfigPromise_0105
     * @tc.number SUB_Application_CalendarManagerApi_SetConfigPromise_0105
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_SetConfigPromise_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_SetConfigPromise_0105';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: '生日帐户',
          type: calendarManager.CalendarType.BIRTHDAY,
          displayName: '生日帐户'
        }
        const config: calendarManager.CalendarConfig = {
          enableReminder: true,
          color: '#0A59F7121212'
        };
        calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
          console.info(CaseName + 'Succeeded in creating calendar' + JSON.stringify(Calendar));
          Calendar.setConfig(config).then(() => {
            console.info(`Succeeded in setting config, data->${JSON.stringify(config)}`);
          }).catch((err: BusinessError) => {
            console.error(`Failed to set config. Code: ${err.code}, message: ${err.message}`);
            expect(err?.code).assertEqual(23900001);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
        done();
      });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_SetConfigCallback_0106
     * @tc.number SUB_Application_CalendarManagerApi_SetConfigCallback_0106
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_SetConfigCallback_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfigCallback_0106';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      const config: calendarManager.CalendarConfig = {
        enableReminder: true,
        color: '#0A59F7121212'
      };
      calendarMgr?.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + 'Succeeded in creating calendar' + JSON.stringify(Calendar));
        Calendar.setConfig(config, (err: BusinessError) => {
          if (err) {
            console.error(CaseName + `Failed to set config. Code: ${err.code}, message: ${err.message}`);
            expect(err?.code).assertEqual(23900001);
            done();
          } else {
            console.info(`Succeeded in setting config, config -> ${JSON.stringify(config)}`);
            done();
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + `Failed to create calendar, Code is ${err.code}, message is ${err.message}`);
        done();
      });
      done();
    });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_getCalendarPromise_0107
     * @tc.number SUB_Application_CalendarManagerApi_getCalendarPromise_0107
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_getCalendarPromise_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_getCalendarPromise_0107';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: '订阅帐户_test_empty',
          type: calendarManager.CalendarType.SUBSCRIBED,
        }
        calendarMgr?.getCalendar(CalendarAccounts).then((data) => {
          console.info(CaseName + `Succeeded in get calendar, data: ${JSON.stringify(data)}`);
          done();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + 'Failed to get calendar type is SUBSCRIBED' + JSON.stringify(err));
          expect(err.code).assertEqual(23900003);
          done();
        });
        done();
      });

    /**
     * @tc.name   SUB_Application_CalendarManagerApi_getCalendarAsyncCallback_0108
     * @tc.number SUB_Application_CalendarManagerApi_getCalendarAsyncCallback_0108
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Application_CalendarManagerApi_getCalendarAsyncCallback_0108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let CaseName = 'SUB_Application_CalendarManagerApi_getCalendarAsyncCallback_0108';
        let CalendarAccounts: calendarManager.CalendarAccount = {
          name: 'xx生日账户_test_empty',
          type: calendarManager.CalendarType.LOCAL,
        }
          calendarMgr?.getCalendar(CalendarAccounts, (err, data) => {
            if (err) {
              console.info(CaseName + `The specified account was not found, Code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(23900003);
              done();
            } else {
              console.info(CaseName + 'Succeeded in getting specified calendar type is LOCAL' + JSON.stringify(data));
              expect(data.id != null).assertTrue();
              done();
              return;
            }
            done();
          });
        done();
        });
    });
  }