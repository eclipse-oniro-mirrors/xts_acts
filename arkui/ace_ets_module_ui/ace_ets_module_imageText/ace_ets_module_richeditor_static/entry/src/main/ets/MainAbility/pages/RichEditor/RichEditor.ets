/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  RichEditor,
  RichEditorController,
  TextDirection
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RichEditorPage {
  private controllerA: RichEditorController = new RichEditorController();
  private controllerB: RichEditorController = new RichEditorController();

  @State useControllerA: boolean = true;
  @State includeFontPaddingValue: boolean = true;
  @State fallbackLineSpacingValue: boolean = true;
  @State singleLineValue: boolean = false;
  @State compressLeadingPunctuationValue: boolean = false;
  @State deleteBackwardCount: number = 0;
  @State strokeWidthValue: number = 1;
  @State strokeColorValue: string = '#ff0000';
  @State typingStyleStrokeWidthResultValue: string = 'none';
  @State typingStyleStrokeColorResultValue: string = 'none';
  @State paragraphTextDirectionValue: TextDirection = TextDirection.LTR;
  @State accessibilitySpanOptionsLevelValue: string = 'yes';
  @State selectedDragPreviewColorValue: string = '#ff0000';
  private readonly stateKey: string = 'RichEditorPageState';

  private getCurrentController(): RichEditorController {
    return this.useControllerA ? this.controllerA : this.controllerB;
  }

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `useControllerA=${this.useControllerA};includeFontPaddingValue=${this.includeFontPaddingValue};` +
      `fallbackLineSpacingValue=${this.fallbackLineSpacingValue};singleLineValue=${this.singleLineValue};` +
      `compressLeadingPunctuationValue=${this.compressLeadingPunctuationValue};deleteBackwardCount=${this.deleteBackwardCount};` +
      `strokeWidthValue=${this.strokeWidthValue};strokeColorValue=${this.strokeColorValue};` +
      `typingStyleStrokeWidthResultValue=${this.typingStyleStrokeWidthResultValue};` +
      `typingStyleStrokeColorResultValue=${this.typingStyleStrokeColorResultValue};` +
      `paragraphTextDirectionValue=${this.paragraphTextDirectionValue};` +
      `accessibilitySpanOptionsLevelValue=${this.accessibilitySpanOptionsLevelValue};` +
      `selectedDragPreviewColorValue=${this.selectedDragPreviewColorValue}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  @Builder
  richEditorBuilderSpanNode(): void {
    Text('builder-span-node')
  }

  build() {
    Column() {
      Button('toggleGlobalRichEditorOptions')
        .id('toggleGlobalRichEditorOptionsBtn')
        .key('toggleGlobalRichEditorOptionsBtn')
        .onClick((): void => {
          this.useControllerA = !this.useControllerA;
          this.syncStateToStorage();
        })
      Text(`global.RichEditor.controller=${this.useControllerA ? 'A' : 'B'}`)
        .id('globalRichEditorValue')
        .key('globalRichEditorValue')

      Button('toggleIncludeFontPadding')
        .id('toggleIncludeFontPaddingBtn')
        .key('toggleIncludeFontPaddingBtn')
        .onClick((): void => {
          this.includeFontPaddingValue = !this.includeFontPaddingValue;
          this.syncStateToStorage();
        })
      Text(`richEditor.includeFontPadding=${this.includeFontPaddingValue}`)
        .id('richEditorIncludeFontPaddingValue')
        .key('richEditorIncludeFontPaddingValue')

      Button('toggleFallbackLineSpacing')
        .id('toggleFallbackLineSpacingBtn')
        .key('toggleFallbackLineSpacingBtn')
        .onClick((): void => {
          this.fallbackLineSpacingValue = !this.fallbackLineSpacingValue;
          this.syncStateToStorage();
        })
      Text(`richEditor.fallbackLineSpacing=${this.fallbackLineSpacingValue}`)
        .id('richEditorFallbackLineSpacingValue')
        .key('richEditorFallbackLineSpacingValue')

      Button('toggleSingleLine')
        .id('toggleSingleLineBtn')
        .key('toggleSingleLineBtn')
        .onClick((): void => {
          this.singleLineValue = !this.singleLineValue;
          this.syncStateToStorage();
        })
      Text(`richEditor.singleLine=${this.singleLineValue}`)
        .id('richEditorSingleLineValue')
        .key('richEditorSingleLineValue')

      Button('toggleCompressLeadingPunctuation')
        .id('toggleCompressLeadingPunctuationBtn')
        .key('toggleCompressLeadingPunctuationBtn')
        .onClick((): void => {
          this.compressLeadingPunctuationValue = !this.compressLeadingPunctuationValue;
          this.syncStateToStorage();
        })
      Text(`richEditor.compressLeadingPunctuation=${this.compressLeadingPunctuationValue}`)
        .id('richEditorCompressLeadingPunctuationValue')
        .key('richEditorCompressLeadingPunctuationValue')

      Button('callDeleteBackward')
        .id('callDeleteBackwardBtn')
        .key('callDeleteBackwardBtn')
        .onClick((): void => {
          this.getCurrentController().deleteBackward();
          this.deleteBackwardCount++;
          this.syncStateToStorage();
        })
      Text(`richEditor.deleteBackward.count=${this.deleteBackwardCount}`)
        .id('richEditorDeleteBackwardValue')
        .key('richEditorDeleteBackwardValue')

      Button('applyStrokeWidth')
        .id('applyStrokeWidthBtn')
        .key('applyStrokeWidthBtn')
        .onClick((): void => {
          this.strokeWidthValue = this.strokeWidthValue === 1 ? 2 : 1;
          this.getCurrentController().setTypingStyle({ strokeWidth: this.strokeWidthValue });
          this.syncStateToStorage();
        })
      Text(`richEditor.textStyle.strokeWidth=${this.strokeWidthValue}`)
        .id('richEditorTextStyleStrokeWidthValue')
        .key('richEditorTextStyleStrokeWidthValue')

      Button('applyStrokeColor')
        .id('applyStrokeColorBtn')
        .key('applyStrokeColorBtn')
        .onClick((): void => {
          this.strokeColorValue = this.strokeColorValue === '#ff0000' ? '#00ff00' : '#ff0000';
          this.getCurrentController().setTypingStyle({ strokeColor: this.strokeColorValue });
          this.syncStateToStorage();
        })
      Text(`richEditor.textStyle.strokeColor=${this.strokeColorValue}`)
        .id('richEditorTextStyleStrokeColorValue')
        .key('richEditorTextStyleStrokeColorValue')

      Button('readTypingStyleStrokeWidth')
        .id('readTypingStyleStrokeWidthBtn')
        .key('readTypingStyleStrokeWidthBtn')
        .onClick((): void => {
          const result = this.getCurrentController().getTypingStyle();
          if (result != undefined && result.strokeWidth != undefined) {
            this.typingStyleStrokeWidthResultValue = `${result.strokeWidth}`;
          } else {
            this.typingStyleStrokeWidthResultValue = 'none';
          }
          this.syncStateToStorage();
        })
      Text(`richEditor.typingStyle.strokeWidth.result=${this.typingStyleStrokeWidthResultValue}`)
        .id('richEditorTypingStyleStrokeWidthResultValue')
        .key('richEditorTypingStyleStrokeWidthResultValue')

      Button('readTypingStyleStrokeColor')
        .id('readTypingStyleStrokeColorBtn')
        .key('readTypingStyleStrokeColorBtn')
        .onClick((): void => {
          const result = this.getCurrentController().getTypingStyle();
          if (result != undefined && result.strokeColor != undefined) {
            this.typingStyleStrokeColorResultValue = `${result.strokeColor}`;
          } else {
            this.typingStyleStrokeColorResultValue = 'none';
          }
          this.syncStateToStorage();
        })
      Text(`richEditor.typingStyle.strokeColor.result=${this.typingStyleStrokeColorResultValue}`)
        .id('richEditorTypingStyleStrokeColorResultValue')
        .key('richEditorTypingStyleStrokeColorResultValue')

      Button('applyParagraphTextDirection')
        .id('applyParagraphTextDirectionBtn')
        .key('applyParagraphTextDirectionBtn')
        .onClick((): void => {
          this.paragraphTextDirectionValue = this.paragraphTextDirectionValue === TextDirection.LTR
            ? TextDirection.RTL : TextDirection.LTR;
          this.getCurrentController().addTextSpan('direction-seed');
          this.getCurrentController().updateParagraphStyle({
            start: 0,
            end: 1,
            style: { textDirection: this.paragraphTextDirectionValue }
          });
          this.syncStateToStorage();
        })
      Text(`richEditor.paragraph.textDirection=${this.paragraphTextDirectionValue}`)
        .id('richEditorParagraphTextDirectionValue')
        .key('richEditorParagraphTextDirectionValue')

      Button('applyAccessibilitySpanOptions')
        .id('applyAccessibilitySpanOptionsBtn')
        .key('applyAccessibilitySpanOptionsBtn')
        .onClick((): void => {
          this.accessibilitySpanOptionsLevelValue = this.accessibilitySpanOptionsLevelValue === 'yes' ? 'no' : 'yes';
          this.getCurrentController().addBuilderSpan(this.richEditorBuilderSpanNode, {
            offset: 0,
            accessibilitySpanOptions: {
              accessibilityText: 'builder-span-text',
              accessibilityDescription: 'builder-span-description',
              accessibilityLevel: this.accessibilitySpanOptionsLevelValue
            }
          });
          this.syncStateToStorage();
        })
      Text(`richEditor.builder.accessibilitySpanOptions.level=${this.accessibilitySpanOptionsLevelValue}`)
        .id('richEditorBuilderAccessibilitySpanOptionsValue')
        .key('richEditorBuilderAccessibilitySpanOptionsValue')

      Button('toggleSelectedDragPreviewStyle')
        .id('toggleSelectedDragPreviewStyleBtn')
        .key('toggleSelectedDragPreviewStyleBtn')
        .onClick((): void => {
          this.selectedDragPreviewColorValue = this.selectedDragPreviewColorValue === '#ff0000' ? '#00ff00' : '#ff0000';
          this.syncStateToStorage();
        })
      Text(`richEditor.selectedDragPreviewStyle.color=${this.selectedDragPreviewColorValue}`)
        .id('richEditorSelectedDragPreviewStyleValue')
        .key('richEditorSelectedDragPreviewStyleValue')

      RichEditor({
        controller: this.getCurrentController()
      })
        .includeFontPadding(this.includeFontPaddingValue)
        .fallbackLineSpacing(this.fallbackLineSpacingValue)
        .singleLine(this.singleLineValue)
        .compressLeadingPunctuation(this.compressLeadingPunctuationValue)
        .selectedDragPreviewStyle({ color: this.selectedDragPreviewColorValue })
        .id('richEditorCase')
        .key('richEditorCase')
        .width('100%')
        .height('40%')

      RichEditor({ controller: this.controllerB })
        .includeFontPadding(undefined)
        .fallbackLineSpacing(undefined)
        .singleLine(undefined)
        .compressLeadingPunctuation(undefined)
        .selectedDragPreviewStyle(undefined)
        .id('richEditorUndefCase')
        .key('richEditorUndefCase')
        .width('100%')
        .height('20%')
    }.width('100%').height('100%')
  }
}
