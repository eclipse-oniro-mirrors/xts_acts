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
struct RichEditorControllerMethodsNull {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();
  controller6: RichEditorController = new RichEditorController();
  controller7: RichEditorController = new RichEditorController();
  controller8: RichEditorController = new RichEditorController();
  controller9: RichEditorController = new RichEditorController();
  controller10: RichEditorController = new RichEditorController();
  controller11: RichEditorController = new RichEditorController();
  controller12: RichEditorController = new RichEditorController();
  controller13: RichEditorController = new RichEditorController();
  controller14: RichEditorController = new RichEditorController();

  build() {
    Column({ space: 10 }) {
      // setCaretOffset null test
      RichEditor({ controller: this.controller1 })
        .id('richEditor_setCaretOffset_null')
        .onReady(() => {
          this.controller1.addTextSpan('setCaretOffset null');
          this.controller1.setCaretOffset(null);
        })
        .height('3%')

      // setCaretOffset undefined test
      RichEditor({ controller: this.controller2 })
        .id('richEditor_setCaretOffset_undefined')
        .onReady(() => {
          this.controller2.addTextSpan('setCaretOffset undefined');
          this.controller2.setCaretOffset(undefined);
        })
        .height('3%')

      // setTypingStyle null test
      RichEditor({ controller: this.controller3 })
        .id('richEditor_setTypingStyle_null')
        .onReady(() => {
          this.controller3.addTextSpan('setTypingStyle null');
          this.controller3.setTypingStyle(null);
        })
        .height('3%')

      // setTypingStyle undefined test
      RichEditor({ controller: this.controller4 })
        .id('richEditor_setTypingStyle_undefined')
        .onReady(() => {
          this.controller4.addTextSpan('setTypingStyle undefined');
          this.controller4.setTypingStyle(undefined);
        })
        .height('3%')

      // setTypingParagraphStyle null test
      RichEditor({ controller: this.controller5 })
        .id('richEditor_setTypingParagraphStyle_null')
        .onReady(() => {
          this.controller5.addTextSpan('setTypingParagraphStyle null');
          this.controller5.setTypingParagraphStyle(null);
        })
        .height('3%')

      // setTypingParagraphStyle undefined test
      RichEditor({ controller: this.controller6 })
        .id('richEditor_setTypingParagraphStyle_undefined')
        .onReady(() => {
          this.controller6.addTextSpan('setTypingParagraphStyle undefined');
          this.controller6.setTypingParagraphStyle(undefined);
        })
        .height('3%')

      // setSelection both null test
      RichEditor({ controller: this.controller7 })
        .id('richEditor_setSelection_both_null')
        .onReady(() => {
          this.controller7.addTextSpan('setSelection null null');
          this.controller7.setSelection(null, null);
        })
        .height('3%')

      // setSelection both undefined test
      RichEditor({ controller: this.controller8 })
        .id('richEditor_setSelection_both_undefined')
        .onReady(() => {
          this.controller8.addTextSpan('setSelection undefined undefined');
          this.controller8.setSelection(undefined, undefined);
        })
        .height('3%')

      // setSelection start null test
      RichEditor({ controller: this.controller9 })
        .id('richEditor_setSelection_start_null')
        .onReady(() => {
          this.controller9.addTextSpan('setSelection null 0');
          this.controller9.setSelection(null, 0);
        })
        .height('3%')

      // setSelection start undefined test
      RichEditor({ controller: this.controller10 })
        .id('richEditor_setSelection_start_undefined')
        .onReady(() => {
          this.controller10.addTextSpan('setSelection undefined 0');
          this.controller10.setSelection(undefined, 0);
        })
        .height('3%')

      // setSelection end null test
      RichEditor({ controller: this.controller11 })
        .id('richEditor_setSelection_end_null')
        .onReady(() => {
          this.controller11.addTextSpan('setSelection 0 null');
          this.controller11.setSelection(0, null);
        })
        .height('3%')

      // setSelection end undefined test
      RichEditor({ controller: this.controller12 })
        .id('richEditor_setSelection_end_undefined')
        .onReady(() => {
          this.controller12.addTextSpan('setSelection 0 undefined');
          this.controller12.setSelection(0, undefined);
        })
        .height('3%')

      // setSelection options null test
      RichEditor({ controller: this.controller13 })
        .id('richEditor_setSelection_options_null')
        .onReady(() => {
          this.controller13.addTextSpan('setSelection 0 4 null');
          this.controller13.setSelection(0, 4, null);
        })
        .height('3%')

      // setSelection options undefined test
      RichEditor({ controller: this.controller14 })
        .id('richEditor_setSelection_options_undefined')
        .onReady(() => {
          this.controller14.addTextSpan('setSelection 0 4 undefined');
          this.controller14.setSelection(0, 4, undefined);
        })
        .height('3%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
