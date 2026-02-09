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
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Margin, Color, Axis, Flex,FlexDirection,ItemAlign,FlexAlign, Padding } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct CalendarComponentExample {
  // calendarController: CalendarController = new CalendarController();
  // @State CalendarDayArray: CalendarDay[] = [{
  //                                             index: 1,
  //                                             lunarMonth: "five",
  //                                             lunarDay: "6",
  //                                             dayMark: "六",
  //                                             dayMarkValue: "儿童节",
  //                                             year: 2020,
  //                                             month: 11,
  //                                             day: 10,
  //                                             isFirstOfLunar: false,
  //                                             markLunarDay: false
  //                                           }] as CalendarDay[];
  // @State currentMonthday: MonthData = {
  //   year: 2021,
  //   month: 3,
  //   data: this.CalendarDayArray
  // } as MonthData;
  // @State preMonthday: MonthData = {
  //   year: 2021,
  //   month: 2,
  //   data: this.CalendarDayArray
  // } as MonthData;
  // @State nextMonthday: MonthData = {
  //   year: 2021,
  //   month: 4,
  //   data: this.CalendarDayArray
  // } as MonthData;
  // @State colorValue: Color = Color.Blue;
  // @State calendarDay1: CalendarDay = {
  //   index: 6,
  //   lunarMonth: "111",
  //   lunarDay: "222",
  //   dayMark: "333",
  //   dayMarkValue: "444",
  //   year: 2022,
  //   month: 3,
  //   day: 11,
  //   isFirstOfLunar: false,
  //   hasSchedule: false,
  //   markLunarDay: false
  // } as CalendarDay
  // @State calendarDay2: CalendarDay = {
  //   index: 6,
  //   lunarMonth: "111",
  //   lunarDay: "222",
  //   dayMark: "333",
  //   dayMarkValue: "444",
  //   year: 2022,
  //   month: 3,
  //   day: 10,
  //   isFirstOfLunar: false,
  //   hasSchedule: false,
  //   markLunarDay: false
  // } as CalendarDay
  // @State calendarDay3: CalendarDay = {
  //   index: 6,
  //   lunarMonth: "111",
  //   lunarDay: "222",
  //   dayMark: "333",
  //   dayMarkValue: "444",
  //   year: 2022,
  //   month: 3,
  //   day: 12,
  //   isFirstOfLunar: false,
  //   hasSchedule: false,
  //   markLunarDay: false
  // } as CalendarDay
  // @State currentData_: MonthData = { year: 2022, month: 3, data: [this.calendarDay1] } as MonthData;
  // @State preData_: MonthData = { year: 2022, month: 3, data: [this.calendarDay2] } as MonthData;
  // @State nextData_: MonthData = { year: 2022, month: 3, data: [this.calendarDay3] } as MonthData;

  @State colSpace: number = 5;
  @State dailyFiveRowSpace: number = 4;
  @State dailySixRowSpace: number = 5;
  @State lunarHeight: number = 20;
  @State underscoreWidth: number = 10;
  @State underscoreLength: number = 6;
  @State scheduleMarkerRadius: number = 3;
  @State boundaryRowOffset: number = 3;
  @State weekAndDayRowSpace: number = 3;
  @State direction1: Axis = Axis.Horizontal;
  // @State weekStyle: WeekStyle = {
  //   weekColor: Color.Black,
  //   weekendDayColor: Color.Red,
  //   weekendLunarColor:  Color.Green,
  //   weekFontSize: 1,
  //   weekHeight: 2,
  //   weekWidth: 3,
  //   weekAndDayRowSpace: this.weekAndDayRowSpace
  // } as WeekStyle;
  private stateChangCallBack:  (eventData: events_emitter.EventData) => void  = (eventData:events_emitter.EventData) => {
    const event: Record<String,RecordData> =
      eventData.data as Record<String,RecordData>
    if (eventData != null && eventData.data !== null) {
      console.info("Calendar page state change called:" + JSON.stringify(eventData));
      if (event['colSpace'] != null) {
        this.colSpace = event['colSpace'] as number;
        console.log("Calendar page colSpace value" + this.colSpace);
      }
      if (event['dailyFiveRowSpace'] != null) {
        this.dailyFiveRowSpace = event['dailyFiveRowSpace'] as number;
        console.log("Calendar page dailyFiveRowSpace value" + this.dailyFiveRowSpace);
      }
      if (event['dailySixRowSpace'] != null) {
        this.dailySixRowSpace = event['dailySixRowSpace'] as number;
        console.log("Calendar page dailySixRowSpace value" + this.dailySixRowSpace);
      }
      if (event['underscoreWidth'] != null) {
        this.underscoreWidth = event['underscoreWidth'] as number;
        console.log("Calendar page underscoreWidth value" + this.underscoreWidth);
      }
      if (event['underscoreLength'] != null) {
        this.underscoreLength = event['underscoreLength'] as number;
        console.log("Calendar page underscoreLength value" + this.underscoreLength);
      }
      if (event['lunarHeight'] != null) {
        this.lunarHeight = event['lunarHeight'] as number;
        console.log("Calendar page lunarHeight value" + this.lunarHeight);
      }
      if (event['scheduleMarkerRadius'] != null) {
        this.scheduleMarkerRadius = event['scheduleMarkerRadius'] as number;
        console.log("Calendar page scheduleMarkerRadius value" + this.scheduleMarkerRadius);
      }
      if (event['boundaryRowOffset'] != null) {
        this.boundaryRowOffset = event['boundaryRowOffset'] as number;
        console.log("Calendar page boundaryRowOffset value" + this.boundaryRowOffset);
      }

      if (event['weekAndDayRowSpace'] != null) {
        this.weekAndDayRowSpace = event['weekAndDayRowSpace'] as number;
        console.log("Calendar page weekAndDayRowSpace value" + this.weekAndDayRowSpace);
      }

      if (event['direction'] != null) {
        // this.direction1 = event['direction').toStaticObject() as Axis;
        // console.log("Calendar page direction value" + this.direction1);
      }
    }
  }

  onPageShow() {
    console.info('Calendar page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 74,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      // Calendar({
      //   year: 2020,
      //   month: 5,
      //   day: 12
      // }, this.currentMonthday, this.preMonthday, this.nextMonthday, this.calendarController)
      //   .currentDayStyle({
      //     dayHeight: 30,
      //     dayWidth: 30,
      //     gregorianCalendarHeight: 30,
      //     dayYAxisOffset: 1,
      //     lunarDayYAxisOffset: 1,
      //     underscoreXAxisOffset: 1,
      //     underscoreYAxisOffset: 1,
      //     scheduleMarkerXAxisOffset: 0,
      //     scheduleMarkerYAxisOffset: 0,
      //     colSpace: this.colSpace,
      //     dailyFiveRowSpace: this.dailyFiveRowSpace,
      //     dailySixRowSpace: this.dailySixRowSpace,
      //     lunarHeight: this.lunarHeight,
      //     underscoreWidth: this.underscoreWidth,
      //     underscoreLength: this.underscoreLength,
      //     scheduleMarkerRadius: this.scheduleMarkerRadius,
      //     boundaryRowOffset: this.boundaryRowOffset
      //   })
      //   .weekStyle(this.weekStyle)
      //   .direction(this.direction1)
      //   .backgroundColor(0x317aff)
      //   .width(100)
      //   .height(50)
      //   .key('calender')
    }.height(400).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}