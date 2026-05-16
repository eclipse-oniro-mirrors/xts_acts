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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct StyledStringStrokeTest {
  spanStyle1: SpanStyle = {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({
      fontColor: Color.Pink,
      strokeWidth: undefined,
      strokeColor: undefined,
      fontWeight: FontWeight.Bolder,
      fontSize: LengthMetrics.vp(20)
    })
  };
  spanStyle2: SpanStyle = {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({
      fontColor: Color.Red,
      strokeWidth: LengthMetrics.vp(5),
      strokeColor: '#FF125AD6',
      fontWeight: FontWeight.Bolder,
      fontSize: LengthMetrics.vp(20)
    })
  };
  spanStyle3: SpanStyle = {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({
      fontColor: Color.Red,
      strokeWidth: LengthMetrics.vp(-5),
      strokeColor: Color.Green,
      fontWeight: FontWeight.Bolder,
      fontSize: LengthMetrics.vp(20)
    })
  };
  mutableStyledString: MutableStyledString = new MutableStyledString('这是测试文本', []);
  controller: TextController = new TextController();

  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString);
  }
  build() {
    Column() {
      Text(undefined, { controller: this.controller })
        .margin({ top: 10, bottom: 50 })
        .draggable(true)
        .onDragStart(() => {
        })
        .clip(true)
      Row(){
        Button('spanStyle1').width('30%')
          .onClick(() => {
            this.mutableStyledString.setStyle(this.spanStyle1)
            this.controller.setStyledString(this.mutableStyledString)
          })
          .id('spanStyle1StyledStringStroke')
        Button('spanStyle2').width('30%')
          .onClick(() => {
            this.mutableStyledString.replaceStyle(this.spanStyle2)
            this.controller.setStyledString(this.mutableStyledString)
          })
          .id('spanStyle2StyledStringStroke')
        Button('spanStyle3').width('30%')
          .onClick(() => {
            this.mutableStyledString.setStyle(this.spanStyle3)
            this.controller.setStyledString(this.mutableStyledString)
          })
          .id('spanStyle3StyledStringStroke')
      }
      Button('getStyles')
        .onClick(() => {
          let styles = this.mutableStyledString.getStyles(0, this.mutableStyledString.length)
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              console.info('mutableStyledString style object start:' + styles[i].start)
              console.info('mutableStyledString style object length:' + styles[i].length)
              console.info('mutableStyledString style object key:' + styles[i].styledKey)
              if (styles[i].styledKey === 0) {
                let fontAttr = styles[i].styledValue as TextStyle;
                console.info('mutableStyledString fontColor:' +(fontAttr.fontColor))
                console.info('mutableStyledString fontSize:' + fontAttr.fontSize)
                console.info('mutableStyledString fontWeight:' + fontAttr.fontWeight)
                console.info('mutableStyledString strokeWidth:' + fontAttr.strokeWidth)
                console.info('mutableStyledString strokeColor:' +fontAttr.strokeColor)
                AppStorage.setOrCreate('StyledStringStrokeWidth',fontAttr.strokeWidth)
                AppStorage.setOrCreate('StyledStringStrokeColor',fontAttr.strokeColor)
              }
            }
          }
        })
        .id('getStylesStyledStringStroke')
    }
  }
}