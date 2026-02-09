'use static'


import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, AttributeModifier,
   TextAreaAttribute, TextOverflow, TextAreaType, Text
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  public cutValue: string = '';
  public cutFlag: boolean = false;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.onCut((cutValue: string) => {
        this.cutValue = cutValue ;
        this.cutFlag = true;
      })
    } else {
      instance.onCut(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaOnCutModifier {
  @State onCutChange: boolean = false;
  @State cutValue: string = '';
  @State cutFlag: boolean = false;
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换undefined').id('TextAreaOnCutModifierButton').onClick((event: ClickEvent) => {
          this.onCutChange = !this.onCutChange;
        })
        Text(this.cutValue).height(30)
          .id('TextAreaOnCutModifier')

        TextArea({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextAreaOnCutModifier')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}