'use static';
/**
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


import {
  Entry,
  Column,
  Component,
  FlexDirection,
  FlexWrap,
  Flex,
  ColumnOptions,
  FlexSpaceOptions,
  FlexOptions,
  Text,Color
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexSpaceTest {
  @State str: string = '1'

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        space: { main: LengthMetrics.px(20), cross: LengthMetrics.px(50) } as FlexSpaceOptions
      } as FlexOptions) { // 子组件多行布局
        Text('1').width('80vp').height('50vp').backgroundColor(Color.Red).id('FlexSpaceTest_text1')
        Text('2').width('80vp').height('50vp').backgroundColor(Color.Red)
        Text('3').width('80vp').height('50vp').backgroundColor(Color.Red).id('FlexSpaceTest_text3')
      }
      .width('200vp')
      .padding(10)
      .backgroundColor(Color.Red)

    }
    .width('100%')
  }
}


