'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, TextInput, InputType, Color, Search, TextArea,
  SearchController, AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, $r } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.selectedBackgroundColor('#FFFFFF00');
    } else {
      instance.selectedBackgroundColor(undefined);
    }
  }
}

@Entry
@Component
struct TextInputSelectedBackgroundColorModifier {
  controller: SearchController = new SearchController();
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('colorButton')
        .onClick((event: ClickEvent) => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
        })
      TextInput()
        .key('TextInput_SelectedBackgroundColor_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}