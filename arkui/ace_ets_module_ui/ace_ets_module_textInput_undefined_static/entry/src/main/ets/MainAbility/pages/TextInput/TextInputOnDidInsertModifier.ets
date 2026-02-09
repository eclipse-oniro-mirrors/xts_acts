'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, InsertValue } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'



@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = false;
  public istFlag: boolean = false;
  public istValue: string = '';

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.onDidInsert((info: InsertValue) => {
        this.istValue = info.insertValue;
        this.istFlag = true;
      });
    } else {
      instance.onDidInsert(undefined);
    }
  }
}

@Entry
@Component
struct TextInputOnDidInsertModifier {
  controller: SearchController = new SearchController();
  @State onCutChange: boolean = false;
  @State istFlag: boolean = false;
  @State istValue: string = '';
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('onDidInsertButton')
        .onClick(() => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
          this.textInputModifier.istFlag = false;
        }).id('onDidInsertButton')
      Text(this.textInputModifier.istValue)
        .id('InsertValue').fontSize(10).width('100%').height('5%')
      TextInput()
        .id('TextInput_onDidInsert_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}