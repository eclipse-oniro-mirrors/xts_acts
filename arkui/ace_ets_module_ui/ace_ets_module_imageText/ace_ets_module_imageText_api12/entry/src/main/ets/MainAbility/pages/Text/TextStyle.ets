/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct StyledStringIndex {
  styledString1: StyledString = new StyledString('123', [{
    start: 0,
    length: 3,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Blue })
  }]);
  controller1: TextController = new TextController();
  controller2: TextController = new TextController();
  mutableStyledString1: MutableStyledString = new MutableStyledString('123', [{
    start: 0,
    length: 3,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Blue })
  }]);
  @State getStyle: string = ''
  @State getStyle2: string = ''
  spanStyle1: SpanStyle = {
    start: 0,
    length: 3,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Pink })
  };



  async onPageShow() {
    this.controller1.setStyledString(this.styledString1)
    this.controller2.setStyledString(this.mutableStyledString1)
  }

  build() {
    Column({ space: 5 }){

      Text(undefined, { controller: this.controller1 })
      Text(undefined, { controller: this.controller2 })
      Text(this.getStyle).key('textStyle1')
      Text(this.getStyle2).key('textStyle2')

      Button('getStyle')
        .key('getStyle')
        .onClick(() => {
          let styles = this.styledString1.getStyles(0, this.styledString1.length)
          let fontAttr = styles[0].styledValue as TextStyle;
          this.getStyle = '' + styles[0].start + styles[0].length + styles[0].styledKey + fontAttr.fontColor
        })

      Button('subStyledString')
        .key('subStyledString')
        .onClick(() => {
          this.getStyle =  JSON.stringify(this.styledString1.subStyledString(0, this.styledString1.length))
        })

      Row() {
        Button('replaceStyle')
          .key('replaceStyle')
          .onClick(() => {
            this.mutableStyledString1.replaceStyle(this.spanStyle1)
            this.controller2.setStyledString(this.mutableStyledString1)
            let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length)
            let fontAttr = styles[0].styledValue as TextStyle;
            this.getStyle2 = '' + styles[0].start + styles[0].length + styles[0].styledKey + fontAttr.fontColor
          })

        Button('removeStyle')
          .key('removeStyle')
          .onClick(() => {
            this.mutableStyledString1.removeStyle(0, this.mutableStyledString1.length, StyledStringKey.FONT)
            this.controller2.setStyledString(this.mutableStyledString1)
          })
      }

      Row() {
        Button('replaceString')
          .key('replaceString')
          .onClick(() => {
            this.mutableStyledString1.replaceString(0,this.mutableStyledString1.length,'321')
            this.controller2.setStyledString(this.mutableStyledString1)
            let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length)
            let fontAttr = styles[0].styledValue as TextStyle;
            this.getStyle2 = '' + styles[0].start + styles[0].length + styles[0].styledKey + fontAttr.fontColor
          })
        Button('insertString')
          .key('insertString')
          .onClick(() => {
            this.mutableStyledString1.insertString(0,'0')
            this.controller2.setStyledString(this.mutableStyledString1)
            let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length)
            let fontAttr = styles[0].styledValue as TextStyle;
            this.getStyle2 = '' + styles[0].start + styles[0].length + styles[0].styledKey + fontAttr.fontColor

          })
      }

      Row() {
        Button('removeString')
          .key('removeString')
          .onClick(() => {
            this.mutableStyledString1.removeString(0,1)
            this.controller2.setStyledString(this.mutableStyledString1)
            let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length)
            let fontAttr = styles[0].styledValue as TextStyle;
            this.getStyle2 = '' + styles[0].start + styles[0].length + styles[0].styledKey + fontAttr.fontColor

          })

      }

















    }.width('100%')
  }
}
