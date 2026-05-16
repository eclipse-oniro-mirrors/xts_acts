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
struct RichEditorControllerMethodsNull2 {
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
  controller15: RichEditorController = new RichEditorController();
  controller16: RichEditorController = new RichEditorController();
  controller17: RichEditorController = new RichEditorController();
  controller18: RichEditorController = new RichEditorController();
  controller19: RichEditorController = new RichEditorController();
  controller20: RichEditorController = new RichEditorController();
  controller21: RichEditorController = new RichEditorController();
  controller22: RichEditorController = new RichEditorController();

  build() {
    Column({ space: 10 }) {
      // updateParagraphStyle null test
      RichEditor({ controller: this.controller1 })
        .id('richEditor_updateParagraphStyle_null')
        .onReady(() => {
          this.controller1.addTextSpan('test content');
          this.controller1.updateParagraphStyle(null);
        })
        .height('3%')

      // updateParagraphStyle undefined test
      RichEditor({ controller: this.controller2 })
        .id('richEditor_updateParagraphStyle_undefined')
        .onReady(() => {
          this.controller2.addTextSpan('test content');
          this.controller2.updateParagraphStyle(undefined);
        })
        .height('3%')

      // deleteSpans null test
      RichEditor({ controller: this.controller3 })
        .id('richEditor_deleteSpans_null')
        .onReady(() => {
          this.controller3.addTextSpan('test content');
          this.controller3.deleteSpans(null);
        })
        .height('3%')

      // deleteSpans undefined test
      RichEditor({ controller: this.controller4 })
        .id('richEditor_deleteSpans_undefined')
        .onReady(() => {
          this.controller4.addTextSpan('test content');
          this.controller4.deleteSpans(undefined);
        })
        .height('3%')

      // getSpans null test
      RichEditor({ controller: this.controller5 })
        .id('richEditor_getSpans_null')
        .onReady(() => {
          this.controller5.addTextSpan('test content');
          let spans = this.controller5.getSpans(null);
        })
        .height('3%')

      // getSpans undefined test
      RichEditor({ controller: this.controller6 })
        .id('richEditor_getSpans_undefined')
        .onReady(() => {
          this.controller6.addTextSpan('test content');
          let spans = this.controller6.getSpans(undefined);
        })
        .height('3%')

      // getParagraphs null test
      RichEditor({ controller: this.controller7 })
        .id('richEditor_getParagraphs_null')
        .onReady(() => {
          this.controller7.addTextSpan('test content');
          let paragraphs = this.controller7.getParagraphs(null);
        })
        .height('3%')

      // getParagraphs undefined test
      RichEditor({ controller: this.controller8 })
        .id('richEditor_getParagraphs_undefined')
        .onReady(() => {
          this.controller8.addTextSpan('test content');
          let paragraphs = this.controller8.getParagraphs(undefined);
        })
        .height('3%')

      // fromStyledString null test
      RichEditor({ controller: this.controller9 })
        .id('richEditor_fromStyledString_null')
        .onReady(() => {
          let mutableStyledString:MutableStyledString = new MutableStyledString('');
          let spans = this.controller9.fromStyledString(null);
        })
        .height('3%')

      // fromStyledString undefined test
      RichEditor({ controller: this.controller10 })
        .id('richEditor_fromStyledString_undefined')
        .onReady(() => {
          let mutableStyledString:MutableStyledString = new MutableStyledString('');
          let spans = this.controller10.fromStyledString(undefined);
        })
        .height('3%')

      // toStyledString null test
      RichEditor({ controller: this.controller11 })
        .id('richEditor_toStyledString_null')
        .onReady(() => {
          this.controller11.addTextSpan('test content');
          let styledString = this.controller11.toStyledString(null);
        })
        .height('3%')

      // toStyledString undefined test
      RichEditor({ controller: this.controller12 })
        .id('richEditor_toStyledString_undefined')
        .onReady(() => {
          this.controller12.addTextSpan('test content');
          let styledString = this.controller12.toStyledString(undefined);
        })
        .height('3%')

      // updateParagraphStyle start null test
      RichEditor({ controller: this.controller13 })
        .id('richEditor_updateParagraphStyle_start_null')
        .onReady(() => {
          this.controller13.addTextSpan('test content');
          this.controller13.updateParagraphStyle(null);
        })
        .height('3%')

      // updateParagraphStyle start undefined test
      RichEditor({ controller: this.controller14 })
        .id('richEditor_updateParagraphStyle_start_undefined')
        .onReady(() => {
          this.controller14.addTextSpan('test content');
          this.controller14.updateParagraphStyle(undefined);
        })
        .height('3%')

      // updateParagraphStyle end null test
      RichEditor({ controller: this.controller15 })
        .id('richEditor_updateParagraphStyle_end_null')
        .onReady(() => {
          this.controller15.addTextSpan('test content');
          this.controller15.updateParagraphStyle(null);
        })
        .height('3%')

      // updateParagraphStyle end undefined test
      RichEditor({ controller: this.controller16 })
        .id('richEditor_updateParagraphStyle_end_undefined')
        .onReady(() => {
          this.controller16.addTextSpan('test content');
          this.controller16.updateParagraphStyle(undefined);
        })
        .height('3%')

      // deleteSpans start null test
      RichEditor({ controller: this.controller17 })
        .id('richEditor_deleteSpans_start_null')
        .onReady(() => {
          this.controller17.addTextSpan('test content');
          this.controller17.deleteSpans({ start: null, end: 4 });
        })
        .height('3%')

      // deleteSpans start undefined test
      RichEditor({ controller: this.controller18 })
        .id('richEditor_deleteSpans_start_undefined')
        .onReady(() => {
          this.controller18.addTextSpan('test content');
          this.controller18.deleteSpans({ start: undefined, end: 4 });
        })
        .height('3%')

      // deleteSpans end null test
      RichEditor({ controller: this.controller19 })
        .id('richEditor_deleteSpans_end_null')
        .onReady(() => {
          this.controller19.addTextSpan('test content');
          this.controller19.deleteSpans({ start: 0, end: null });
        })
        .height('3%')

      // deleteSpans end undefined test
      RichEditor({ controller: this.controller20 })
        .id('richEditor_deleteSpans_end_undefined')
        .onReady(() => {
          this.controller20.addTextSpan('test content');
          this.controller20.deleteSpans({ start: 0, end: undefined });
        })
        .height('3%')

      // getSpans start null test
      RichEditor({ controller: this.controller21 })
        .id('richEditor_getSpans_start_null')
        .onReady(() => {
          this.controller21.addTextSpan('test content');
          let spans = this.controller21.getSpans({ start: null, end: 4 });
        })
        .height('3%')

      // getSpans start undefined test
      RichEditor({ controller: this.controller22 })
        .id('richEditor_getSpans_start_undefined')
        .onReady(() => {
          this.controller22.addTextSpan('test content');
          let spans = this.controller22.getSpans({ start: undefined, end: 4 });
        })
        .height('3%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
