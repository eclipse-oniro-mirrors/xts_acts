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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import uitest from '@ohos.UiTest';
import systemDateTime from '@ohos.systemDateTime';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { mContext } from '../testability/TestAbility'

let calendarMgr: calendarManager.CalendarManager;

interface eventsObj {
  type: calendarManager.EventType,
  startTime: number,
  endTime: number
}

interface locationObj {
  location: string,
  longitude?: number,
  latitude?: number,
}

interface attendeeObj {
  name: string,
  email: string,
  role?: calendarManager.AttendeeRole,
}

interface recurrenceRuleObj {
  recurrenceFrequency: calendarManager.RecurrenceFrequency,
  expire?: number,
  count?: number,
  interval?: number,
   excludedDates?: number[],
  daysOfWeek?: number[],
  daysOfMonth?: number[],
  daysOfYear?: number[],
  weeksOfMonth?: number[],
  weeksOfYear?: number[],
  monthsOfYear?: number[]
}

interface serviceObj {
  type: calendarManager.ServiceType,
  uri: string,
  description: string
}

interface ScheduleObj {
  type: calendarManager.EventType,
  title: string,
  location: locationObj,
  startTime: number,
  endTime: number,
  isAllDay: boolean,
  attendee: Array<attendeeObj>,
  timeZone: string,
  reminderTime: Array<number>,
  recurrenceRule: recurrenceRuleObj,
  description: string,
  service: serviceObj
}

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
      calendarMgr = calendarManager.getCalendarManager(mContext);
    });


    /*
     * @tc.number  SUB_Application_CalendarManagerApi_test_0100
     * @tc.name    test_enumeration_of_calendarType_types.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2

     */
    it("SUB_Application_CalendarManagerApi_test_0100", 0, () => {
      expect(calendarManager.CalendarType.LOCAL == 'local').assertTrue();
      expect(calendarManager.CalendarType.EMAIL == 'email').assertTrue();
      expect(calendarManager.CalendarType.BIRTHDAY == 'birthday').assertTrue(); // undefined
      expect(calendarManager.CalendarType.CALDAV == 'caldav').assertTrue();
      expect(calendarManager.CalendarType.SUBSCRIBED == 'subscribed').assertTrue();
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_test_0200
     * @tc.name    Test Enumeration of RecurrenceFrequency types.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_test_0200", 0, () => {
      expect(calendarManager.RecurrenceFrequency.YEARLY == 0).assertTrue();
      expect(calendarManager.RecurrenceFrequency.MONTHLY == 1).assertTrue();
      expect(calendarManager.RecurrenceFrequency.WEEKLY == 2).assertTrue();
      expect(calendarManager.RecurrenceFrequency.DAILY == 3).assertTrue();
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_test_0300
     * @tc.name    Test Enumeration of ServiceType types.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_test_0300", 0, () => {
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

    /*
    * @tc.number  SUB_Application_CalendarManagerApi_test_0400
    * @tc.name    Test Enumeration of AttendeeRole types.
    * @tc.desc    Function test
    * @tc.size    SmallTest
    * @tc.type    User
    * @tc.level   Level 2
    */
    it("SUB_Application_CalendarManagerApi_test_0400", 0, () => {
      expect(calendarManager.AttendeeRole.ORGANIZER == 'organizer').assertTrue();
      expect(calendarManager.AttendeeRole.PARTICIPANT == 'participant').assertTrue();
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100
     * @tc.name    Create a Calendar object based on the calendar account information type entry as LOCAL.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'HUAWEI日历',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地账户'
      }
      calendarMgr.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200
     * @tc.name    Create a Calendar object based on the calendar account information type entry as EMAIL.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0200';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xxx@huawei.com',
        type: calendarManager.CalendarType.EMAIL,
        displayName: 'EMAIL账户'
      }
      calendarMgr.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300
     * @tc.name    Create a Calendar object based on the calendar account information type entry as BIRTHDAY.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgr.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400
     * @tc.name    Create a Calendar object based on the calendar account information type entry as CALDAV.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Async_0400';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'CalDAV协议帐户',
        type: calendarManager.CalendarType.CALDAV,
        displayName: '支持CalDAV协议帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100
     * @tc.name    Create a Calendar object based on the calendar account information type entry as SUBSCRIBED.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_CreateCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetCalendar_Async_0100
     * @tc.name    Gets the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0100';
      calendarMgr.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName + "Failed to get specified calendar" + JSON.stringify(err));
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

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetCalendar_Async_0200
     * @tc.name    Gets the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0200", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0200';
      calendarMgr.getCalendar((err, data) => {
        if (err) {
          radio.isRadioOn((error) => {
            if (error) {
              console.info("RK device , no modem")
            } else {
              console.info(CaseName + "Failed to get specified calendar" + JSON.stringify(err));
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

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetCalendar_Async_0300
     * @tc.name    Gets the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0300", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0300';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'xx生日账户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日账户'
      }
      calendarMgr.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + "Failed to get specified calendar" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is BIRTHDAY" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetCalendar_Async_0400
     * @tc.name    Gets the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Async_0400", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Async_0400';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: 'CalDAV协议帐户',
        type: calendarManager.CalendarType.CALDAV,
        displayName: '支持CalDAV协议帐户'
      }
      calendarMgr.getCalendar(CalendarAccounts, (err, data) => {
        if (err) {
          console.info(CaseName + "Failed to get specified calendar" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get specified calendar type is CALDAV" + JSON.stringify(data));
          expect(data.id != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100
     * @tc.name    Gets the default Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '订阅帐户',
        type: calendarManager.CalendarType.SUBSCRIBED,
        displayName: '订阅帐户'
      }
      calendarMgr.getCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
        expect(data.id != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200
     * @tc.name    Gets the default Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetCalendar_Promise_0200';
      calendarMgr.getCalendar().then((data) => {
        console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
        expect(data.id != null).assertTrue();
        return;
      }).catch((err:BusinessError) => {
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

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100
     * @tc.name    Gets the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_Async_0100';
      calendarMgr.getAllCalendars((err, data) => {
        if (err) {
          console.info(CaseName + "Failed to get AllCalendars" + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.info(CaseName + "Succeeded in get AllCalendars" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100
     * @tc.name    Gets all Calendar objects created by the current application and the default Calendar objects.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAllCalendars_Promise_0100';
      calendarMgr.getAllCalendars().then((data) => {
        console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
        expect(data != null).assertTrue();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to delete calendar type is SUBSCRIBED" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100
     * @tc.name    Deletes the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr.deleteCalendar(data, (err, data) => {
          if (err) {
            console.info(CaseName + "Failed to delete calendar" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100
     * @tc.name    Deletes the specified Calendar object.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_DeleteCalendar_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((data) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(data));
        calendarMgr.deleteCalendar(data).then((data) => {
          console.info(CaseName + "Succeeded in deleting calendar" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to delete calendar" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_AddEvent_Async_0100
     * @tc.name    Create an agenda.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_AddEvent_Async_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));

        Calendar.addEvent(Schedule, (err, data) => {
          if (err) {
            console.info(CaseName + "Failed to addEvent" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
            expect(data != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_AddEvent_Promise_0100
     * @tc.name    Create an agenda.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_AddEvent_Promise_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule).then((data) => {
          console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to addEvent" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_AddEvents_Async_0100
     * @tc.name    Batch create schedule.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_AddEvents_Async_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));

        Calendar.addEvents(events, (err, data) => {
          if (err) {
            console.info(CaseName + "Failed to addEvents" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvents" + JSON.stringify(data));
            expect(data != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_AddEvent_Promise_0100
     * @tc.name    Batch create schedule.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_AddEvents_Promise_0100", 0, () => {
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
      let Events: Array<eventsObj> = [
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvents(Events).then(() => {
          console.info(CaseName + "Succeeded in addEvents");
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to addEvents" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100
     * @tc.name    Update an agenda.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_UpdateEvent_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      let Schedule: ScheduleObj = {
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
          },
          {
            name: '小李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT,
          },
          {
            name: '老李',
            email: 'peter@yuanha.com',
            role: calendarManager.AttendeeRole.PARTICIPANT,
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));

        Calendar.updateEvent(Schedule, (err, data) => {
          if (err) {
            console.info(CaseName + "Failed to updateEvent" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in updateEvent" + JSON.stringify(data));
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100
     * @tc.name    Update an agenda.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_UpdateEvent_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      let Schedule: ScheduleObj = {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.updateEvent(Schedule).then((data) => {
          console.info(CaseName + "Succeeded in updateEvent" + JSON.stringify(data));
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to updateEvent" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetAccount_0100
     * @tc.name    Get calendar account information.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetAccount_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetAccount_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        let calendarAccounts = Calendar.getAccount();
        expect(calendarAccounts.name != '').assertTrue();
        console.info("get account success " + JSON.stringify(calendarAccounts));
        return;
      }).catch((err:BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_SetConfig_Async_0100
     * @tc.name    Set calendar configuration information.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_SetConfig_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfig_Async_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.setConfig({
          enableReminder: true, color: "#0A59F7"
        }, (err, data) => {
          if (err) {
            console.info(CaseName + "Failed to setConfig" + JSON.stringify(err));
            expect().assertFail();
          } else {
            let configs = Calendar.getConfig();
            console.info(CaseName + "Succeeded in getConfig" + JSON.stringify(configs));
            expect(configs.enableReminder == true && configs.color == "#0A59F7").assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_SetConfig_Promise_0100
     * @tc.name    Set calendar configuration information.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_SetConfig_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_SetConfig_Promise_0100';
      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '生日帐户',
        type: calendarManager.CalendarType.BIRTHDAY,
        displayName: '生日帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.setConfig({
          enableReminder: false, color: "#0A59F7"
        }).then((data) => {
          let configs = Calendar.getConfig();
          console.info(CaseName + "Succeeded in getConfig" + JSON.stringify(configs));
          expect(configs.enableReminder == false && configs.color == "#0A59F7").assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to setConfig" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Async_0100
     * @tc.name    Example Query all events in Calendar.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0100';

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents((err: BusinessError, Events: Array<string>) => {
          if (err) {
            console.info(CaseName + "Failed to getEvents" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
            expect(Events[0] != '').assertTrue();
            return;
          }
        }).catch((err: BusinessError) => {
          console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
          expect().assertFail();
        });
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Async_0200
     * @tc.name    Example Query all events in Calendar By FilterById.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0200", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule, (err, data) => {
          if (err) {
            console.info(CaseName + "Failed to addEvent" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(data));
            Calendar.getEvents(filter, columns, (err, Events) => {
              if (err) {
                console.info(CaseName + "Failed to getEvents" + JSON.stringify(err));
                expect().assertFail();
              } else {
                console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
                expect(Events[0] != null).assertTrue();
                return;
              }
            });
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Async_0300
     * @tc.name    Example Query all events in Calendar By FilterByTime.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0300", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0300';
      const filter = calendarManager.EventFilter.filterByTime(1686931200, 1703733961);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns, (err, Events) => {
          if (err) {
            console.info(CaseName + "Failed to getEvents" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
            expect(Events[0] != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });
    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Async_0400
     * @tc.name    Example Query all events in Calendar By FilterByTitle.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Async_0400", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Async_0400';
      const filter = calendarManager.EventFilter.filterByTitle('开会日程');
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns, (err, Events) => {
          if (err) {
            console.info(CaseName + "Failed to getEvents" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in getEvents" + JSON.stringify(Events));
            expect(Events[0] != null).assertTrue();
            return;
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Promise_0100
     * @tc.name    Example Query all events in Calendar By FilterById.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0100", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0100';
      const filter = calendarManager.EventFilter.filterById([0, 1]);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + "Failed to get events" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Promise_0200
     * @tc.name    Example Query all events in Calendar By FilterByTime.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0200", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0200';
      const filter = calendarManager.EventFilter.filterByTime(1686931200, 1703733961);
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + "Failed to get events" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_GetEvents_Promise_0300
     * @tc.name    Example Query all events in Calendar By FilterByTitle.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_GetEvents_Promise_0300", 0, () => {
      let CaseName = 'SUB_Application_CalendarManagerApi_GetEvents_Promise_0300';
      const filter = calendarManager.EventFilter.filterByTitle('开会日程');
      const columns: (keyof calendarManager.Event)[] = ['title', 'type', 'startTime', 'endTime'];

      let CalendarAccounts: calendarManager.CalendarAccount = {
        name: '本地帐户',
        type: calendarManager.CalendarType.LOCAL,
        displayName: '本地帐户'
      }

      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.getEvents(filter, columns).then((data) => {
          console.info(CaseName + "Succeeded in getting events" + JSON.stringify(data));
          expect(data != null).assertTrue();
          return;
        }).catch((err: BusinessError) => {
          console.error(CaseName + "Failed to get events" + JSON.stringify(err));
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_DeleteEvent_Async_0100
     * @tc.name    Delete an agenda.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvent_Async_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule, (err, ScheduleID) => {
          if (err) {
            console.info(CaseName + "Failed to addEvent" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(ScheduleID));
            Calendar.deleteEvent(ScheduleID, (err, data) => {
              if (err) {
                console.info(CaseName + "Failed to deleteEvent" + JSON.stringify(err));
                expect().assertFail();
              } else {
                console.info(CaseName + "Succeeded in deleteEvent" + JSON.stringify(data));
                return;
              }
            });
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_DeleteEvent_Promise_0100
     * @tc.name    Delete an agenda.
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvent_Promise_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then((Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        Calendar.addEvent(Schedule, (err, ScheduleID) => {
          if (err) {
            console.info(CaseName + "Failed to addEvent" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info(CaseName + "Succeeded in addEvent" + JSON.stringify(ScheduleID));
            Calendar.deleteEvent(ScheduleID).then((data) => {
              console.info(CaseName + "Succeeded in deleteEvent" + JSON.stringify(data));
              return;
            }).catch((err: BusinessError) => {
              console.info(CaseName + "Failed to deleteEvent" + JSON.stringify(err));
              expect().assertFail();
            });
          }
        });
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_DeleteEvents_Async_0100
     * @tc.name    Delete schedules in batches based on schedule ids
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvents_Async_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then(async (Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        try {
          let ScheduleID = await Calendar.addEvent(Schedule);
          let ScheduleID1 = await Calendar.addEvent(Schedule1);
          console.info(CaseName + "Succeeded in addEvent" + ScheduleID + ScheduleID1);
          Calendar.deleteEvents([ScheduleID, ScheduleID1], (err, data) => {
            if (err) {
              console.info(CaseName + "Failed to deleteEvents" + JSON.stringify(err));
              expect().assertFail();
            } else {
              console.info(CaseName + "Succeeded in deleteEvents" + JSON.stringify(data));
              return;
            }
          });
        } catch (err) {
          console.info(CaseName + "Failed to addEvents" + JSON.stringify(err));
          expect().assertFail();
        }
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
     * @tc.number  SUB_Application_CalendarManagerApi_DeleteEvents_Promise_0100
     * @tc.name    Delete schedules in batches based on schedule ids
     * @tc.desc    Function test
     * @tc.size    SmallTest
     * @tc.type    User
     * @tc.level   Level 2
     */
    it("SUB_Application_CalendarManagerApi_DeleteEvents_Promise_0100", 0, () => {
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
      calendarMgr.createCalendar(CalendarAccounts).then(async (Calendar) => {
        console.info(CaseName + "Succeeded in creating calendar" + JSON.stringify(Calendar));
        try {
          let ScheduleID = await Calendar.addEvent(Schedule);
          let ScheduleID1 = await Calendar.addEvent(Schedule1);
          console.info(CaseName + "Succeeded in addEvent" + ScheduleID + ScheduleID1);
          Calendar.deleteEvents([ScheduleID, ScheduleID1]).then((data) => {
            console.info(CaseName + "Succeeded in deleteEvents" + JSON.stringify(data));
            return;
          }).catch((err: BusinessError) => {
            console.info(CaseName + "Failed to deleteEvents" + JSON.stringify(err));
            expect().assertFail();
          });
        } catch (err) {
          console.info(CaseName + "Failed to addEvents" + JSON.stringify(err));
          expect().assertFail();
        }
      }).catch((err: BusinessError) => {
        console.info(CaseName + "Failed to create calendar" + JSON.stringify(err));
        expect().assertFail();
      });
    });

    /*
    * @tc.number  SUB_Application_CalendarManagerApi_EditEvent_Promise_0100
    * @tc.name    Create a single event,invoking this interface will open the event creation page.
    * @tc.desc    Function test
    * @tc.size    SmallTest
    * @tc.type    User
    * @tc.level   Level 2
    */
    it("SUB_Application_CalendarManagerApi_EditEvent_Promise_0100", 0, () => {
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

  });
}
