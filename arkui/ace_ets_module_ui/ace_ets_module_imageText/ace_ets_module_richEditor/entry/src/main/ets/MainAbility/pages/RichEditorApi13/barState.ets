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
struct RichEditorBarState {
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
    Column() {
      RichEditor(this.options1)
        .barState(BarState.Auto)
        .id('RichEditor_BarState_Auto')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller1.addTextSpan('BarState.Auto')
        })

      RichEditor(this.options2)
        .barState(BarState.Off)
        .id('RichEditor_BarState_Off')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller2.addTextSpan('BarState.Off')
        })

      RichEditor(this.options3)
        .barState(BarState.On)
        .id('RichEditor_BarState_On')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller3.addTextSpan('BarState.On')
        })

      RichEditor(this.options4)
        .id('RichEditor_barState_default')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller4.addTextSpan('default')
        })

      RichEditor(this.options5)
        .barState(undefined)
        .id('RichEditor_barState_undefined')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller5.addTextSpan('undefined')
        })
    }.justifyContent(FlexAlign.Center)
  }
}