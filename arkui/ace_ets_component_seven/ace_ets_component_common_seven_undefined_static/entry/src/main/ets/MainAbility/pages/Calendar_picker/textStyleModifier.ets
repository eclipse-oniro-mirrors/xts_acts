'use static';
import { Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions, HorizontalAlign,
  AttributeModifier, ButtonAttribute,CalendarPickerAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Optional,PickerTextStyle,Color,CalendarAlign,DateRange,CalendarPicker,HorizontalAlign,Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'

@Observed
export class MyEnableModifier implements AttributeModifier<CalendarPickerAttribute> {
  public change: boolean | undefined = true;
  public textStyle_:Optional<PickerTextStyle> | undefined = { color: Color.Yellow} as Optional<PickerTextStyle>;

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance.margin(10)
        .textStyle(this.textStyle_)
    } else {
      instance.margin(10)
        .textStyle(undefined)
    }
  }
}

// xxx.ets
@Entry
@Component
struct CalendarPickerExample {
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true
  }

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
        .attributeModifier(this.modifier4)
        .id('textStyleModifier')

      CalendarPicker({ disabledDateRange: this.disabledDateRange })
        .margin(10)
        .textStyle(undefined)
        .id('TextStyleOrigin')
        
      Button('Change').onClick(() => {
        this.modifier4.textStyle_ = this.modifier4.textStyle_ === undefined ? { color: Color.Yellow} : undefined
      })
        .id('changeButton')
    }
  }
}