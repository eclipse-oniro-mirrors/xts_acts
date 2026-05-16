/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TextAreaControllerMethodsNull {
  controller1: TextAreaController = new TextAreaController();
  controller2: TextAreaController = new TextAreaController();
  controller3: TextAreaController = new TextAreaController();
  controller4: TextAreaController = new TextAreaController();
  controller5: TextAreaController = new TextAreaController();
  controller6: TextAreaController = new TextAreaController();

  build() {
    Column({ space: 10 }) {
      // caretPosition null test
      TextArea({ placeholder: 'caretPosition null test', controller: this.controller1 })
        .id('textArea_caretPosition_null')
        .height('5%')

      // caretPosition undefined test
      TextArea({ placeholder: 'caretPosition undefined test', controller: this.controller2 })
        .id('textArea_caretPosition_undefined')
        .height('5%')

      // setTextSelection selectionStart null test
      TextArea({ placeholder: 'setTextSelection selectionStart null test', controller: this.controller3 })
        .id('textArea_setTextSelection_start_null')
        .height('5%')

      // setTextSelection selectionStart undefined test
      TextArea({ placeholder: 'setTextSelection selectionStart undefined test', controller: this.controller4 })
        .id('textArea_setTextSelection_start_undefined')
        .height('5%')

      // setTextSelection selectionEnd null test
      TextArea({ placeholder: 'setTextSelection selectionEnd null test', controller: this.controller5 })
        .id('textArea_setTextSelection_end_null')
        .height('5%')

      // setTextSelection selectionEnd undefined test
      TextArea({ placeholder: 'setTextSelection selectionEnd undefined test', controller: this.controller6 })
        .id('textArea_setTextSelection_end_undefined')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {
      try {
        this.controller1.caretPosition(null);
      } catch (e) {
        console.info('caretPosition null error: ' + JSON.stringify(e));
      }

      try {
        this.controller2.caretPosition(undefined);
      } catch (e) {
        console.info('caretPosition undefined error: ' + JSON.stringify(e));
      }

      try {
        this.controller3.setTextSelection(null, 1, null);
      } catch (e) {
        console.info('setTextSelection null start error: ' + JSON.stringify(e));
      }

      try {
        this.controller4.setTextSelection(undefined, 1, undefined);
      } catch (e) {
        console.info('setTextSelection undefined start error: ' + JSON.stringify(e));
      }

      try {
        this.controller5.setTextSelection(0, null);
      } catch (e) {
        console.info('setTextSelection null end error: ' + JSON.stringify(e));
      }

      try {
        this.controller6.setTextSelection(0, undefined);
      } catch (e) {
        console.info('setTextSelection undefined end error: ' + JSON.stringify(e));
      }
    })
  }
}
