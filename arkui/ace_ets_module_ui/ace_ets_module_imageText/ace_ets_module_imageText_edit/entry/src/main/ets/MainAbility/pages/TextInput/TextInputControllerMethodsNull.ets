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
struct TextInputControllerMethodsNull {
  controller1: TextInputController = new TextInputController();
  controller2: TextInputController = new TextInputController();
  controller3: TextInputController = new TextInputController();
  controller4: TextInputController = new TextInputController();

  build() {
    Column({ space: 10 }) {
      // setTextSelection selectionStart null test
      TextInput({ placeholder: 'setTextSelection selectionStart null test', controller: this.controller1 })
        .id('textInput_setTextSelection_start_null')
        .height('5%')

      // setTextSelection selectionStart undefined test
      TextInput({ placeholder: 'setTextSelection selectionStart undefined test', controller: this.controller2 })
        .id('textInput_setTextSelection_start_undefined')
        .height('5%')

      // setTextSelection selectionEnd null test
      TextInput({ placeholder: 'setTextSelection selectionEnd null test', controller: this.controller3 })
        .id('textInput_setTextSelection_end_null')
        .height('5%')

      // setTextSelection selectionEnd undefined test
      TextInput({ placeholder: 'setTextSelection selectionEnd undefined test', controller: this.controller4 })
        .id('textInput_setTextSelection_end_undefined')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {
      try {
        this.controller1.setTextSelection(null, 1, null);
      } catch (e) {
        console.info('setTextSelection null start error: ' + JSON.stringify(e));
      }

      try {
        this.controller2.setTextSelection(undefined, 1, undefined);
      } catch (e) {
        console.info('setTextSelection undefined start error: ' + JSON.stringify(e));
      }

      try {
        this.controller3.setTextSelection(0, null);
      } catch (e) {
        console.info('setTextSelection null end error: ' + JSON.stringify(e));
      }

      try {
        this.controller4.setTextSelection(0, undefined);
      } catch (e) {
        console.info('setTextSelection undefined end error: ' + JSON.stringify(e));
      }
    })
  }
}
