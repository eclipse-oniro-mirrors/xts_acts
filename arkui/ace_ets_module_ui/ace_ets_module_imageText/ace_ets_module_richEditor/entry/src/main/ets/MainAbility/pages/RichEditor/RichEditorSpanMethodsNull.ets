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
struct RichEditorSpanMethodsNull {
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
  controller23: RichEditorController = new RichEditorController();
  controller24: RichEditorController = new RichEditorController();
  controller25: RichEditorController = new RichEditorController();

  @Builder
  customBuilder() {
    Text('Builder')
  }

  build() {
    Column({ space: 10 }) {
      // addTextSpan all null test
      RichEditor({ controller: this.controller1 })
        .id('richEditor_addTextSpan_all_null')
        .onReady(() => {
          this.controller1.addTextSpan(null, null);
        })
        .height('3%')

      // addTextSpan all undefined test
      RichEditor({ controller: this.controller2 })
        .id('richEditor_addTextSpan_all_undefined')
        .onReady(() => {
          this.controller2.addTextSpan(undefined, undefined);
        })
        .height('3%')

      // addTextSpan content empty string test
      RichEditor({ controller: this.controller3 })
        .id('richEditor_addTextSpan_content_empty')
        .onReady(() => {
          this.controller3.addTextSpan('', null);
        })
        .height('3%')

      // addImageSpan all null test
      RichEditor({ controller: this.controller4 })
        .id('richEditor_addImageSpan_all_null')
        .onReady(() => {
          this.controller4.addImageSpan(null, null);
        })
        .height('3%')

      // addImageSpan all undefined test
      RichEditor({ controller: this.controller5 })
        .id('richEditor_addImageSpan_all_undefined')
        .onReady(() => {
          this.controller5.addImageSpan(undefined, undefined);
        })
        .height('3%')

      // addImageSpan value null test
      RichEditor({ controller: this.controller6 })
        .id('richEditor_addImageSpan_value_null')
        .onReady(() => {
          this.controller6.addImageSpan(null);
        })
        .height('3%')

      // addBuilderSpan all null test
      RichEditor({ controller: this.controller7 })
        .id('richEditor_addBuilderSpan_all_null')
        .onReady(() => {
          this.controller7.addBuilderSpan(null, null);
        })
        .height('3%')

      // addBuilderSpan all undefined test
      RichEditor({ controller: this.controller8 })
        .id('richEditor_addBuilderSpan_all_undefined')
        .onReady(() => {
          this.controller8.addBuilderSpan(undefined, undefined);
        })
        .height('3%')

      // addBuilderSpan value null test
      RichEditor({ controller: this.controller9 })
        .id('richEditor_addBuilderSpan_value_null')
        .onReady(() => {
          this.controller9.addBuilderSpan(null);
        })
        .height('3%')

      // addSymbolSpan all null test
      RichEditor({ controller: this.controller10 })
        .id('richEditor_addSymbolSpan_all_null')
        .onReady(() => {
          this.controller10.addSymbolSpan(null, null);
        })
        .height('3%')

      // addSymbolSpan all undefined test
      RichEditor({ controller: this.controller11 })
        .id('richEditor_addSymbolSpan_all_undefined')
        .onReady(() => {
          this.controller11.addSymbolSpan(undefined, undefined);
        })
        .height('3%')

      // addSymbolSpan value null test
      RichEditor({ controller: this.controller12 })
        .id('richEditor_addSymbolSpan_value_null')
        .onReady(() => {
          this.controller12.addSymbolSpan(null);
        })
        .height('3%')

      // updateSpanStyle all null test
      RichEditor({ controller: this.controller13 })
        .id('richEditor_updateSpanStyle_all_null')
        .onReady(() => {
          this.controller13.addTextSpan('test');
          this.controller13.updateSpanStyle(null);
        })
        .height('3%')

      // updateSpanStyle all undefined test
      RichEditor({ controller: this.controller14 })
        .id('richEditor_updateSpanStyle_all_undefined')
        .onReady(() => {
          this.controller14.addTextSpan('test');
          this.controller14.updateSpanStyle(undefined);
        })
        .height('3%')

      // updateSpanStyle value null test
      RichEditor({ controller: this.controller15 })
        .id('richEditor_updateSpanStyle_value_null')
        .onReady(() => {
          this.controller15.addTextSpan('test');
          this.controller15.updateSpanStyle(null);
        })
        .height('3%')

      // updateSpanStyle text options null test
      RichEditor({ controller: this.controller16 })
        .id('richEditor_updateSpanStyle_text_null')
        .onReady(() => {
          this.controller16.addTextSpan('test content for style update');
          this.controller16.updateSpanStyle(null);
        })
        .height('3%')

      // updateSpanStyle text options undefined test
      RichEditor({ controller: this.controller17 })
        .id('richEditor_updateSpanStyle_text_undefined')
        .onReady(() => {
          this.controller17.addTextSpan('test content for style update');
          this.controller17.updateSpanStyle(undefined);
        })
        .height('3%')

      // addTextSpan content null test
      RichEditor({ controller: this.controller18 })
        .id('richEditor_addTextSpan_content_null')
        .onReady(() => {
          this.controller18.addTextSpan(null);
        })
        .height('3%')

      // addTextSpan content undefined test
      RichEditor({ controller: this.controller19 })
        .id('richEditor_addTextSpan_content_undefined')
        .onReady(() => {
          this.controller19.addTextSpan(undefined);
        })
        .height('3%')

      // addTextSpan options null test
      RichEditor({ controller: this.controller20 })
        .id('richEditor_addTextSpan_options_null')
        .onReady(() => {
          this.controller20.addTextSpan('test', null);
        })
        .height('3%')

      // addTextSpan options undefined test
      RichEditor({ controller: this.controller21 })
        .id('richEditor_addTextSpan_options_undefined')
        .onReady(() => {
          this.controller21.addTextSpan('test', undefined);
        })
        .height('3%')

      // addImageSpan value undefined test
      RichEditor({ controller: this.controller22 })
        .id('richEditor_addImageSpan_value_undefined')
        .onReady(() => {
          this.controller22.addImageSpan(undefined);
        })
        .height('3%')

      // addImageSpan options null test
      RichEditor({ controller: this.controller23 })
        .id('richEditor_addImageSpan_options_null')
        .onReady(() => {
          this.controller23.addImageSpan('', null);
        })
        .height('3%')

      // addImageSpan options undefined test
      RichEditor({ controller: this.controller24 })
        .id('richEditor_addImageSpan_options_undefined')
        .onReady(() => {
          this.controller24.addImageSpan('', undefined);
        })
        .height('3%')

      // addSymbolSpan value undefined test
      RichEditor({ controller: this.controller25 })
        .id('richEditor_addSymbolSpan_value_undefined')
        .onReady(() => {
          this.controller25.addSymbolSpan(undefined);
        })
        .height('3%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
