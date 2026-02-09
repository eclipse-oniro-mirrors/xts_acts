'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, SearchType, InputType } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = false;
  public cutValue: string = '';
  public cutFlag: boolean = false;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.onCut((value: string) => {
        this.cutValue = value;
        this.cutFlag = true;
      });
    } else {
      instance.onCut(undefined);
    }
  }
}

@Entry
@Component
struct TextInputOnCutModifier {
  @State cutValue: string = '';
  @State cutFlag: boolean = false;
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();
  controller: SearchController = new SearchController();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change').id('onCutButton')
        .onClick((event: ClickEvent) => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
          this.textInputModifier.cutFlag = false;
        })
      Text(this.textInputModifier.cutValue)
        .id('TextInput_onCut_Value')
      TextInput()
        .key('TextInput_onCut_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}
