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
      instance.placeholderFont(undefined)
    } else if(this.index == 1) {
      instance.placeholderFont({size:10} as Font)
    } else if (this.index == 2) {
      instance.placeholderFont({size:20} as Font)
    } else if (this.index == 3) {
      instance.placeholderFont({size:40} as Font)
    } else if (this.index == 4) {
      instance.placeholderFont(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (Font | undefined)[] = [
    undefined,
    {size:10} as Font,
    {size:20} as Font,
    {size:40} as Font,
    undefined];
  @State textInputArrayStr: string[] = ['undefined', 'size:10', 'size:20', 'size:40', 'undefined']

  @State text: string = ''
  @State textInputModifier: TextInputModifier = new TextInputModifier()

  build() {
    Row(undefined) {
      Scroll(undefined) {
        Column(undefined) {
          Button('textInput placeholderFont ' + this.textInputArrayStr[this.textInputIndex])
            .id('change')
            .onClick((e: ClickEvent) => {
              this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
              this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
            })

          TextInput({ text: this.text, placeholder: '6666666666666666' })
            .id('TextInput')
            .height(56)
            .placeholderFont(this.textInputArray[this.textInputIndex])

          Text('TextInput Modifier')
          TextInput({ text: this.text, placeholder: '6666666666666666' })
            .id('Modifier')
            .attributeModifier(this.textInputModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}