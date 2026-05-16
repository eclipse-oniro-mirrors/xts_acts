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
 * LayoutPolicy fixAtIdealSize Test Page
 * 测试 LayoutPolicy.fixAtIdealSize 布局策略属性（适配手表）
 */
'use static'
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
struct LayoutPolicyFixAtIdealSize {
  build() {
    Scroll() {
      Column() {
        // 测试2: fixAtIdealSize 更小约束（子组件80x80，约束50x50）
        Text("测试1: fixAtIdealSize 更小约束")
          .height('4%')
          .fontSize(10)

        Row() {
          Flex()
            .width(20)
            .height(20)
        }
          .id('row_constraintSize_test2')
          .width(LayoutPolicy.fixAtIdealSize)
          .height(LayoutPolicy.fixAtIdealSize)
          .constraintSize({ maxWidth: 10, maxHeight: 10 })
          .backgroundColor(0xAAAAAA)

        Text('----------------------------------------')
          .fontSize(8)

        // 测试4: fixAtIdealSize 高度约束（子组件80x100，宽度约束80x60）
        Text("测试2: fixAtIdealSize 高度约束")
          .height('4%')
          .fontSize(10)

        Row() {
          Flex()
            .width(10)
            .height(10)
        }
          .id('row_constraintSize_test4')
          .width(LayoutPolicy.fixAtIdealSize)
          .height(LayoutPolicy.fixAtIdealSize)
          .constraintSize({ maxWidth: 20, maxHeight: 20 })
          .backgroundColor(0x886688)
      }
      .width('100%')
      .padding({ left: 10, right: 10, top: 5, bottom: 5 })
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
  }
}