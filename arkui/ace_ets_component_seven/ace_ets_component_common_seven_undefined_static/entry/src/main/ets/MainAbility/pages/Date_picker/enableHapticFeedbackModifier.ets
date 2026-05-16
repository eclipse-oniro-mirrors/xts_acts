'use static';
import { DatePicker,NestedScrollMode,Scroll, Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions, HorizontalAlign,
  AttributeModifier, ButtonAttribute,DatePickerAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Optional,PickerTextStyle,Color,CalendarAlign,DateRange,CalendarPicker,HorizontalAlign,Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'

@Observed
export class MyEnableModifier implements AttributeModifier<DatePickerAttribute> {
  public change: boolean | undefined = true;
  public isChange:Boolean = true

  applyNormalAttribute(instance: DatePickerAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .enableHapticFeedback(this.isChange ? false : undefined)
    } else {
      instance
        .enableHapticFeedback(undefined)
    }
  }
}

// xxx.ets
@Entry
@Component
struct CalendarPickerExample {
  private selectedDate: Date = new Date('2021-08-08');
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true
  }


  build() {
    Scroll(){
      Column() {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        })
          .attributeModifier(this.modifier4)
          .id('enableHapticFeedbackModifier')

        Button('Change')
          .onClick(() => {
            this.modifier4.isChange = !this.modifier4.isChange
          }).id('changeButton')
      }.width('100%')
    }
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.SELF_FIRST
    })
  }
}