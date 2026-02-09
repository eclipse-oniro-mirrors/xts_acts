/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
@Entry
@Component
struct StyledStringVerticalAlignTest {
  controller1: TextController = new TextController();
  controller2: TextController = new TextController();
  controller3: TextController = new TextController();
  controller4: TextController = new TextController();
  controller5: TextController = new TextController();
  controller6: TextController = new TextController();
  paragraphStyleAttr1: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    textVerticalAlign: TextVerticalAlign.BASELINE,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  paragraphStyleAttr2: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    textVerticalAlign: TextVerticalAlign.BOTTOM,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  paragraphStyleAttr3: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    textVerticalAlign: TextVerticalAlign.CENTER,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  paragraphStyleAttr4: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    textVerticalAlign: TextVerticalAlign.TOP,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  paragraphStyleAttr5: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  paragraphStyleAttr6: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    textVerticalAlign: undefined,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  mutableStr1 = new MutableStyledString('TextVerticalAlign.BASELINE', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue:this.paragraphStyleAttr1
    },
  ])
  mutableStr2 = new MutableStyledString('TextVerticalAlign.BOTTOM', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue:this.paragraphStyleAttr2
    },
  ])
  mutableStr3 = new MutableStyledString('TextVerticalAlign.CENTER', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue:this.paragraphStyleAttr3
    },
  ])
  mutableStr4 = new MutableStyledString('TextVerticalAlign.TOP', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue:this.paragraphStyleAttr4
    },
  ])
  mutableStr5 = new MutableStyledString('TextVerticalAlign.default', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue:this.paragraphStyleAttr5
    },
  ])
  mutableStr6 = new MutableStyledString('TextVerticalAlign.undefined', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue:this.paragraphStyleAttr6
    },
  ])
  build() {
    Column({ space: 2 }) {
      Text('',{ controller: this.controller1 })
        .height('5%')
        .id('Text_TextVerticalAlign_BASELINE')
        .onAppear(()=>{
          this.controller1.setStyledString(this.mutableStr1)
        })
        .borderWidth(1)
 
      Text('',{ controller: this.controller2 })
        .height('5%')
        .id('Text_TextVerticalAlign_BOTTOM')
        .onAppear(()=>{
          this.controller2.setStyledString(this.mutableStr2)
        })
        .borderWidth(1)
 
      Text('',{ controller: this.controller3 })
        .height('5%')
        .id('Text_TextVerticalAlign_CENTER')
        .onAppear(()=>{
          this.controller3.setStyledString(this.mutableStr3)
        })
        .borderWidth(1)
 
      Text('',{ controller: this.controller4 })
        .height('5%')
        .id('Text_TextVerticalAlign_TOP')
        .onAppear(()=>{
          this.controller4.setStyledString(this.mutableStr4)
        })
        .borderWidth(1)
 
      Text('',{ controller: this.controller5 })
        .height('5%')
        .id('Text_TextVerticalAlign_default')
        .onAppear(()=>{
          this.controller5.setStyledString(this.mutableStr5)
        })
        .borderWidth(1)
 
      Text('',{ controller: this.controller6 })
        .height('5%')
        .id('Text_TextVerticalAlign_undefined')
        .onAppear(()=>{
          this.controller6.setStyledString(this.mutableStr6)
        })
        .borderWidth(1)
 
      Button('getStyles').onClick(()=>{
        let styles1 = this.mutableStr1.getStyles(0, this.mutableStr1.length);
        if (styles1.length !== 0) {
          for (let i = 0; i < styles1.length; i++) {
            if (styles1[i].styledKey === 200) {
              let paraAttr = styles1[i].styledValue as ParagraphStyle;
              console.info('paragraphStyledString1 textVerticalAlign:' + paraAttr.textVerticalAlign);
              AppStorage.SetOrCreate('textVerticalAlign1',paraAttr.textVerticalAlign)
            }
          }
        }
        let styles2 = this.mutableStr2.getStyles(0, this.mutableStr2.length);
        if (styles2.length !== 0) {
          for (let i = 0; i < styles2.length; i++) {
            if (styles2[i].styledKey === 200) {
              let paraAttr = styles2[i].styledValue as ParagraphStyle;
              console.info('paragraphStyledString2 textVerticalAlign:' + paraAttr.textVerticalAlign);
              AppStorage.SetOrCreate('textVerticalAlign2',paraAttr.textVerticalAlign)
            }
          }
        }
        let styles3 = this.mutableStr3.getStyles(0, this.mutableStr3.length);
        if (styles3.length !== 0) {
          for (let i = 0; i < styles3.length; i++) {
            if (styles3[i].styledKey === 200) {
              let paraAttr = styles3[i].styledValue as ParagraphStyle;
              console.info('paragraphStyledString3 textVerticalAlign:' + paraAttr.textVerticalAlign);
              AppStorage.SetOrCreate('textVerticalAlign3',paraAttr.textVerticalAlign)
            }
          }
        }
        let styles4 = this.mutableStr4.getStyles(0, this.mutableStr4.length);
        if (styles4.length !== 0) {
          for (let i = 0; i < styles4.length; i++) {
            if (styles4[i].styledKey === 200) {
              let paraAttr = styles4[i].styledValue as ParagraphStyle;
              console.info('paragraphStyledString4 textVerticalAlign:' + paraAttr.textVerticalAlign);
              AppStorage.SetOrCreate('textVerticalAlign4',paraAttr.textVerticalAlign)
            }
          }
        }
        let styles5 = this.mutableStr5.getStyles(0, this.mutableStr5.length);
        if (styles5.length !== 0) {
          for (let i = 0; i < styles5.length; i++) {
            if (styles5[i].styledKey === 200) {
              let paraAttr = styles5[i].styledValue as ParagraphStyle;
              console.info('paragraphStyledString5 textVerticalAlign:' + paraAttr.textVerticalAlign);
              AppStorage.SetOrCreate('textVerticalAlign5',paraAttr.textVerticalAlign)
            }
          }
        }
        let styles6 = this.mutableStr6.getStyles(0, this.mutableStr6.length);
        if (styles6.length !== 0) {
          for (let i = 0; i < styles6.length; i++) {
            if (styles6[i].styledKey === 200) {
              let paraAttr = styles6[i].styledValue as ParagraphStyle;
              console.info('paragraphStyledString6 textVerticalAlign:' + paraAttr.textVerticalAlign);
              AppStorage.SetOrCreate('textVerticalAlign6',paraAttr.textVerticalAlign)
            }
          }
        }
      }).id('getStyles_textVerticalAlign')
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
  }
}