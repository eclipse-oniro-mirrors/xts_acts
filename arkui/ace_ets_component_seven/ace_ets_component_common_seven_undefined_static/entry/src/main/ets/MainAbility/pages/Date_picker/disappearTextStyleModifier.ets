'use static';
import { Scroll,Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions, HorizontalAlign,
  AttributeModifier, ButtonAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { DatePickerAttribute,ScrollSnapAlign,Axis,EdgeEffect,ChainEdgeEffect,TextAlign,Scroller,ListItem,ForEach,Row,List,Color,FontStyle,FontWeight,DatePicker,Entry, Text, Column, Component, Button, ClickEvent,Optional,PickerTextStyle } from '@ohos.arkui.component'


@Observed
export class MyEnableModifier implements AttributeModifier<DatePickerAttribute> {
  public isChange:Boolean = true;
  public change: boolean | undefined = true;

  applyNormalAttribute(instance: DatePickerAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .disappearTextStyle(this.isChange ? { color: Color.Red, font: { size: '16fp', weight: FontWeight.Bold } } as Optional<PickerTextStyle> : undefined)
    } else {
      instance
        .disappearTextStyle(undefined)
    }
  }
}

@Entry
@Component
struct DatePickerExample {
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
          .id('disappearTextStyleModifier')

        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        })
          .disappearTextStyle(undefined)
          .id('disappearTextStyleOrigin')
          
        Button('Change')
          .onClick(() => {
            this.modifier4.isChange = !this.modifier4.isChange
          })
          .id('changeButton')

      }.width('100%')
    }
  }
}