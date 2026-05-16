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
  Entry, Component, Column, Row, Text, $r, RowOptions, RowOptionsV2
} from '@ohos.arkui.component'

@Entry
@Component
struct RowSpaceTest {
  build() {
    Column() {
      // Test 1: Row() - options empty (default)
      Row() {
        Text('Default')
          .width(80)
          .height(50)
          .backgroundColor(0xFFFF0000.toInt())
      }
      .id('row_default')
      .width(200)
      
      // Test 2: Row({ space: 10 })
      Row({ space: 10 } as RowOptions) {
        Text('Space 10')
          .width(80)
          .height(50)
          .backgroundColor(0xFF00FF00.toInt())
        Text('Child 2')
          .width(80)
          .height(50)
          .backgroundColor(0xFF0000FF.toInt())
      }
      .id('row_space_10')
      .width(200)
      
      // Test 3: Row({ space: '20' })
      Row({ space: '20' } as RowOptions) {
        Text('Space 20')
          .width(60)
          .height(50)
          .backgroundColor(0xFF00FFFF.toInt())
        Text('Child 2')
          .width(60)
          .height(50)
          .backgroundColor(0xFFFF00FF.toInt())
      }
      .id('row_space_20')
      .width(200)
      
      // Test 4: Row({ space: '' })
      Row({ space: '' } as RowOptions) {
        Text('Space Empty')
          .width(80)
          .height(50)
          .backgroundColor(0xFFFF00FF.toInt())
        Text('Child 2')
          .width(80)
          .height(50)
          .backgroundColor(0xFF008000.toInt())
      }
      .id('row_space_empty')
      .width(200)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}