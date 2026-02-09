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
      instance.placeholderColor(undefined)
    } else if(this.index == 1) {
      instance.placeholderColor(Color.Blue)
    } else if (this.index == 2) {
      instance.placeholderColor(0)
    } else if (this.index == 3) {
      instance.placeholderColor($r('app.color.color_hello'))
    } else if (this.index == 4) {
      instance.placeholderColor($r('app.color.color_world'))
    } else if (this.index == 5) {
      instance.placeholderColor(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (ResourceColor | undefined)[] = [
    undefined,
    Color.Blue,
    0,
    '0xff000000',
    $r('app.color.color_hello'),
    $r('app.color.color_world'),
    undefined];

  @State textAreaArrayStr: string[] = ['undefined', 'color1', 'color2', 'color3', 'color4', 'color5', 'undefined']
  @State text: string = ''
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textArea placeholderColor ' + this.textAreaArrayStr[this.textAreaIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
              this.textAreaModifier.index = ++this.textAreaModifier.index % this.textAreaArray.length;
            })
          TextArea({placeholder: '6666666666666666'})
            .id('TextArea')
            .height(56)
            .placeholderColor(this.textAreaArray[this.textAreaIndex])

          Text('TextArea Modifier')
          TextArea({ text: this.text, placeholder: '6666666666666666' })
            .id('Modifier')
            .attributeModifier(this.textAreaModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}