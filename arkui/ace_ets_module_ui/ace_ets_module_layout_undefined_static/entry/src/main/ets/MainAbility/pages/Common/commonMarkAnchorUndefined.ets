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
import { State, Observed } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute, Column, Row, Component, Button, ButtonAttribute,
  ClickEvent, Position, Divider } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'

@Entry
@Component
struct markAnchor {
  @State flag: boolean = true;
  @State buttonText: string = 'false'

  build() {
    Column() {
      Text('markAnchor-动态切换').fontSize(20).margin(15).width('90%')
      Button('Button'+this.buttonText)
        .fontSize(50)
        .markAnchor(this.flag ? undefined  : { x: -50, y: -0 } as Position  )
        .id('common_markAnchor')
      Divider()
      Button('flag is' + this.flag).fontSize(20).id('changeButton')
        .onClick((e: ClickEvent) => {
          this.flag = !this.flag;
        })

    }.width('100%')
  }
}