'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  FlexAlign,
  Row,
  ColumnOptions,
  HorizontalAlign,
  AttributeModifier,
  ButtonAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyEnableModifier implements AttributeModifier<ButtonAttribute> {
  public controlValue: boolean | undefined = undefined

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.enabled(this.controlValue)
  }
}

@Entry
@Component
struct attributeDemo {
  @State modifier4: MyEnableModifier = new MyEnableModifier()
  @State isEnabled: boolean | undefined = false

  aboutToAppear() {
    this.modifier4.controlValue = this.isEnabled
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('case4: dynamic ' + this.isEnabled)
        .attributeModifier(this.modifier4)
        .id('commonmethod_enabledModifier')

      Button('切换 case4')
        .onClick(() => {
          this.isEnabled = this.isEnabled === undefined ? false : undefined
          this.modifier4.controlValue = this.isEnabled
        })
        .id('button_enabledModifier')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
