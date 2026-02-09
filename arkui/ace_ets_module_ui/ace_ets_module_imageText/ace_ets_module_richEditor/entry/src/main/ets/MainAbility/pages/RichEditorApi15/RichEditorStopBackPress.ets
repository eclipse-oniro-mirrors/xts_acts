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
struct RichEditorStopBackPress {
  controller1: RichEditorController = new RichEditorController()
  controller2: RichEditorController = new RichEditorController()
  controller3: RichEditorController = new RichEditorController()
  controller4: RichEditorController = new RichEditorController()
  options1: RichEditorOptions = { controller: this.controller1 };  
  options2: RichEditorOptions = { controller: this.controller2 };  
  options3: RichEditorOptions = { controller: this.controller3 };  
  options4: RichEditorOptions = { controller: this.controller4 };

  build() {
    Column({ space: 1 }) {
      Text('RichEditor: stopBackPress').height('10%')
      RichEditor(this.options1)
        .id('RichEditor_stopBackPress_true')
        .stopBackPress(true)
        .height('20%')

      RichEditor(this.options2)
        .id('RichEditor_stopBackPress_false')
        .stopBackPress(false)
        .height('20%')

      RichEditor(this.options3)
        .id('RichEditor_stopBackPress_default')
        .height('20%')

      RichEditor(this.options4)
        .id('RichEditor_stopBackPress_undefined')
        .stopBackPress(undefined)
        .height('20%')
    }.width('100%')
  }
}