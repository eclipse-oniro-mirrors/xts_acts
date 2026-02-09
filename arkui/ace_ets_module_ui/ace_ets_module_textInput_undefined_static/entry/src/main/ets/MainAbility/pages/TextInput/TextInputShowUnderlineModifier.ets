'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.showUnderline(true);
    } else {
      instance.showUnderline(undefined);
    }
  }
}

@Entry
@Component
struct TextInputShowUnderline {
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('showUnderlineButton')
        .onClick((event: ClickEvent) => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
        })
      TextInput()
        .key('TextInput_showUnderline_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}