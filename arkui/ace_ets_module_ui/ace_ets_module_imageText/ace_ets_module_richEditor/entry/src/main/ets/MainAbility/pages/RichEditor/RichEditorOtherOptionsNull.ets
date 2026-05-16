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
struct RichEditorOtherOptionsNull {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  @Builder
  CustomMenuBuilder() {
    Column() {
      Text('Menu Item')
        .fontSize(20)
    }
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        RichEditor(this.options)
          .id('richEditor_undoStyle_null')
          .undoStyle(null)
          .height('5%')

        RichEditor(this.options)
          .id('richEditor_undoStyle_undefined')
          .undoStyle(undefined)
          .height('5%')
      }

      Row() {
        RichEditor(this.options)
          .id('richEditor_singleLine_null')
          .singleLine(null)
          .height('5%')

        RichEditor(this.options)
          .id('richEditor_singleLine_undefined')
          .singleLine(undefined)
          .height('5%')
      }

      Row() {
        RichEditor(this.options)
          .id('richEditor_selectedDragPreviewStyle_null')
          .selectedDragPreviewStyle(null)
          .height('5%')

        RichEditor(this.options)
          .id('richEditor_selectedDragPreviewStyle_undefined')
          .selectedDragPreviewStyle(undefined)
          .height('5%')
      }

      Row() {
        RichEditor(this.options)
          .id('richEditor_compressLeadingPunctuation_null')
          .compressLeadingPunctuation(null)
          .height('5%')

        RichEditor(this.options)
          .id('richEditor_compressLeadingPunctuation_undefined')
          .compressLeadingPunctuation(undefined)
          .height('5%')
      }

      Row() {
        // Test: RichEditorSpanType.IMAGE
        RichEditor(this.options)
          .id('richEditor_RichEditorSpanType_IMAGE')
          .bindSelectionMenu(RichEditorSpanType.IMAGE, this.CustomMenuBuilder, ResponseType.LongPress)
          .height('5%')

        // Test: RichEditorSpanType.MIXED
        RichEditor(this.options)
          .id('richEditor_RichEditorSpanType_MIXED')
          .bindSelectionMenu(RichEditorSpanType.MIXED, this.CustomMenuBuilder, ResponseType.LongPress)
          .height('5%')
      }

      RichEditor(this.options)
        .id('richEditor_otherOptions_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
