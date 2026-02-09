'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import window from '@ohos.window';
import { UtilsTest } from '../Util.test';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import { Axis } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

export default function calendarJsunit() {
  describe('appInfoTest_four_1', () => {
    beforeAll(() => {
      console.info("appInfoTest_four_1 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api11.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("calendar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get calendar state pages: " + JSON.stringify(pages));
        if (!("calendar" == pages.name)) {
          console.info("get calendar state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push calendar page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("calendar after each called");
    })

    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_colSpace
     * @tc.name     ACE_calendar_CurrentDayStyle_colSpace
     * @tc.desc     ACE_calendar_CurrentDayStyle_colSpace
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_colSpace', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_colSpace] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "colSpace": 10,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_colSpace] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_colSpace] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });

    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_dailyFiveRowSpace
     * @tc.name     ACE_calendar_CurrentDayStyle_dailyFiveRowSpace
     * @tc.desc     ACE_calendar_CurrentDayStyle_dailyFiveRowSpace
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_dailyFiveRowSpace', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_dailyFiveRowSpace] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "dailyFiveRowSpace": 11,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_dailyFiveRowSpace] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_dailyFiveRowSpace] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_dailySixRowSpace
     * @tc.name     ACE_calendar_CurrentDayStyle_dailySixRowSpace
     * @tc.desc     ACE_calendar_CurrentDayStyle_dailySixRowSpace
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_dailySixRowSpace', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_dailySixRowSpace] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "dailySixRowSpace": 12,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_dailySixRowSpace] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_dailySixRowSpace] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_lunarHeight
     * @tc.name     ACE_calendar_CurrentDayStyle_lunarHeight
     * @tc.desc     ACE_calendar_CurrentDayStyle_lunarHeight
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_lunarHeight', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_lunarHeight] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "lunarHeight": 13,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_lunarHeight] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_lunarHeight] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_underscoreWidth
     * @tc.name     ACE_calendar_CurrentDayStyle_underscoreWidth
     * @tc.desc     ACE_calendar_CurrentDayStyle_underscoreWidth
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_underscoreWidth', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_underscoreWidth] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "underscoreWidth": 14,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_underscoreWidth] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_underscoreWidth] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_underscoreLength
     * @tc.name     ACE_calendar_CurrentDayStyle_underscoreLength
     * @tc.desc     ACE_calendar_CurrentDayStyle_underscoreLength
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_underscoreLength', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_underscoreLength] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "underscoreLength": 15,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_underscoreLength] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_underscoreLength] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_scheduleMarkerRadius
     * @tc.name     ACE_calendar_CurrentDayStyle_scheduleMarkerRadius
     * @tc.desc     ACE_calendar_CurrentDayStyle_scheduleMarkerRadius
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_scheduleMarkerRadius', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_scheduleMarkerRadius] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "scheduleMarkerRadius": 16,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_scheduleMarkerRadius] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_scheduleMarkerRadius] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CurrentDayStyle_boundaryRowOffset
     * @tc.name     ACE_calendar_CurrentDayStyle_boundaryRowOffset
     * @tc.desc     ACE_calendar_CurrentDayStyle_boundaryRowOffset
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CurrentDayStyle_boundaryRowOffset', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CurrentDayStyle_boundaryRowOffset] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "boundaryRowOffset": 17,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CurrentDayStyle_boundaryRowOffset] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CurrentDayStyle_boundaryRowOffset] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });

    

    /**
     * @tc.number   ACE_calendar_WeekStyle_weekAndDayRowSpace
     * @tc.name     ACE_calendar_WeekStyle_weekAndDayRowSpace
     * @tc.desc     ACE_calendar_WeekStyle_weekAndDayRowSpace
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_WeekStyle_weekAndDayRowSpace', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_WeekStyle_weekAndDayRowSpace] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "weekAndDayRowSpace": 18,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_WeekStyle_weekAndDayRowSpace] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_WeekStyle_weekAndDayRowSpace] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   ACE_calendar_CalendarAttribute_direction
     * @tc.name     ACE_calendar_CalendarAttribute_direction
     * @tc.desc     ACE_calendar_CalendarAttribute_direction
     * @tc.level    Level.LEVEL2
     */
it('ACE_calendar_CalendarAttribute_direction', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[ACE_calendar_CalendarAttribute_direction] START');
        await Utils.sleep(1000);
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "direction": Axis.Vertical,
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 74,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ACE_calendar_CalendarAttribute_direction] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ACE_calendar_CalendarAttribute_direction] change component data error: " + err.message);
        }
        done();
      } catch(err) {
        expect().assertFail();
      }
    });
  })
}
