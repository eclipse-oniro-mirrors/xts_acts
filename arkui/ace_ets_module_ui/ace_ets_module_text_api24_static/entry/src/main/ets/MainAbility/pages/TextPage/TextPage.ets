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
  Text,
  FlexAlign,
  TextController,
  ColorShaderStyle,
  NumericTextTransition,
  TextVerticalAlign,
  TextContentAlign,
  FlipDirection
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

const TEXT_PAGE_KEY = 'TextPage_dlg_bind';

@Entry
@Component
struct TextModulePage {
  private ctl: TextController = new TextController();

  build() {
    Column({ space: 3 } as ColumnOptions) {
      Text('模块 text.d.ets：TextAttribute 绑定在 Text 上，测试用 inspector 读取 $attrs')
        .fontSize(12)
        .width('100%')
      Text('ArkUI Text batch', { controller: this.ctl })
        .key(TEXT_PAGE_KEY)
        .width('100%')
        .optimizeTrailingSpace(true)
        .shaderStyle(new ColorShaderStyle('#FF0000'))
        .enableAutoSpacing(true)
        .textVerticalAlign(TextVerticalAlign.CENTER)
        .contentTransition(
          new NumericTextTransition({ flipDirection: FlipDirection.UP, enableBlur: false })
        )
        .textContentAlign(TextContentAlign.CENTER)
        .minLines(1)
        .minLineHeight(LengthMetrics.vp(14))
        .maxLineHeight(LengthMetrics.vp(40))
        .lineHeightMultiple(1.1)
        .enableSelectedDataDetector(true)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
