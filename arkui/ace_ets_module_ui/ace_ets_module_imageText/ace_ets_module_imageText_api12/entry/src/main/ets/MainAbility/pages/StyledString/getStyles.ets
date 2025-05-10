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
struct getStylesDemo {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State text: string = '';
  @State text2: string = '';
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
        Text(this.text).id('text')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('5%')

      Column() {
        Text(this.text2).id('text2')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('5%')

      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('把这些文字转换成属性字符串');
        })
        .height('10%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)

      Button('getStyles')
        .onClick(() => {
          try {
            let styles = this.mutableStyledString.getStyles(20, 100)
          }
          catch (e) {
            this.text = e.code;
          }

        })
        .height('10%')
        .id('getStyles')

      Button('subStyledString')
        .onClick(() => {
          try {
            this.mutableStyledString.subStyledString(20, 100)
          }
          catch (e) {
            this.text2 = e.code;
          }
        })
        .height('10%')
        .id('subStyledString')

    }
  }
}
