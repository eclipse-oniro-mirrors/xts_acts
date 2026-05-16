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
import { TextAlign, FlexDirection, Flex, Entry,  Text,  Column,  ColumnOptions,  Component,  Button,
  ClickEvent,  Color,  Row,  $r,  Direction,  RowOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct FlexExample {
  @State flag: boolean = true;
  @State buttonText: string = 'true'

  build() {
    Column() {
      Text('flexShrink-动态切换').fontSize(20).margin(15).width('90%')
      Flex({ direction: FlexDirection.Row }) {
        Text('flexShrink(0)')
          .flexShrink(this.flag ? 8 as Double : undefined)
          .width('50%')
          .height(50)
          .backgroundColor('#0ff5DEB3')
          .textAlign(TextAlign.Center)
          .id('common_FlexShrink')
      }.width('90%').height(60).padding(10).backgroundColor('#ffAFEEEE')

      Column() {
        Button('flag is' + this.flag).fontSize(20).id('changeButton')
          .onClick((e: ClickEvent) => {
            this.flag = !this.flag;
          })
      }
    }.width('100%')
  }
}