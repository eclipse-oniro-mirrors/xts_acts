/*
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
struct RichEditorEnableSelectedDataDetectorTest {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };
  options3: RichEditorOptions = { controller: this.controller3 };
  options4: RichEditorOptions = { controller: this.controller4 };

  build() {
    Column() {
      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('RichEditor:enableSelectedDataDetector(true)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableSelectedDataDetector_true')
        .enableSelectedDataDetector(true)

      RichEditor(this.options2)
        .onReady(() => {
          this.controller2.addTextSpan('RichEditor:enableSelectedDataDetector(false)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableSelectedDataDetector_false')
        .enableSelectedDataDetector(false)

      RichEditor(this.options3)
        .onReady(() => {
          this.controller3.addTextSpan('RichEditor:enableSelectedDataDetector(undefined)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableSelectedDataDetector_undefined')
        .enableSelectedDataDetector(undefined)

      RichEditor(this.options4)
        .onReady(() => {
          this.controller4.addTextSpan('RichEditor:enableSelectedDataDetector(undefined)',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .id('RichEditor_enableSelectedDataDetector_default')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}