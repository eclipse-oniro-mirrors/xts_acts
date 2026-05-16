'use static'
/**
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

import {
  Entry,
  Component,
  Column,
  Button,
  ClickEvent,
  Image,
  $r,
  Color,
  OutlineStyle,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct OutlineRadiusPage {
  @State isState: boolean = false;

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .backgroundColor(Color.Pink)
        .width(300)
        .height(300)
        .id('outlineRadiusTest')
        .outline({
          width: {
            left: 3,
            right: 6,
            top: 10,
            bottom: 15
          },
          color: {
            left: '#e3bbbb',
            right: Color.Blue,
            top: Color.Red,
            bottom: Color.Green
          },
          radius: {
            topLeft: 10,
            topRight: 20,
            bottomLeft: 40,
            bottomRight: 80
          },
          style: {
            left: OutlineStyle.DOTTED,
            right: OutlineStyle.DOTTED,
            top: OutlineStyle.SOLID,
            bottom: OutlineStyle.DASHED
          }
        })
        .outlineRadius(this.isState ? 5.0 : undefined)
      Button('outlineRadius: ' + this.isState)
        .id('outlineRadius')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }
  }
}