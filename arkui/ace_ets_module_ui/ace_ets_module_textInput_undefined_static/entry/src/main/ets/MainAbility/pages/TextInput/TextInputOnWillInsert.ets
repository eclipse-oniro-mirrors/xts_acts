'use static'

import {
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button, InsertValue,
  TextAlign, AttributeModifier, TextInputAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public insertValue: string = '';
  public isCallback: Boolean = true;
  applyNormalAttribute(instance: TextInputAttribute): void {
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
struct TextInputOnWillInsert {
  @State insertValue: string = '';
  @State isCallback: Boolean = true;
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Column() {
      Text(this.insertValue + this.textInputModifier.insertValue)
        .id('TextInputText').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      TextInput()
        .id('TextInput')
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
          this.textInputModifier.isCallback = !this.textInputModifier.isCallback;
        })
        .fontSize(20)
        .height('5%')

      Text('TextInput Modifier')
      TextInput()
        .id('Modifier')
        .attributeModifier(this.textInputModifier)
    }.height('100%').width('100%');
  }
}