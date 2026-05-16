'use static';
import { Entry, Text, Column, Component, Button, ClickEvent, Flex, Row, HorizontalAlign, Font,
  TextClockController, TextClock, Button, FlexDirection, FlexAlign, ItemAlign, Margin,
  DateTimeOptions, ShadowOptions, Color, FontWeight, FontStyle, UIContext, $rawfile} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import {
  ShapePoint,Line,LineAttribute,Entry, Component, Column, Button, Flex, FlexDirection, ItemAlign, FlexAlign,
  Margin, ColumnOptions, TextClock, TextClockController, Color,
  AttributeModifier, CommonAttribute, TextClockAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyEnableModifier implements AttributeModifier<LineAttribute> {
  public change: boolean | undefined = true;

  public start:	ShapePoint | undefined = [50, 0] as ShapePoint;

  applyNormalAttribute(instance: LineAttribute): void {
    if (this.change) {
      instance.startPoint(this.start)
        .endPoint([50, 100])
        .width(200)
        .height(120)
        .stroke(Color.Black)
    } else {
      instance.startPoint(undefined)
        .endPoint([50, 100])
        .width(200)
        .height(120)
        .stroke(Color.Black)
    }
  }
}

@Entry
@Component
struct attributeDemo {
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Line()
        .backgroundColor('#F5F5F5')
        .attributeModifier(this.modifier4)
        .id('line1Modifier')

      Button('Change').onClick(() => {
        this.modifier4.start = this.modifier4.start === undefined ? [50, 0] as ShapePoint : undefined
      }).id('changeButton')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
