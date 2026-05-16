'use static';
import { Optional,PickerTextStyle,Color,CalendarAlign,DateRange,CalendarPicker,HorizontalAlign,Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

// xxx.ets
@Entry
@Component
struct CalendarPickerExample {

  @State markToday_:Boolean | undefined = true;
  @State isChange:Boolean = false;
  @State edgeAlign_:Optional<CalendarAlign> | undefined = CalendarAlign.START;
  @State textStyle_:Optional<PickerTextStyle> | undefined = { color: Color.Yellow} as Optional<PickerTextStyle>;


  private disabledDateRange: DateRange[] = [
    { start: new Date('2025-01-01'), end: new Date('2025-01-02') } as DateRange,
    { start: new Date('2025-01-09'), end: new Date('2025-01-10') } as DateRange,
    { start: new Date('2025-01-15'), end: new Date('2025-01-16') } as DateRange,
    { start: new Date('2025-01-19'), end: new Date('2025-01-19') } as DateRange,
    { start: new Date('2025-01-22'), end: new Date('2025-01-25') } as DateRange
  ];

  build() {
    Column() {
      CalendarPicker({ disabledDateRange: this.disabledDateRange })
        .margin(10)
        .edgeAlign(this.edgeAlign_)
        .id('TestCalendarPickerEdgeAlign')

      Button('Change').onClick(() => {
          this.edgeAlign_ = undefined;
      })
        .id('changeButton')
    }
  }
}