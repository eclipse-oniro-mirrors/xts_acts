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
import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct RichEditorScrollBarColor {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };
  options3: RichEditorOptions = { controller: this.controller3 };
  options4: RichEditorOptions = { controller: this.controller4 };
  options5: RichEditorOptions = { controller: this.controller5 };

  build() {
    Column({ space: 1 }) {
      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('ColorMetrics.resourceColor("#2787D9")\nColorMetrics.resourceColor("#2787D9")',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_ColorMetrics_resourceColor')
        .scrollBarColor(ColorMetrics.resourceColor('#2787D9'))
        .maxLines(1)
        .borderWidth(1)
        .height('5%')

      RichEditor(this.options2)
        .onReady(() => {
          this.controller2.addTextSpan('ColorMetrics.rgba(225,130,225)\nColorMetrics.rgba(225,130,225)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_ColorMetrics_rgba')
        .scrollBarColor(ColorMetrics.rgba(225, 130, 225))
        .maxLines(1)
        .borderWidth(1)
        .height('5%')

      RichEditor(this.options3)
        .onReady(() => {
          this.controller3.addTextSpan('RichEditor：scrollBarColor(default)\nRichEditor：scrollBarColor(default)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_scrollBarColor_default')
        .maxLines(1)
        .borderWidth(1)
        .height('5%')

      RichEditor(this.options4)
        .onReady(() => {
          this.controller4.addTextSpan('RichEditor：scrollBarColor(undefined)\nRichEditor：scrollBarColor(undefined)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_scrollBarColor_undefined')
        .scrollBarColor(undefined)
        .maxLines(1)
        .borderWidth(1)
        .height('5%')

      RichEditor(this.options5)
        .onReady(() => {
          this.controller5.addTextSpan('RichEditor：scrollBarColor(null)\nRichEditor：scrollBarColor(null)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_scrollBarColor_null')
        .scrollBarColor(null)
        .maxLines(1)
        .borderWidth(1)
        .height('5%')
    }.height('100%')
  }
}