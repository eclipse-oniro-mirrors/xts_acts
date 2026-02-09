'use static'

import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, TextAreaAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextAreaAttribute): void {
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
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (CopyOptions | undefined)[] = [
    undefined,
    CopyOptions.None,
    CopyOptions.InApp,
    CopyOptions.LocalDevice,
    undefined];
  @State textAreaArrayStr: string[] = ['undefined', 'None', 'InApp', 'LocalDevice', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!'
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()
  build() {
    Row(undefined) {
      Column(undefined) {
        Button('textArea copyOption' + this.textAreaArrayStr[this.textAreaIndex])
          .id('change')
          .onClick((e: ClickEvent)=>{
            this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
            this.textAreaModifier.index = ++this.textAreaModifier.index % this.textAreaArray.length;
          })
        TextArea({ text: this.text })
          .id('TextArea')
          .height(56)
          .copyOption(this.textAreaArray[this.textAreaIndex])

        Text('TextArea Modifier')
        TextArea({ text: this.text })
          .id('Modifier')
          .attributeModifier(this.textAreaModifier)
      }.height('100%')
    }.width('100%')
  }
}