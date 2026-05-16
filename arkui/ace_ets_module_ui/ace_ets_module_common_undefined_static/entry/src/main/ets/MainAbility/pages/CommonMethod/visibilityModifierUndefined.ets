'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Row,
  ColumnOptions,
  HorizontalAlign,
  FlexAlign,
  Visibility,
  AttributeModifier,
  CommonAttribute,
  Color
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class VisibilityModifier implements AttributeModifier<CommonAttribute> {
  public controlValue: Visibility | undefined = undefined

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.visibility(this.controlValue)
  }
}

@Entry
@Component
struct VisibilityDemo {
  @State m4: VisibilityModifier = new VisibilityModifier()

  aboutToAppear() {
    this.m4.controlValue = undefined
  }

  build() {
    Column({ space: 16 } as ColumnOptions) {
      Text('undefined').fontSize(15).width('90%').fontColor(0xCCCCCC)
      Row().attributeModifier(this.m4).width('90%').height(60).backgroundColor(Color.Blue)
        .id('common_visibilityModifier')

      Button('切换 case4 (undefined ⇄ Hidden)')
        .onClick(() => {
          this.m4.controlValue = this.m4.controlValue === undefined ? Visibility.Hidden : undefined
        })
        .id('button_visibilityModifier')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
