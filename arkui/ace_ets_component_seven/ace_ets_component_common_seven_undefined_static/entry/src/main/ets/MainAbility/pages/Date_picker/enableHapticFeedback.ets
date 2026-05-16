'use static';
import { NestedScrollMode,BarState,Scroll,DatePicker,Row,CrownSensitivity,Optional,PickerTextStyle,Color,CalendarAlign,DateRange,CalendarPicker,HorizontalAlign,Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TestNewInterface {
  private selectedDate: Date = new Date('2021-08-08');
  @State isChange:Boolean = true

  build() {
    Scroll(){
      Column() {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        })
          .enableHapticFeedback(this.isChange ? false : undefined)
          .id('TestDate_pickerEnableHapticFeedback')

        Button('Change')
          .onClick(() => {
            console.log('xxx Change', this.isChange);
            this.isChange = !this.isChange
          })
          .id('changeButton')

      }.width('100%')
    }
  }
}