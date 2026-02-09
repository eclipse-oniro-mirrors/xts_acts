'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, SearchController, SearchType, TextAlign,
  TextArea, TextInput, AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.textAlign(TextAlign.Center);
    } else {
      instance.textAlign(undefined);
    }
  }
}

@Entry
@Component
struct textAlignIndex {
  message: string = 'var';
  controller: SearchController = new SearchController();
  @State textAlignChange: boolean = false;
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();

  build() {
    Column(undefined) {

      Column() {
        Text('-----Modifier-----')
        Button('Modifier_change')
          .id('textAlignButton')
          .onClick((event: ClickEvent) => {
            this.textInputModifier.isChange = !this.textInputModifier.isChange;
          })

        TextInput()
          .key('TextInput_textAlign_001')
          .attributeModifier(this.textInputModifier)
      }
      .width('100%')
      .height('100%')
    }
  }
}
