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
struct GridRowXl {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GridRowXl start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear GridRowXl end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {


      GridRow({ columns: { xl: 2 } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }
      .backgroundColor(Color.Red)
      .key("GridRowColumnOption——xl")

      GridRow({ columns: { xxl: 2 } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("GridRowColumnOption——xxl")

      GridRow({ gutter: { x: { xl: 2 } } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("GridRowSizeOption——xl")

      GridRow({ gutter: { x: { xxl: 2 } } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("GridRowSizeOption——xxl")

      GridRow({ breakpoints: { reference: BreakpointsReference.WindowSize } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("WindowSizeText")

      GridRow({ breakpoints: { reference: BreakpointsReference.ComponentSize } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("ComponentSizeText")

      GridRow({ breakpoints: { reference: BreakpointsReference.ComponentSize } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("referenceText")

      GridRow({ breakpoints: { reference: BreakpointsReference.ComponentSize } }) {
        GridCol() {
          Text('Hello')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Green)

        GridCol() {
          Text('World')
            .width(100)
            .height(70)
            .align(Alignment.Center)
        }
        .backgroundColor(Color.Blue)
      }.backgroundColor(Color.Red)
      .key("breakpointsText")
    }
    .width("100%")
    .height("100%")
  }
}

