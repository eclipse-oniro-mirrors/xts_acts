'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.textIndent('50');
    } else {
      instance.textIndent(undefined);
    }
  }
}

@Entry
@Component
struct TextInputTextIndentModifier {
  @State change: boolean = false;
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();
  controller: SearchController = new SearchController();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('textIndentButton')
        .onClick((event: ClickEvent) => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
        })

      TextInput()
        .key('TextInput_textIndent_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}