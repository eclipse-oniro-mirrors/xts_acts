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
 * Common IgnoreLayoutSafeArea Test Page
 * 测试 common 模块的 ignoreLayoutSafeArea 属性
 */
import { Entry, Text, Column, Component, Row, Stack, Flex, LayoutSafeAreaType, LayoutSafeAreaEdge, LayoutPolicy } from '@kit.ArkUI';

@Entry
@Component
struct CommonIgnoreLayoutSafeArea {
  build() {
    Column() {
      Text('Common IgnoreLayoutSafeArea Test')
        .height('5%')

      // 调用覆盖白名单测试 - Row 组件
      Text('Invoke - Row')
        .id('text_invoke_row')
        .height('5%')

      Row()
        .backgroundColor('rgb(39, 135, 217)')
        .width(15)
        .height(15)
        .id('row_invoke_test')
        .ignoreLayoutSafeArea()

      // 调用覆盖白名单测试 - Column 组件
      Text('Invoke - Column')
        .id('text_invoke_column')
        .height('5%')

      Column()
        .backgroundColor('rgb(0, 74, 175)')
        .width(15)
        .height(15)
        .id('column_invoke_test')
        .ignoreLayoutSafeArea()

      // 调用覆盖白名单测试 - Stack 组件
      Text('Invoke - Stack')
        .id('text_invoke_stack')
        .height('5%')

      Stack() {
        Text('Stack Content')
      }
        .backgroundColor('rgb(100, 100, 200)')
        .width(20)
        .height(20)
        .id('stack_invoke_test')
        .ignoreLayoutSafeArea()

      // 调用覆盖白名单测试 - Flex 组件
      Text('Invoke - Flex')
        .id('text_invoke_flex')
        .height('5%')

      Flex() {
        Text('Flex Content')
      }
        .backgroundColor('rgb(120, 120, 220)')
        .width(20)
        .height(20)
        .id('flex_invoke_test')
        .ignoreLayoutSafeArea()

      // 入参覆盖白名单测试 - 空数组 []
      Text('Args - Empty Array []')
        .id('text_args_empty_array')
        .height('5%')

      Row()
        .backgroundColor('rgb(150, 50, 50)')
        .width(20)
        .height(20)
        .ignoreLayoutSafeArea([], [])
        .id('row_empty_array')

      // 入参覆盖白名单测试 - 默认值 (undefined)
      Text('Args - Default (undefined)')
        .id('text_args_default')
        .height('5%')

      Row()
        .backgroundColor('rgb(50, 150, 50)')
        .width(20)
        .height(20)
        .ignoreLayoutSafeArea()
        .id('row_default')

      // 入参覆盖白名单测试 - LayoutSafeAreaType.SYSTEM with START, TOP
      Text('Args - SYSTEM, START, TOP')
        .id('text_args_system_start_top')
        .height('5%')

      Row()
        .backgroundColor('rgb(39, 135, 217)')
        .width(15)
        .height(15)
        .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.START, LayoutSafeAreaEdge.TOP])
        .id('row_system_start_top')

      // 入参覆盖白名单测试 - LayoutSafeAreaType.SYSTEM with END, BOTTOM
      Text('Args - SYSTEM, END, BOTTOM')
        .id('text_args_system_end_bottom')
        .height('5%')

      Row()
        .backgroundColor('rgb(0, 74, 175)')
        .width(15)
        .height(15)
        .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.END, LayoutSafeAreaEdge.BOTTOM])
        .id('row_system_end_bottom')


      // 参数规格覆盖白名单测试 - LayoutSafeAreaType.SYSTEM with multiple edges
      Text('Args Spec - SYSTEM with all edges')
        .id('text_args_spec_all_edges')
        .height('5%')

      Row()
        .backgroundColor('rgb(80, 180, 80)')
        .width(20)
        .height(20)
        .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.ALL])
        .id('row_all_edges')

      // 参数规格覆盖白名单测试 - only types, no edges (undefined edges)
      Text('Args Spec - only types, no edges')
        .id('text_args_spec_only_types')
        .height('5%')

      Row()
        .backgroundColor('rgb(80, 80, 180)')
        .width(20)
        .height(20)
        .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM])
        .id('row_only_types')

      // 参数规格覆盖白名单测试 - only edges, no types (undefined types)
      Text('Args Spec - only edges, no types')
        .id('text_args_spec_only_edges')
        .height('5%')

      Row()
        .backgroundColor('rgb(180, 180, 80)')
        .width(20)
        .height(20)
        .ignoreLayoutSafeArea(undefined, [LayoutSafeAreaEdge.TOP])
        .id('row_only_edges')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}