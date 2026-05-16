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
  TextArea,
  TextAreaType,
  Button
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';
import { ColorMetrics } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';

const PFX = 'TextArea';
const TEXT_AREA_KEY = 'TextArea_dlg_bind';

@Entry
@Component
struct TextAreaPage {
  build() {
    Column({ space: 3 } as ColumnOptions) {
      Text('模块 textArea.d.ets：TextArea 属性绑定在组件上，测试用 inspector 读取 $attrs')
        .fontSize(12)
        .width('100%')
      Button('枚举 TextAreaType.ONE_TIME_CODE')
        .id(`${PFX}_btn_ONE_TIME_CODE`)
        .width('100%')
        .fontSize(12)
        .onClick(() => {
          AppStorage.setOrCreate<string>(`${PFX}_enum_ONE_TIME_CODE`, TextAreaType.ONE_TIME_CODE === 14 ? 'true' : 'false');
        })
      TextArea({ text: 'ta', placeholder: 'ph' })
        .key(TEXT_AREA_KEY)
        .width('100%')
        .height(72)
        .type(TextAreaType.ONE_TIME_CODE)
        .minLines(1)
        .enableAutoSpacing(true)
        .strokeWidth(LengthMetrics.vp(1))
        .strokeColor('#223344')
        .onWillAttachIME((_c) => {
        })
        .scrollBarColor(ColorMetrics.resourceColor('#556677'))
        .enableSelectedDataDetector(true)
        .horizontalScrolling(true)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
