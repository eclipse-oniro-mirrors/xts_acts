'use static'

import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, TextAreaAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions, EnterKeyType, Scroll
} from '@ohos.arkui.component'
import { State, AppStorage, Observed, Track } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextAreaAttribute): void {
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
      instance.enterKeyType(EnterKeyType.Send)
    } else if (this.index == 5) {
      instance.enterKeyType(EnterKeyType.Search)
    } else if (this.index == 6) {
      instance.enterKeyType(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (EnterKeyType | undefined)[] = [
    undefined,
    EnterKeyType.Go,
    EnterKeyType.Done,
    EnterKeyType.NEW_LINE,
    EnterKeyType.Send,
    EnterKeyType.Search,
    undefined];

  @State textAreaArrayStr: string[] = ['undefined', 'Go', 'Done', 'NEW_LINE', 'Send', 'Search', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!'
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textArea enterKeyType' + this.textAreaArrayStr[this.textAreaIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
              this.textAreaModifier.index = ++this.textAreaModifier.index % this.textAreaArray.length;
            })
          TextArea()
            .id('TextArea')
            .height(56)
            .enterKeyType(this.textAreaArray[this.textAreaIndex])

          Text('TextArea Modifier')
          TextArea({ text: this.text })
            .id('Modifier')
            .attributeModifier(this.textAreaModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}