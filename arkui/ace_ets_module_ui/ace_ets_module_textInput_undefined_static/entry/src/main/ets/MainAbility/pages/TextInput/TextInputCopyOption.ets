'use static'

import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, SearchAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.copyOption(undefined)
    } else if(this.index == 1) {
      instance.copyOption(CopyOptions.None)
    } else if (this.index == 2) {
      instance.copyOption(CopyOptions.InApp)
    } else if (this.index == 3) {
      instance.copyOption(CopyOptions.LocalDevice)
    } else if (this.index == 4) {
      instance.copyOption(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (CopyOptions | undefined)[] = [
    undefined,
    CopyOptions.None,
    CopyOptions.InApp,
    CopyOptions.LocalDevice,
    undefined];
  @State textInputArrayStr: string[] = ['undefined', 'None', 'InApp', 'LocalDevice', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!'
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Row(undefined) {
      Column(undefined) {
        Button('textInput copyOption' + this.textInputArrayStr[this.textInputIndex])
          .id('change')
          .onClick((e: ClickEvent)=>{
            this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
            this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
          })
        TextInput({ text: this.text })
          .id('TextInput')
          .height(56)
          .copyOption(this.textInputArray[this.textInputIndex])

        Text('TextInput Modifier')
        TextInput({ text: this.text })
          .id('Modifier')
          .attributeModifier(this.textInputModifier)
      }.height('100%')
    }.width('100%')
  }
}