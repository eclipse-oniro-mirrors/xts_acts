'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, DeleteValue } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = false;
  public delFlag: boolean = false;
  public delValue: string = '';

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.onDidDelete((info: DeleteValue) => {
        this.delValue = info.deleteValue;
        this.delFlag = true;
      });
    } else {
      instance.onDidDelete(undefined);
    }
  }
}

@Entry
@Component
struct OnCut {
  controller: SearchController = new SearchController();
  @State onCutChange: boolean = false;
  @State delFlag: boolean = false;
  @State delValue: string = '';
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();

  build() {
    Column() {
      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('onDidDeleteButton')
        .onClick(() => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
          this.textInputModifier.delFlag = false;
        })

      Text(this.textInputModifier.delValue)
        .id('DeleteValue')
      TextInput()
        .key('TextInput_onDidDelete_001')
        .attributeModifier(this.textInputModifier)
    }
  }
}