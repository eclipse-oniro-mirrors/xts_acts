'use static';
import { Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions, HorizontalAlign,
  AttributeModifier, ButtonAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { QRCodeAttribute,ResourceColor, Color, QRCode, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'


@Observed
export class MyEnableModifier implements AttributeModifier<QRCodeAttribute> {
  public change: boolean | undefined = true;

  public color_:ResourceColor | undefined = Color.Red

  applyNormalAttribute(instance: QRCodeAttribute): void {
    if (this.change) {
      instance.width(140).height(140)
        .color(this.color_)
    } else {
      instance.width(140).height(140)
        .color(undefined)
    }
  }
}

// xxx.ets
@Entry
@Component
struct QRCodeExample {
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true
  }
  build() {
    Column() {
      QRCode('hello world')
        .attributeModifier(this.modifier4)
        .id('colorModifier')

      Button('Change').onClick(() => {
        this.modifier4.color_ = this.modifier4.color_ === undefined ? Color.Red : undefined;
      })
        .id('changeButton')
    }.width('100%')
  }
}



