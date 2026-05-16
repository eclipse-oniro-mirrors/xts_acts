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
  Grid,
  Color,
  $r
} from '@ohos.arkui.component';

@Entry
@Component
struct GridPage {
  build() {
    Column() {
      Grid()
        .columnsTemplate('1fr 1fr')
        .id('gridColTplStr')
        .key('gridColTplStr')
        .width('100%')
        .height('12%')

      Grid()
        .columnsTemplate(undefined)
        .id('gridColTplUndef')
        .key('gridColTplUndef')
        .width('100%')
        .height('12%')

      Grid()
        .columnsTemplate('1fr')
        .scrollBarColor(Color.Red)
        .id('gridSbcColor')
        .key('gridSbcColor')
        .width('100%')
        .height('12%')

      Grid()
        .columnsTemplate('1fr')
        .scrollBarColor(0xFF0000 as Int)
        .id('gridSbcInt')
        .key('gridSbcInt')
        .width('100%')
        .height('12%')

      Grid()
        .columnsTemplate('1fr')
        .scrollBarColor('#00FF00')
        .id('gridSbcStr')
        .key('gridSbcStr')
        .width('100%')
        .height('12%')

      Grid()
        .columnsTemplate('1fr')
        .scrollBarColor($r('app.color.color_hello'))
        .id('gridSbcRes')
        .key('gridSbcRes')
        .width('100%')
        .height('12%')

      Grid()
        .columnsTemplate('1fr')
        .scrollBarColor(undefined)
        .id('gridSbcUndef')
        .key('gridSbcUndef')
        .width('100%')
        .height('12%')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
