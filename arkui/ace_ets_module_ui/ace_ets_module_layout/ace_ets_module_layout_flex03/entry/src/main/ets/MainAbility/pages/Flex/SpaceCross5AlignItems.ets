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
struct SpaceCross5AlignItems {
  build() {
    Column() {
      Column({ space: 5 }) {
        Text('cross：5,FlexWrap.NoWrap').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.Column, wrap: FlexWrap.NoWrap, space:{ cross: {value:5, unit:0} }}) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceCross5AlignItems_1")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('cross：5, alignItems: ItemAlign.Start').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Start, space:{ cross: {value:5, unit:0} }}) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceCross5AlignItems_Start")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('cross：5, alignItems: ItemAlign.Center').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Center, space:{ cross: {value:5, unit:0} }}) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceCross5AlignItems_Center")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('cross：5, alignItems: ItemAlign.End').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse, wrap: FlexWrap.Wrap, alignItems: ItemAlign.End, space:{ cross: {value:5, unit:0} }}) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceCross5AlignItems_End")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('cross：5, alignItems: ItemAlign.Stretch').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Stretch, space:{ cross: {value:5, unit:0} }}) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceCross5AlignItems_Stretch")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('cross：5, alignItems: ItemAlign.Baseline').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Baseline, space:{ cross: {value:5, unit:0} }}) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("SpaceCross5AlignItems_Baseline")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('space:{ main: 5, cross：5} Flex设置padding, 子组件设置margin').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Start, space:{ main: {value:5, unit:1}, cross:  {value:5, unit:1} }}) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3).margin(5)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C).margin(5)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C).margin(5)
        }
        .id("SpaceCross5AlignItems_main5")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}