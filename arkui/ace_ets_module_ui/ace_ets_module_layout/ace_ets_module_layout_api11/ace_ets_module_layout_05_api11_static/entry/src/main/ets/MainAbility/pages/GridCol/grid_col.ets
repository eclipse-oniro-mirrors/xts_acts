'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Flex, FlexDirection, Margin, ItemAlign, FlexAlign, Text, GridRow, Alignment, TextAlign, TextOverflow, GridCol } from '@ohos.arkui.component'
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct Grid_colSpan {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear Grid_colSpan start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear Grid_colSpan end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("grid_col-Span")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("spanText")

      Text("grid_col-Order")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("orderText")

      GridRow() {
        GridCol({ span: 10, offset: 50, order: 10 }) {
        }
        .width(100)
        .height(100)
        .backgroundColor(0x308014)
        .backgroundColor(0xf1f3f5)
        .margin({ top: 10 } as Margin)
        .key('gridContainer')
      }
    }.width("100%").height("100%")
  }
}

