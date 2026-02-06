/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


@Entry
@Component
struct SpaceMain5JustifyContent {
  build() {
    Column() {
      Column({ space: 5 }) {
        Text('main：5,FlexWrap.NoWrap').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.Row, wrap: FlexWrap.NoWrap, space:{ main: {value:5, unit:1} }  }) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5NoWrap_1")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：5, justifyContent: FlexAlign.Start').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start, space:{ main: {value:5, unit:1} }  }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5JustifyContent_Start")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：5, justifyContent: FlexAlign.Center').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center, space:{ main: {value:5, unit:1} }  }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5JustifyContent_Center")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：5, justifyContent: FlexAlign.End').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.End, space:{ main: {value:5, unit:1} }  }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5JustifyContent_End")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：5, justifyContent: FlexAlign.SpaceBetween').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween, space:{ main: {value:5, unit:1} }  }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5JustifyContent_SpaceBetween")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：5, justifyContent: FlexAlign.SpaceAround').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceAround, space:{ main: {value:5, unit:1} }  }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5JustifyContent_SpaceAround")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：5, justifyContent: FlexAlign.SpaceEvenly').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceEvenly, space:{ main: {value:5, unit:1} }  }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceMain5JustifyContent_SpaceEvenly")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}