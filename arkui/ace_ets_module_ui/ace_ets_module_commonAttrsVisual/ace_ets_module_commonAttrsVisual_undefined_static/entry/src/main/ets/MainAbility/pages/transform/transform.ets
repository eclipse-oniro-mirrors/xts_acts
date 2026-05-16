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
  Entry, Column, Component, Button, ClickEvent, Row
} from '@ohos.arkui.component'
import matrix4 from '@ohos.matrix4'

@Entry
@Component
struct TransformPage {
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      Row()
        .width(100)
        .height(100)
        .backgroundColor('#AFEEEE')
        .transform(this.isShow ? matrix4.identity().rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: 300
        }) : undefined)
        .id('transformTest')
      Button('transform: ')
        .id('transform')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}