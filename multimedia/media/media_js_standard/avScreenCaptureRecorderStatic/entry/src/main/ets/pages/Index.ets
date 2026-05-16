/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { XComponent, XComponentController, XComponentOptions } from 'arkui.component.xcomponent'
import { Position } from 'arkui.component.units'
import { Color, XComponentType } from 'arkui.component.enums'
import { AppStorage } from '@ohos.arkui.stateManagement'

class MyController extends XComponentController {
  onSurfaceCreated(containerId: string): void {
    console.info(`testTag XComponent view created with id: ${containerId}`);
    AppStorage.setOrCreate('surfaceId', containerId);
  }
}

class MyController2 extends XComponentController {
  onSurfaceCreated(containerId: string): void {
    console.info(`testTag XComponent view created with id: ${containerId}`);
    AppStorage.setOrCreate('surfaceId2', containerId);
  }
}

@Entry
@Component
struct MyStateSample {
  private surfaceId: string = ''
  xComponentController: XComponentController = new MyController()
  xComponentController2: XComponentController = new MyController2()

  build() {
    Row() {
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      } as XComponentOptions)
        .width('640px')
        .height('480px')
        .backgroundColor(Color.Red)
      XComponent({
          type: XComponentType.SURFACE,
          controller: this.xComponentController2
        } as XComponentOptions)
          .width('640px')
          .height('480px')
          .backgroundColor(Color.Yellow)
    }
    .backgroundColor(Color.Black)
    .position({ x: 0, y: 48 } as Position)
  }
}