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
  Entry, Column, Component, Button, ClickEvent, Row, Color, FlexAlign
} from '@ohos.arkui.component'

@Entry
@Component
struct RenderGroupPage {
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      Row(undefined) {
        Row()
          .backgroundColor('#ff090000')
          .width(100)
          .height(100)
          .opacity(1)
      }
      .backgroundColor('#fffcf9f9')
      .width(150)
      .height(150)
      .justifyContent(FlexAlign.Center)
      .opacity(0.6)
      .renderGroup(this.isShow ? true : undefined)
      .id('renderGroupTest')

      Button('renderGroup: ')
        .id('renderGroup')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}