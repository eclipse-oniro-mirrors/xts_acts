'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * Common WidthHeight Test Page
 * 测试 common 模块的 width、height 属性
 */
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Row,
  Flex
} from '@ohos.arkui.component';
import { LayoutPolicy } from '@ohos.arkui.component';

@Entry
@Component
struct CommonWidthHeight {
  build() {
    Column() {
      Text('Common WidthHeight Test')
        .height('5%')

      // 调用覆盖白名单测试 - Text 组件
      Text('Text Test')
        .id('text_width_height_invoke')
        .height('5%')
        .width('100vp')

      // 调用覆盖白名单测试 - Button 组件
      Button('Button Test')
        .id('button_width_height_invoke')
        .height('5%')
        .width('100vp')

      // 调用覆盖白名单测试 - Column 组件
      Column() {
        Text('Column Content')
      }
        .id('column_width_height_invoke')
        .height('5%')
        .width('100vp')

      // 入参覆盖白名单测试 - Length string '5%'
      Text('Width Height 5%')
        .id('text_string_percent')
        .width('5%')
        .height('5%')

      // 入参覆盖白名单测试 - Length string '100vp'
      Text('Width Height 100vp')
        .id('text_string_vp')
        .width('100vp')
        .height('100vp')

      // 入参覆盖白名单测试 - Length string 'auto'
      Text('Width Height auto')
        .id('text_string_auto')
        .width('auto')
        .height('auto')

      // 入参覆盖白名单测试 - Length number
      Text('Width Height number')
        .id('text_number')
        .width(100)
        .height(100)

      // matchParent生效时，当前组件会与其父组件内容区大小（180vp * 180vp）相等，同时依旧受自身constraintSize（150vp * 150vp）约束，因此当前组件大小为150vp * 150vp
      Text('matchParent')
      Flex()
        .backgroundColor('rgb(0, 74, 175)')
        .id('row_matchParent_constraintSize')
        .width(LayoutPolicy.matchParent)
        .height(LayoutPolicy.matchParent)
        .constraintSize({ maxWidth: 150, maxHeight: 150 })

      // 入参覆盖白名单测试 - LayoutPolicy.wrapContent
      Row() {
        Flex()
          .width(300)
          .height(300)
      }
      .id('row_wrapContent_constraintSize')
      .width(LayoutPolicy.wrapContent)
      .height(LayoutPolicy.wrapContent)
      .constraintSize({ maxWidth: 150, maxHeight: 150 })
      .backgroundColor(0x888888)

      // 入参覆盖白名单测试 - LayoutPolicy.fixAtIdealSize
      Row() {
        Flex()
          .width(300)
          .height(300)
      }
      .id('row_fixAtIdealSize_constraintSize')
      .width(LayoutPolicy.fixAtIdealSize)
      .height(LayoutPolicy.fixAtIdealSize)
      .constraintSize({ maxWidth: 150, maxHeight: 150 })
      .backgroundColor(0x888888)

      // 入参覆盖白名单测试 - undefined (未设置)
      Text('Width Height undefined (default)')
        .id('text_undefined_default')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}