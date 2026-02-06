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
struct RichEditorEnableAutoSpacing {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();
  controller6: RichEditorController = new RichEditorController();
  controller7: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };
  options3: RichEditorOptions = { controller: this.controller3 };
  options4: RichEditorOptions = { controller: this.controller4 };
  options5: RichEditorOptions = { controller: this.controller5 };
  options6: RichEditorOptions = { controller: this.controller6 };
  options7: RichEditorOptions = { controller: this.controller7 };

  build() {
    Column({ space: 1 }) {
      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('RichEditor：enableAutoSpacing(true)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableAutoSpacing_true')
        .enableAutoSpacing(true)
        .height('5%')

      RichEditor(this.options2)
        .onReady(() => {
          this.controller2.addTextSpan('RichEditor：enableAutoSpacing(false)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableAutoSpacing_false')
        .enableAutoSpacing(false)
        .height('5%')

      RichEditor(this.options3)
        .onReady(() => {
          this.controller3.addTextSpan('RichEditor：enableAutoSpacing(default)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableAutoSpacing_default')
        .height('5%')

      RichEditor(this.options4)
        .onReady(() => {
          this.controller4.addTextSpan('RichEditor：enableAutoSpacing(undefined)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableAutoSpacing_undefined')
        .enableAutoSpacing(undefined)
        .height('5%')
    }.height('100%')
  }
}