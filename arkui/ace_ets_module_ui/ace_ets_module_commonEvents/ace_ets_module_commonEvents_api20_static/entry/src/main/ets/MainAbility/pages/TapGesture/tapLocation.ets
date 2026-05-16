'use static';
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
import {
  Column,
  ColumnOptions,
  Component,
  DragEvent,
  Entry,
  GestureEvent,
  NodeContainer,
  TapGesture,
  Text,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { FrameNode, LengthMetrics, NodeController, typeNode } from '@ohos.arkui.node';

@Entry
@Component
struct tapLocationExample {
  @State value1: Double = 0
  @State value2: Double = 0
  @State value3: Double = 0
  @State value4: Double = 0
  @State value5: Double = 0
  @State value6: Double = 0

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('点击显示tapLocation')
        .id('TapGesture')
        .gesture(
          TapGesture({ fingers: 1 })
            .onAction((event: GestureEvent) => {
              // this.value1 = event.tapLocation!.x
              // this.value2 = event.tapLocation!.y
              // this.value3 = event.tapLocation!.windowX
              // this.value4 = event.tapLocation!.windowY
              // this.value5 = event.tapLocation!.displayX
              // this.value6 = event.tapLocation!.displayY // App died
            })
        )
        .height('40%')
        .width('90%')
        .padding(20)
        .border({ width: 3 })
        .margin(10)
      Text('' + this.value1).id('x')
      Text('' + this.value2).id('y')
      Text('' + this.value3).id('windowX')
      Text('' + this.value4).id('windowY')
      Text('' + this.value5).id('displayX')
      Text('' + this.value6).id('displayY')
    }
    .height('100%')
    .width('100%')
  }
}