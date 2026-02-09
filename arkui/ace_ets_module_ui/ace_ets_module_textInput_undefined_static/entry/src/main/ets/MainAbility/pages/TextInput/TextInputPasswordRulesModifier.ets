'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, SearchType, TextAreaType, InputType } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;
  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.passwordRules('begin:[lower],special:[yes],len:[maxlen:32,minlen:12]' );
    } else {
      instance.passwordRules(undefined);
    }
  }
}

@Entry
@Component
struct TextInputPasswordRulesModifier {
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();
  controller: SearchController = new SearchController();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change').id('passwordRulesButton')
        .onClick((event: ClickEvent) => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
        })
      TextInput()
        .key('TextInput_passwordRules_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}
