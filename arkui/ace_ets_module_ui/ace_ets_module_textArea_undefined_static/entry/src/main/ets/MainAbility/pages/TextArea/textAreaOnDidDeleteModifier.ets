'use static'


import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, AttributeModifier,
  TextAreaAttribute, TextOverflow, TextAreaType, Text, DeleteValue
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  public delValue: string = '';
  public delFlag: boolean = false;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.onDidDelete((info: DeleteValue) => {
        this.delValue = info.deleteValue;
        this.delFlag = true;
      })
    } else {
      instance.onDidDelete(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaOnDidDeleteModifier {
  @State onDelChange: boolean = false;
  @State delValue: string = '';
  @State delFlag: boolean = false;
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换undefined').id('TextAreaOnDidDeleteModifierButton').onClick((event: ClickEvent) => {
          this.onDelChange = !this.onDelChange;
        })
        Text(this.delValue).height(30)
          .id('TextAreaOnDidDeleteModifier')

        TextArea({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextAreaOnDidDeleteModifier')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}