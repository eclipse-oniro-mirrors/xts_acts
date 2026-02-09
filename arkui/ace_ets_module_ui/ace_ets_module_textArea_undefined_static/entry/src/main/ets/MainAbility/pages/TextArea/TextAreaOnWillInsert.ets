'use static'

import {
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button, InsertValue,
  TextAlign, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed  } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public insertValue: string = '';
  public isCallback: Boolean = true;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.height(56)
    instance.onWillInsert(this.isCallback ? undefined :
      (info: InsertValue) => {
        this.insertValue = info.insertValue;
        return true;
      })
  }
}

@Entry
@Component
struct TextAreaOnWillInsert {
  @State insertValue: string = '';
  @State isCallback: Boolean = true;
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier();
  build() {
    Column() {
      Text(this.insertValue + this.textAreaModifier.insertValue)
        .id('TextAreaText').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      TextArea()
        .id('TextArea')
        .width('95%')
        .height('10%')
        .onWillInsert(this.isCallback ? undefined :
          (info: InsertValue) => {
            this.insertValue = info.insertValue;
            return true;
          })

      Button('callback ' + this.isCallback ? 'false' : 'true')
        .id('change')
        .onClick((e: ClickEvent)=>{
          this.isCallback = !this.isCallback;
          this.textAreaModifier.isCallback = !this.textAreaModifier.isCallback;
        })
        .fontSize(20)
        .height('5%')

      Text('TextArea Modifier')
      TextArea()
        .id('Modifier')
        .attributeModifier(this.textAreaModifier)
    }.height('100%').width('100%');
  }
}