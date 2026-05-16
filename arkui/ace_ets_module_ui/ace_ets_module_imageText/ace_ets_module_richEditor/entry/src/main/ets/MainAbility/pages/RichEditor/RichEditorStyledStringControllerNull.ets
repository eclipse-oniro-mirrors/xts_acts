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
struct RichEditorStyledStringControllerNull {
  controller1: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller3: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller4: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller5: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller6: RichEditorStyledStringController = new RichEditorStyledStringController();

  build() {
    Column({ space: 10 }) {
      // setStyledString null test
      RichEditor({ controller: this.controller1 })
        .id('richEditor_ss_setStyledString_null')
        .onReady(() => {
          this.controller1.setStyledString(null);
        })
        .height('5%')

      // setStyledString undefined test
      RichEditor({ controller: this.controller2 })
        .id('richEditor_ss_setStyledString_undefined')
        .onReady(() => {
          this.controller2.setStyledString(undefined);
        })
        .height('5%')

      // setStyledString empty string test
      RichEditor({ controller: this.controller3 })
        .id('richEditor_ss_setStyledString_empty')
        .onReady(() => {
          let mutableStyledString = new MutableStyledString('');
          this.controller3.setStyledString(mutableStyledString);
        })
        .height('5%')

      // onContentChanged null test
      RichEditor({ controller: this.controller4 })
        .id('richEditor_ss_onContentChanged_null')
        .onReady(() => {
          this.controller4.onContentChanged(null);
        })
        .height('5%')

      // onContentChanged undefined test
      RichEditor({ controller: this.controller5 })
        .id('richEditor_ss_onContentChanged_undefined')
        .onReady(() => {
          this.controller5.onContentChanged(undefined);
        })
        .height('5%')

      // setStyledString with StyledString null test
      RichEditor({ controller: this.controller6 })
        .id('richEditor_ss_styledString_null')
        .onReady(() => {
          this.controller6.setStyledString(null);
        })
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
