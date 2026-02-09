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
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (Font | undefined)[] = [
    undefined,
    {size:10} as Font,
    {size:20} as Font,
    {size:40} as Font,
    undefined];

  @State textAreaArrayStr: string[] = ['undefined', 'size:10', 'size:20', 'size:40', 'undefined']

  @State text: string = ''
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()

  build() {
    Row(undefined) {
      Scroll(undefined) {
        Column(undefined) {
          Button('textArea placeholderFont ' + this.textAreaArrayStr[this.textAreaIndex])
            .id('change')
            .onClick((e: ClickEvent) => {
              this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
              this.textAreaModifier.index = ++this.textAreaModifier.index % this.textAreaArray.length;
            })

          TextArea({ placeholder: '6666666666666666' })
            .id('TextArea')
            .height(56)
            .placeholderFont(this.textAreaArray[this.textAreaIndex])

          Text('TextArea Modifier')
          TextArea({ text: this.text, placeholder: '6666666666666666' })
            .id('Modifier')
            .attributeModifier(this.textAreaModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}