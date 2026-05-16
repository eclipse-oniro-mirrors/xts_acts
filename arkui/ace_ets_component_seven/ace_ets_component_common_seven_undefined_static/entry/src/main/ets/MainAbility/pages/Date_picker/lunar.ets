'use static';
import { Scroll,ScrollSnapAlign,Axis,EdgeEffect,ChainEdgeEffect,TextAlign,Scroller,ListItem,ForEach,Row,List,Color,
  FontStyle,FontWeight,DatePicker,Entry, Text, Column, Component, Button, ClickEvent,Optional,PickerTextStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct DatePickerExample {
  private selectedDate: Date = new Date('2021-08-08');
  @State isLunar: boolean | undefined = true;
  @State isChange:Boolean = false;

  build() {
    Scroll(){
      Column() {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        })
          .lunar(this.isLunar)
          .id('TestDate_pickerLunar')


        Button('Change')
          .onClick(() => {
            this.isLunar = undefined
          })
          .id('changeButton')

      }.width('100%')
    }
  }
}