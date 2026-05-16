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
  TextAlign,
  ButtonLabelStyle,
  FlexAlign
} from '@ohos.arkui.component';

@Entry
@Component
struct ButtonLabelStylePage {
  build() {
    Column({ space: 2 } as ColumnOptions) {
      Button('align·Start')
        .labelStyle({ textAlign: TextAlign.Start } as ButtonLabelStyle)
        .key('buttonLabelStyleTextAlignStart')
        .id('buttonLabelStyleTextAlignStart')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '30%' })
        .fontSize(11)
      Button('align·Center')
        .labelStyle({ textAlign: TextAlign.Center } as ButtonLabelStyle)
        .key('buttonLabelStyleTextAlignCenter')
        .id('buttonLabelStyleTextAlignCenter')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '30%' })
        .fontSize(11)
      Button('align·End')
        .labelStyle({ textAlign: TextAlign.End } as ButtonLabelStyle)
        .key('buttonLabelStyleTextAlignEnd')
        .id('buttonLabelStyleTextAlignEnd')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '30%' })
        .fontSize(11)
    }
    .width('100%')
    .height('100%')
    .padding({ left: '4%', right: '4%', top: '2%', bottom: '2%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
