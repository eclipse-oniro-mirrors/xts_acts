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

'use static';

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Button,
  Text,
  FlexAlign,
  RichEditor,
  RichEditorController,
  RichEditorParagraphStyle,
  TextAlign,
  TextVerticalAlign,
  StyledString,
  UndoStyle,
  IMEClient,
  TextDataDetectorConfig,
  TextDataDetectorType
} from '@ohos.arkui.component';
import { ColorMetrics } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';

const PFX = 'RichEditorApi';

@Entry
@Component
struct RichEditorApiPage {
  private richCtl: RichEditorController = new RichEditorController();
  private detCfg: TextDataDetectorConfig = {
    types: [TextDataDetectorType.PHONE_NUMBER],
    enablePreviewMenu: true
  };

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('richEditor.d.ets API（UndoStyle / ParagraphStyle / Controller / Attribute）')
        .fontSize(12)
        .width('100%')

      Button('枚举 UndoStyle.CLEAR_STYLE')
        .id(`${PFX}_btn_UndoStyle_CLEAR_STYLE`)
        .width('100%')
        .fontSize(11)
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_enum_UndoStyle_CLEAR_STYLE`,
            UndoStyle.CLEAR_STYLE === 0 ? 'true' : 'false'
          );
        })

      Button('枚举 UndoStyle.KEEP_STYLE')
        .id(`${PFX}_btn_UndoStyle_KEEP_STYLE`)
        .width('100%')
        .fontSize(11)
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_enum_UndoStyle_KEEP_STYLE`,
            UndoStyle.KEEP_STYLE === 1 ? 'true' : 'false'
          );
        })

      Button('RichEditorParagraphStyle.textVerticalAlign')
        .id(`${PFX}_btn_paragraphStyle_textVerticalAlign`)
        .width('100%')
        .fontSize(11)
        .onClick((): void => {
          const ps: RichEditorParagraphStyle = {
            textVerticalAlign: TextVerticalAlign.TOP
          };
          AppStorage.setOrCreate<string>(
            `${PFX}_paragraphStyle_textVerticalAlign`,
            ps.textVerticalAlign === TextVerticalAlign.TOP ? 'true' : 'false'
          );
        })

      Button('RichEditorBaseController.setTypingParagraphStyle')
        .id(`${PFX}_btn_setTypingParagraphStyle`)
        .width('100%')
        .fontSize(11)
        .onClick((): void => {
          const style: RichEditorParagraphStyle = {
            textVerticalAlign: TextVerticalAlign.CENTER,
            textAlign: TextAlign.Center
          };
          this.richCtl.setTypingParagraphStyle(style);
          AppStorage.setOrCreate<string>(`${PFX}_setTypingParagraphStyle_ok`, 'true');
        })

      Button('RichEditorBaseController.setStyledPlaceholder')
        .id(`${PFX}_btn_setStyledPlaceholder`)
        .width('100%')
        .fontSize(11)
        .onClick((): void => {
          const ph = new StyledString('placeholder');
          this.richCtl.setStyledPlaceholder(ph);
          AppStorage.setOrCreate<string>(`${PFX}_setStyledPlaceholder_ok`, 'true');
      })  

      RichEditor({ controller: this.richCtl })
        .id(`${PFX}_rich_main`)
        .width('100%')
        .height(100)
        .dataDetectorConfig(this.detCfg)
        .enableSelectedDataDetector(true)
        .enableAutoSpacing(true)
        .undoStyle(UndoStyle.KEEP_STYLE)
        .scrollBarColor(ColorMetrics.resourceColor('#FF00AA00'))
        .onWillAttachIME((client: IMEClient) => {
          AppStorage.setOrCreate<string>(`${PFX}_onWillAttachIME_ok`, 'true');
          AppStorage.setOrCreate<string>(`${PFX}_onWillAttachIME_nodeId`, `${client.nodeId}`);
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
