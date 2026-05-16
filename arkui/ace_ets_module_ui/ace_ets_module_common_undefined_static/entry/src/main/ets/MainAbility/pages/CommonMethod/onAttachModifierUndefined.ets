'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Flex,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign,
  FontWeight
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import { AttributeModifier, CommonAttribute, TextAttribute} from '@ohos.arkui.component'

@Observed
export class MyDetachModifier implements AttributeModifier<CommonAttribute> {

  public controlValue: boolean | undefined = undefined
  public count: int = 0

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.controlValue === undefined) {
      instance.onAttach(undefined)
    } else if (this.controlValue === true) {
      instance.onAttach(() => {
        this.count += 1;
      })
    }
  }
}

@Entry
@Component
struct DetachExample {
  @State modifier3: MyDetachModifier = new MyDetachModifier()
  @State isShow3: boolean = true

  aboutToAppear() {
    this.modifier3.controlValue = true
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Toggle onAttachModifier Handler' + this.modifier3.controlValue)
        .backgroundColor(0x317aff)
        .onClick(() => {
          this.modifier3.controlValue = this.modifier3.controlValue === undefined ? true : undefined
        })
        .id('button_onAttachModifier')
      Button('onAttachModifier3')
        .onClick(() => {
          this.isShow3 = !this.isShow3
        }).margin(15)
        .id('button_onAttachModifier2')
      Text('Count' + this.modifier3.count)
        .fontSize(26)
        .id('commonmethod_onAttachModifier')
      if (this.isShow3 === true) {
        Text('Text for onAttachModifier 3')
          .fontSize(26)
          .attributeModifier(this.modifier3)
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
