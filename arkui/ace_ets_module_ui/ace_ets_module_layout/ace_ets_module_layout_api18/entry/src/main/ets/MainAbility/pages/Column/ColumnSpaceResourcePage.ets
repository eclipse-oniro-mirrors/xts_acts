/*
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
struct ColumnSpaceResourcePage {
  build() {
    Column({ space: 2 }) {
      // 通过资源引用方式设置子元素垂直方向间距
      Column({ space: $r("app.string.stringSpace") }) {
        Column() {
          Text('1')
        }.width('90%').height('20%').backgroundColor(0xAFEEEE).id('ColumnSpaceResource_Column1_01')

        Column() {
          Text('2')
        }.width('90%').height('20%').backgroundColor(0x00FFFF).id('ColumnSpaceResource_Column1_02')

        Column() {
          Text('3')
        }.width('90%').height('20%').backgroundColor(0xAFEEEE).id('ColumnSpaceResource_Column1_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('ColumnSpaceResource_Column1')

      Column({ space: $r("app.integer.integerSpace") }) {
        Column() {
          Text('1')
        }.width('90%').height('20%').backgroundColor(0xAFEEEE).id('ColumnSpaceResource_Column2_01')

        Column() {
          Text('2')
        }.width('90%').height('20%').backgroundColor(0x00FFFF).id('ColumnSpaceResource_Column2_02')

        Column() {
          Text('3')
        }.width('90%').height('20%').backgroundColor(0xAFEEEE).id('ColumnSpaceResource_Column2_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('ColumnSpaceResource_Column2')

      Column({ space: $r("app.float.floatSpace") }) {
        Column() {
          Text('1')
        }.width('90%').height('20%').backgroundColor(0xAFEEEE).id('ColumnSpaceResource_Column3_01')

        Column() {
          Text('2')
        }.width('90%').height('20%').backgroundColor(0x00FFFF).id('ColumnSpaceResource_Column3_02')

        Column() {
          Text('3')
        }.width('90%').height('20%').backgroundColor(0xAFEEEE).id('ColumnSpaceResource_Column3_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('ColumnSpaceResource_Column3')
    }.width('100%').height('100%')
  }
}