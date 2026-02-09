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
  @State textInputIndex: Int = 0;
  @State textInputArray: (ResourceColor | undefined)[] = [
    undefined,
    Color.Blue,
    0,
    '0xff000000',
    $r('app.color.color_hello'),
    $r('app.color.color_world'),
    undefined];
  @State textInputArrayStr: string[] = ['undefined', 'color1', 'color2', 'color3', 'color4', 'color5', 'undefined']
  @State text: string = ''
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textInput placeholderColor ' + this.textInputArrayStr[this.textInputIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
              this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
            })
          TextInput({ text: this.text, placeholder: '6666666666666666' })
            .id('TextInput')
            .height(56)
            .placeholderColor(this.textInputArray[this.textInputIndex])

          Text('TextInput Modifier')
          TextInput({ text: this.text, placeholder: '6666666666666666' })
            .id('Modifier')
            .attributeModifier(this.textInputModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}