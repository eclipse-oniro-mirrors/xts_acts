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
  TextArea,
  FlexAlign,
  InputCounterOptions
} from '@ohos.arkui.component';

import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct CommonPage {
  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('模块 common.d.ets：InputCounterOptions 绑定 TextArea.showCounter，供 inspector 读取')
        .fontSize(14)
        .width('100%')

      TextArea({ placeholder: 'counterTextColor #112233' })
        .width('100%')
        .maxLength(80)
        .key('Common_textArea_counterTextColor')
        .showCounter(true, {
          thresholdPercentage: 50,
          highlightBorder: true,
          counterTextColor: ColorMetrics.resourceColor('#112233'),
          counterTextOverflowColor: ColorMetrics.resourceColor('#000000')
        } as InputCounterOptions)

      TextArea({ placeholder: 'counterTextOverflowColor #445566' })
        .width('100%')
        .maxLength(80)
        .key('Common_textArea_counterTextOverflowColor')
        .showCounter(true, {
          thresholdPercentage: 50,
          highlightBorder: true,
          counterTextColor: ColorMetrics.resourceColor('#000000'),
          counterTextOverflowColor: ColorMetrics.resourceColor('#445566')
        } as InputCounterOptions)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)

  }
}


