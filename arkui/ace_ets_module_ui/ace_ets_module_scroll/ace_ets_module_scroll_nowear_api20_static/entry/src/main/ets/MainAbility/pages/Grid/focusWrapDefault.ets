/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Column,
  Component,
  Text,
  TextAlign,
  Margin,
  Grid,
  GridItem,
 	FocusWrapMode,
  Scroller
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct focusWrapModeDefault {
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Grid(this.scroller) {
        GridItem() {
          Text('A')
            .focusable(true)
            .fontSize(18)
            .fontWeight(5)
            .backgroundColor(0xF9CF93)
            .width('100%')
            .height('30%')
            .textAlign(TextAlign.Center)
        }
        GridItem() {
          Text('B')
            .focusable(true)
            .fontSize(18)
            .fontWeight(5)
            .backgroundColor(0xF9CF93)
            .width('100%')
            .height('30%')
            .textAlign(TextAlign.Center)
        }
        GridItem() {
          Text('C')
            .id('default_focused_c')
            .focusable(true)
            .fontSize(18)
            .fontWeight(5)
            .backgroundColor(0xF9CF93)
            .width('100%')
            .height('30%')
            .textAlign(TextAlign.Center)
        }
        GridItem() {
          Text('D')
            .focusable(true)
            .fontSize(18)
            .fontWeight(5)
            .backgroundColor(0xF9CF93)
            .width('100%')
            .height('30%')
            .textAlign(TextAlign.Center)
        }
        GridItem() {
          Text('E')
            .focusable(true)
            .fontSize(18)
            .fontWeight(5)
            .backgroundColor(0xF9CF93)
            .width('100%')
            .height('30%')
            .textAlign(TextAlign.Center)
        }
      }
      .id('focusWrapMode_default')
      .width('90%')
      .height('50%')
      .columnsTemplate('1fr 1fr')
      .focusWrapMode(FocusWrapMode.DEFAULT)
      .columnsGap(10)
      .rowsGap(20)
      .backgroundColor(0xDCDCDC)

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}