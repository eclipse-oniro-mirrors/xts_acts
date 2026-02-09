'use static'

import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, SearchAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions, Resource, Font, ResourceColor, TextAreaAttribute, Scroll
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.stopBackPress(undefined)
    } else if(this.index == 1) {
      instance.stopBackPress(true)
    } else if (this.index == 2) {
      instance.stopBackPress(false)
    } else if (this.index == 3) {
      instance.stopBackPress(undefined)
    }
  }
}


@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (boolean | undefined)[] = [
    undefined,
    true,
    false,
    undefined];
  @State textInputArrayStr: string[] = ['undefined', 'true', 'false', 'undefined']

  @State text: string = ''
  @State textInputModifier: TextInputModifier = new TextInputModifier()

  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textInput cancelButton' + this.textInputArrayStr[this.textInputIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
              this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
            })

          TextInput({ text: this.text, placeholder: "6666666666666666" })
            .id('TextInput')
            .height(56)
            .stopBackPress(this.textInputArray[this.textInputIndex])

          Text('TextInput Modifier')
          TextInput({ text: this.text })
            .id('Modifier')
            .fontSize(50)
            .attributeModifier(this.textInputModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}