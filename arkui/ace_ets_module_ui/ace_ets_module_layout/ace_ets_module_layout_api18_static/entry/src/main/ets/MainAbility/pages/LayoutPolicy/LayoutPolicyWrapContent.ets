'use static'
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

/**
 * LayoutPolicy wrapContent Test Page
 * 测试 LayoutPolicy.wrapContent 布局策略属性（适配手表）
 */

import {
  Entry,
  Text,
  Column,
  Component,
  Flex,
  Row,
  Scroll
} from '@kit.ArkUI';
import { LayoutPolicy } from '@kit.ArkUI';

@Entry
@Component
struct LayoutPolicyWrapContent {
  build() {
    Scroll() {
      Column() {
        Text('LayoutPolicy.wrapContent Test')
          .height('5%')
          .fontSize(12)

        // 测试2: wrapContent 不超过父组件内容区大小（子组件80x80，父组件60x60）
        Text("测试2: wrapContent 不超过父组件内容区大小")
          .height('4%')
          .fontSize(10)

        Row() {
          Row() {
            Flex()
              .width(20)
              .height(20)
          }
          .width(LayoutPolicy.wrapContent)
          .height(LayoutPolicy.wrapContent)
          .backgroundColor(0xAAAAAA)
        }
          .id('row_wrapContent_parent_constraint')
          .width(10)
          .height(10)
          .backgroundColor(0x888888)

        Text('----------------------------------------')
          .fontSize(8)

        // 测试3: wrapContent 配合 constraintSize（子组件100x100，约束80x80）
        Text("测试3: wrapContent 配合 constraintSize")
          .height('4%')
          .fontSize(10)

        Row() {
          Flex()
            .width(20)
            .height(20)
        }
          .id('row_wrapContent_constraintSize')
          .width(LayoutPolicy.wrapContent)
          .height(LayoutPolicy.wrapContent)
          .constraintSize({ maxWidth: 10, maxHeight: 10 })
          .backgroundColor(0x888888)
      }
      .width('100%')
      .padding({ left: 10, right: 10, top: 5, bottom: 5 })
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
  }
}