'use static'

import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, SearchAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions, Resource, Font, ResourceColor, TextAreaAttribute, Scroll
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextAreaAttribute): void {
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
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (boolean | undefined)[] = [
    undefined,
    true,
    false,
    undefined];

  @State textAreaArrayStr: string[] = ['undefined', 'true', 'false', 'undefined']

  @State text: string = ''
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textArea stopBackPress' + this.textAreaArrayStr[this.textAreaIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
              this.textAreaModifier.index = ++this.textAreaModifier.index % this.textAreaArray.length;
            })

          TextArea({placeholder: "6666666666666666"})
            .id('TextArea')
            .height(56)
            .stopBackPress(this.textAreaArray[this.textAreaIndex])

          Text('TextArea Modifier')
          TextArea({ text: this.text })
            .id('Modifier')
            .fontSize(50)
            .attributeModifier(this.textAreaModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}