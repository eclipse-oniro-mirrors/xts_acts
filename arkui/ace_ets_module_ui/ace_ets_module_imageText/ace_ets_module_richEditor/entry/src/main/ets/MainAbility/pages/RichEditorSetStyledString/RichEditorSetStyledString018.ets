/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct RichEditorSetStyledString018 {
  stringLength: number = 0;
  @State baseLineStr: string = '';
  @State shadowValues: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  // 创建有多种样式组合对象mutableStyledString2
  mutableStyledString1: MutableStyledString = new MutableStyledString('abcde', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr1
  }, {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.DECORATION,
    styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Blue })
  }, {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.TEXT_SHADOW,
    styledValue: new TextShadowStyle({
      radius: 5,
      type: ShadowType.COLOR,
      color: Color.Yellow,
      offsetX: 10,
      offsetY: -10
    })
  }, {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.BASELINE_OFFSET,
    styledValue: new BaselineOffsetStyle(LengthMetrics.vp(20))
  }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};
  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString1)
  }

  build() {
    Column() {
      Text('baseLineStr:' + this.baseLineStr).id('baseLineStr')
      Text('shadowValues:' + this.shadowValues).id('shadowValues')

      Button('get text style')
        .onClick(() => {
          let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 2) {
                let baselineAttr = styles[i].styledValue as BaselineOffsetStyle;
                this.baseLineStr = baselineAttr.baselineOffset + '';
              }

              if (styles[i].styledKey === 4) {
                let textShadowAttr = styles[i].styledValue as TextShadowStyle;
                let shadowValues = textShadowAttr.textShadow;
                if (shadowValues.length > 0) {
                  for (let j = 0; j < shadowValues.length; j++) {
                    this.shadowValues = JSON.stringify(shadowValues[j]);
                  }
                }
              }
            }
          }
        })
        .id('get_style')
        .margin({ top: 10 })
      RichEditor(this.options)
        .onReady(() => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .backgroundColor(Color.Red)
        .borderColor(Color.Black).id('RichEditorSetStyledString018')
    }
  }
}