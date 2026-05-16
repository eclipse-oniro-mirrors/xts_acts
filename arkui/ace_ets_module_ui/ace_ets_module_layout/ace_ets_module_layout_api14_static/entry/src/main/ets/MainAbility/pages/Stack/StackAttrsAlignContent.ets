'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry, Component, Column, Row, Stack, Text, Alignment,
} from '@ohos.arkui.component'

@Entry
@Component
struct StackAttrsAlignContent {
  build() {
    Column() {
      Text('Stack alignContent Property Test')
        .fontSize(20)
        .margin(10)

      Row() {
        // Test 1: Stack() - options empty (default)
        Stack() {
          Text('Default')
            .width(30)
            .height(30)
            .backgroundColor(0xFFFF0000.toInt())
        }
        .id('stack_alignContent_default')
        .width(50)
        .height(50)

        // Test 2: alignContent = Alignment.Center
        Stack() {
          Text('Center')
            .width(30)
            .height(30)
            .backgroundColor(0xFF00FF00.toInt())
        }
        .id('stack_alignContent_center')
        .alignContent(Alignment.Center)
        .width(50)
        .height(50)

        // Test 3: alignContent = Alignment.Top
        Stack() {
          Text('Top')
            .width(30)
            .height(30)
            .backgroundColor(0xFF00FFFF.toInt())
        }
        .id('stack_alignContent_top')
        .alignContent(Alignment.Top)
        .width(50)
        .height(50)

        // Test 4: alignContent = Alignment.Bottom
        Stack() {
          Text('Bottom')
            .width(30)
            .height(30)
            .backgroundColor(0xFFFF0000.toInt())
        }
        .id('stack_alignContent_bottom')
        .alignContent(Alignment.Bottom)
        .width(50)
        .height(50)
      }

      Row() {
        // Test 5: alignContent = Alignment.Start
        Stack() {
          Text('Start')
            .width(30)
            .height(30)
            .backgroundColor(0xFF0000FF.toInt())
        }
        .id('stack_alignContent_start')
        .alignContent(Alignment.Start)
        .width(50)
        .height(50)

        // Test 6: alignContent = Alignment.End
        Stack() {
          Text('End')
            .width(30)
            .height(30)
            .backgroundColor(0xFF00FFFF.toInt())
        }
        .id('stack_alignContent_end')
        .alignContent(Alignment.End)
        .width(50)
        .height(50)

        // Test 7: alignContent = Alignment.TopStart
        Stack() {
          Text('TopStart')
            .width(30)
            .height(30)
            .backgroundColor(0xFFFF00FF.toInt())
        }
        .id('stack_alignContent_top_start')
        .alignContent(Alignment.TopStart)
        .width(50)
        .height(50)

        // Test 8: alignContent = Alignment.TopEnd
        Stack() {
          Text('TopEnd')
            .width(30)
            .height(30)
            .backgroundColor(0xFF808080.toInt())
        }
        .id('stack_alignContent_top_end')
        .alignContent(Alignment.TopEnd)
        .width(50)
        .height(50)
      }

      Row() {
        // Test 9: alignContent = Alignment.BottomStart
        Stack() {
          Text('BottomStart')
            .width(30)
            .height(30)
            .backgroundColor(0xFF800080.toInt())
        }
        .id('stack_alignContent_bottom_start')
        .alignContent(Alignment.BottomStart)
        .width(50)
        .height(50)

        // Test 10: alignContent = Alignment.BottomEnd
        Stack() {
          Text('BottomEnd')
            .width(30)
            .height(30)
            .backgroundColor(0xFF80FF80.toInt())
        }
        .id('stack_alignContent_bottom_end')
        .alignContent(Alignment.BottomEnd)
        .width(50)
        .height(50)
      }
    }
    .width('100%')
    .height('100%')
  }
}