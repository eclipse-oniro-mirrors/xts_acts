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
struct RichEditorStyledUndo {
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
        .id('RichEditor_undoStyle_CLEAR_STYLE')
        .onReady(()=>{
          this.controller1.addTextSpan('UndoStyle.CLEAR_STYLE',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 10
              }
            })
        })
        .undoStyle(UndoStyle.CLEAR_STYLE)
        .borderWidth(1)
        .width('100%')
        .height('10%')

      RichEditor(this.options2)
        .id('RichEditor_undoStyle_KEEP_STYLE')
        .onReady(()=>{
          this.controller2.addTextSpan('UndoStyle.KEEP_STYLE',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 10
              }
            })
        })
        .undoStyle(UndoStyle.KEEP_STYLE)
        .borderWidth(1)
        .width('100%')
        .height('10%')

      RichEditor(this.options3)
        .id('RichEditor_undoStyle_default')
        .onReady(()=>{
          this.controller3.addTextSpan('UndoStyle: default',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 10
              }
            })
        })
        .borderWidth(1)
        .width('100%')
        .height('10%')

      RichEditor(this.options4)
        .id('RichEditor_undoStyle_undefined')
        .onReady(()=>{
          this.controller4.addTextSpan('undoStyle: undefined',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 10
              }
            })
        })
        .undoStyle(undefined)
        .borderWidth(1)
        .width('100%')
        .height('10%')
    }
  }
}