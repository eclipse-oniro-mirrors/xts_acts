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
import { State } from '@ohos.arkui.stateManagement'
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  Circle,
  BlendApplyType,
  VerticalAlign,
  Position,
  Color,
  BlendMode
} from '@ohos.arkui.component'

@Entry
@Component
struct BlendModePage {
  @State isShow: boolean | undefined = true;
  @State show: boolean | undefined = false;

  build() {
    Column() {
      Row(undefined) {
        Circle()
          .width(200)
          .height(200)
          .fill(Color.Blue)
          .position({ x: 150, y: 50 } as Position)
      }
      .blendMode(this.isShow ? (BlendMode.OVERLAY) : undefined, this.isShow ? BlendApplyType.OFFSCREEN : undefined)
      .alignItems(VerticalAlign.Center)
      .height(300)
      .width('100%')
      .id('blendModeTest')

      Button('blendMode: ')
        .id('blendMode')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}