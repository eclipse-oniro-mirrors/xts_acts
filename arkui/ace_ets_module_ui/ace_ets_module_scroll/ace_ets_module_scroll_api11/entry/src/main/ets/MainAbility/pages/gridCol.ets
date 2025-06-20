/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct GridColXl {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GridColXl start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear GridColXl end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      GridRow() {
        GridCol({ span: { xl: 2 } }) {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol({ span: { xl: 2 } }) {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("xlText")

      GridRow() {
        GridCol({ span: { xxl: 2 } }) {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol({ span: { xxl: 2 } }) {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("xxlText")

      GridRow() {
        GridCol({ span: { xl: 2 } }) {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .key("GridCol")
        .order({ xl: 10 })
        .backgroundColor(Color.Green)

        GridCol({ span: { xl: 2 } }) {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .order(10)
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("orderText")
    }
    .width("100%")
    .height("100%")
  }
}

