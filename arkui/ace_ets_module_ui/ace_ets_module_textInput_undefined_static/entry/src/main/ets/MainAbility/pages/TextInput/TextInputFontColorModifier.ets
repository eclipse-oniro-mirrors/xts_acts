'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, $r } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;
  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.fontColor('#FFFFFF00');
    } else {
      instance.fontColor(undefined);
    }
  }
}

@Entry
@Component
struct TextInputFontColorModifier {
  @State fontColorChange: boolean = true;
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();
  controller: SearchController = new SearchController();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('button1')
        .onClick((event: ClickEvent) => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
        })
      TextInput()
        .key('TextInput_FontColor_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}