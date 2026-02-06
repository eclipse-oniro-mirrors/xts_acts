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
import { Entry, Component, Row, FlexAlign,ResourceColor,Resource, Length,Margin, Column, ColumnOptions, Text, Flex, FlexDirection, FlexWrap, Color } from '@ohos.arkui.component'
import { State,AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct FlexWrapExample {
  @StoragePropRef('sWidth') sWidth: Length = '20%'
  @StoragePropRef('sHeight') sHeight: undefined|string|number|Resource = 40 as number
  @StoragePropRef('sBackgroundColor') sBackgroundColor: ResourceColor = 0xD2B48C

  build() {
    Column() {
      Column({ space: 5 } as ColumnOptions) {
        Text('WrapReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.WrapReverse, direction: FlexDirection.Row }) {
          Text('1')
            .width(this.sWidth)
            .height(this.sHeight)
            .backgroundColor(this.sBackgroundColor)
          Text('2')
            .width(this.sWidth).height(this.sHeight)
            .backgroundColor(this.sBackgroundColor)
          Text('3')
            .width(this.sWidth).height(this.sHeight)
            .backgroundColor(this.sBackgroundColor)
            .key('WrapReverse')
        }
        .width('90%')
        .height(120)
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
}