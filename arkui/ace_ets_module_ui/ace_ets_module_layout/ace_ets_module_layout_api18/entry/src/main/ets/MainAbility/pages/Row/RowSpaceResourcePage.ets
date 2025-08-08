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
struct RowSpaceResourcePage {
  build() {
    Column({ space: 2 }) {
      // 通过资源引用方式设置子组件水平方向的间距
      Row({ space: $r("app.string.stringSpace") }) {
        Row() {
          Text('1')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row1_01')

        Row() {
          Text('2')
        }.width('20%').height('90%').backgroundColor(0x00FFFF).id('RowSpaceResource_Row1_02')

        Row() {
          Text('3')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row1_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('RowSpaceResource_Row1')

      Row({ space: $r("app.integer.integerSpace") }) {
        Row() {
          Text('1')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row2_01')

        Row() {
          Text('2')
        }.width('20%').height('90%').backgroundColor(0x00FFFF).id('RowSpaceResource_Row2_02')

        Row() {
          Text('3')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row2_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('RowSpaceResource_Row2')

      Row({ space: $r("app.float.floatSpace") }) {
        Row() {
          Text('1')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row3_01')

        Row() {
          Text('2')
        }.width('20%').height('90%').backgroundColor(0x00FFFF).id('RowSpaceResource_Row3_02')

        Row() {
          Text('3')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row3_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('RowSpaceResource_Row3')
    }.width('100%').height('100%')
  }
}