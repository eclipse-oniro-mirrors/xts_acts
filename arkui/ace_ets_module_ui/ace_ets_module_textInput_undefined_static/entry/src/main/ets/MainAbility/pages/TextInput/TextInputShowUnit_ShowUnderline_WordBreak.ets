'use static'
import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, SearchAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions, Resource, Font, ResourceColor, TextAreaAttribute, Scroll, TextInputStyle, Builder,
  Alignment, Rectangle, Select, TextContentStyle, WordBreak
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct Index {
  @State showUnderlineIndex: Int = 0;
  @State showUnderlineArray: (boolean | undefined)[] = [
    undefined,
    true,
    undefined,
    false
  ];

  @State showUnderlineArrayStr: string[] = ['undefined', 'true', 'false', 'undefined']

  @State wordBreakIndex: Int = 0;
  @State wordBreakArray: (WordBreak | undefined)[] = [
    undefined,
    WordBreak.NORMAL,
    WordBreak.BREAK_ALL,
    undefined,
    WordBreak.BREAK_WORD,
    WordBreak.HYPHENATION,
  ];

  @State wordBreakArrayStr: string[] = ['undefined', 'NORMAL', 'BREAK_ALL', 'undefined', 'BREAK_WORD', 'HYPHENATION']


  @State text: string = 'This is set wordBreak to WordBreak text Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu'
  @State isShowUnit: Boolean = true;
  @Builder
  itemEnd() {
    Select([{ value: 'KB' },
      { value: 'MB' },
      { value: 'GB' },
      { value: 'TB' }])
      .height('48vp')
      .borderRadius(0)
      .selected(2)
      .align(Alignment.Center)
      .value('MB')
      .font({ size: 20, weight: 500 })
      .fontColor('#182431')
      .selectedOptionFont({ size: 20, weight: 400 })
      .optionFont({ size: 20, weight: 400 })
      .backgroundColor(Color.Transparent)
      .responseRegion({
        height: '40vp',
        width: '80%',
        x: '10%',
        y: '6vp'
      } as Rectangle)
  }
  build() {
    Row(undefined) {
      Column(undefined) {
        Button('textInput showUnderline' + this.showUnderlineArrayStr[this.showUnderlineIndex])
          .id('showUnderline')
          .onClick((e: ClickEvent)=>{
            this.showUnderlineIndex = ++this.showUnderlineIndex % this.showUnderlineArray.length;
          })
        Button('textInput showUnit' + this.isShowUnit)
          .id('showUnit')
          .onClick((e: ClickEvent)=>{
            this.isShowUnit = !this.isShowUnit;
          })
        Button('wordBreak' + this.wordBreakArrayStr[this.wordBreakIndex])
          .id('wordBreak')
          .onClick((e: ClickEvent)=>{
            this.wordBreakIndex = ++this.wordBreakIndex % this.wordBreakArray.length;
          })

        Text('showUnderline showUnit')
        TextInput({ text: this.text })
          .id('TextInput_ShowUnderline_showUnit')
          .height(200)
          .showUnderline(this.showUnderlineArray[this.showUnderlineIndex])
          .showUnit(this.isShowUnit ? undefined : this.itemEnd)

        Text('TextInput wordBreak')
        TextInput({ text: this.text })
          .id('TextInput_wordBreak')
          .style(TextInputStyle.Inline)
          .height(56)
          .wordBreak(this.wordBreakArray[this.wordBreakIndex])

        Text('TextArea wordBreak')
        TextArea({ text: this.text })
          .id('TextArea_wordBreak')
          .style(TextContentStyle.INLINE)
          .height(56)
          .wordBreak(this.wordBreakArray[this.wordBreakIndex])

      }.height('100%')
    }.width('100%')
  }
}