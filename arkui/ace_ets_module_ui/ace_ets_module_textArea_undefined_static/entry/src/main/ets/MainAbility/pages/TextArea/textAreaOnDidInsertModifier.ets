'use static'


import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, 
  AttributeModifier, TextAreaAttribute, TextOverflow, TextAreaType, Text, InsertValue
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = false;
  public istValue: string = '';
  public istFlag: boolean = false;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.onDidInsert((info: InsertValue) => {
        this.istValue = info.insertValue;
        this.istFlag = true;
      })
    } else {
      instance.onDidInsert(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaOnDidInsertModifier {
  @State change: boolean = false;
  @State istFlag: boolean = false;
  @State istValue: string = '';
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Text(`${this.modifier.istValue}`)
          .id('TextAreaOnDidInsertModifierText').fontSize(10).width('100%').height('5%')
        Button('点击切换undefined').id('TextAreaOnDidInsertModifierButton').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange;
        })
        TextArea({ placeholder: 'input your word...' })
          .width('100%')
          .id('TextAreaOnDidInsertModifier')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}