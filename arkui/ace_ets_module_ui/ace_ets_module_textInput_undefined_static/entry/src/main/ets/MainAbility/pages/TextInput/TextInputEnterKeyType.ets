'use static'

import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, SearchAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions, EnterKeyType, Scroll
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.enterKeyType(undefined)
    } else if(this.index == 1) {
      instance.enterKeyType(EnterKeyType.Go)
    } else if (this.index == 2) {
      instance.enterKeyType(EnterKeyType.Done)
    } else if (this.index == 3) {
      instance.enterKeyType(EnterKeyType.NEW_LINE)
    } else if (this.index == 4) {
      instance.enterKeyType(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (EnterKeyType | undefined)[] = [
    undefined,
    EnterKeyType.Go,
    EnterKeyType.Done,
    EnterKeyType.NEW_LINE,
    EnterKeyType.Send,
    EnterKeyType.Search,
    undefined];
  @State textInputArrayStr: string[] = ['undefined', 'Go', 'Done', 'NEW_LINE', 'Send', 'Search', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!'
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textInput enterKeyType' + this.textInputArrayStr[this.textInputIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
              this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
            })
          TextInput({ text: this.text })
            .id('TextInput')
            .height(56)
            .enterKeyType(this.textInputArray[this.textInputIndex])
          Text('TextInput Modifier')
          TextInput({ text: this.text })
            .id('Modifier')
            .attributeModifier(this.textInputModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}