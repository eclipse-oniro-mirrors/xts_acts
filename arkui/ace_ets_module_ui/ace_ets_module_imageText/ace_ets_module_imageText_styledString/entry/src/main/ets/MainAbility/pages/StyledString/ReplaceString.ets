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
import { image } from '@kit.ImageKit'

@Entry
@Component
struct ReplaceStringTest {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State text: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: 'HarmonyOS Sans',
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Italic
  })
  controller1: RichEditorController = new RichEditorController()
  options1: RichEditorOptions = { controller: this.controller1 };
  // 创建属性字符串对象
  mutableStyledString: MutableStyledString = new MutableStyledString('初始属性字符串',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  styledString: StyledString = new StyledString('插入属性字符串',
    [{
      start: 2,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle2
    }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  @State html : string | undefined | number = '132456'


  build() {
    Column() {
      Column() {
        Text(this.text).id('textReplaceStringTest')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('10%')

      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('把这些文字转换成属性字符串');
        })
        .height('10%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)

      Button('dianji')
        .onClick(() => {
          this.text = '';
        })
        .id('butReplaceStringTest')
        .height('5%')

      Button('replaceString')
        .onClick(() => {
          try {
            this.mutableStyledString.replaceString(20, 100, '789');
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('replaceStringReplaceStringTest')

      Button('insertString')
        .onClick(() => {
          try {
            this.mutableStyledString.insertString(100, '789');
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('insertStringReplaceStringTest')

      Button('removeString')
        .onClick(() => {
          try {
            this.mutableStyledString.removeString(100, 100);
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('removeStringReplaceStringTest')

      Button('replaceStyle')
        .onClick(() => {
          try {
            this.mutableStyledString.replaceStyle({
              start: 100,
              length: 2,
              styledKey: StyledStringKey.FONT,
              styledValue: new TextStyle({ fontColor: Color.Blue })
            });
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('replaceStyleReplaceStringTest')

      Button('setStyle')
        .onClick(() => {
          try {
            this.mutableStyledString.setStyle({
              start: 100,
              length: 2,
              styledKey: StyledStringKey.FONT,
              styledValue: new TextStyle({ fontColor: Color.Blue })
            })
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('setStyleReplaceStringTest')

      Button('removeStyle')
        .onClick(() => {
          try {
            this.mutableStyledString.removeStyle(100, 1, StyledStringKey.DECORATION)
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('removeStyleReplaceStringTest')

      Button('removeStyles')
        .onClick(() => {
          try {
            this.mutableStyledString.removeStyles(100, 1)
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('removeStylesReplaceStringTest')

      Button('replaceStyledString')
        .onClick(() => {
          try {
            this.mutableStyledString.replaceStyledString(100, 1, new StyledString('abc', [{
              start: 0,
              length: 3,
              styledKey: StyledStringKey.FONT,
              styledValue: new TextStyle({fontColor: Color.Blue})
            }]))
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('replaceStyledStringReplaceStringTest')

      Button('insertStyledString')
        .onClick(() => {
          try {
            this.mutableStyledString.insertStyledString(100, new StyledString('A'))
          } catch (e) {
            this.text = e.code;
          }
        })
        .height('5%')
        .id('insertStyledStringReplaceStringTest')

    }
  }
}
