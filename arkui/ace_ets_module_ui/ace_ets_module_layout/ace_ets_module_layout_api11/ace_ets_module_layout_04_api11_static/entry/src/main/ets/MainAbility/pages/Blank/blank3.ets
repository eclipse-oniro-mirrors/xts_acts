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
import events_emitter from '@ohos.events.emitter';
import { Entry, Text, Column, Component, Color, Blank, Row, ToggleType, Toggle, Margin } from '@ohos.arkui.component'
import { State,AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement'
import { Callback } from './../../common/MessageManager';

@Entry
@Component
struct Blank3Example {
  @StoragePropRef('colorValue') colorValue: Color = Color.Blue;

  onPageShow() {
    console.info('Blank page1 show called');

  }

  build() {
    Column() {
      Row() {
        Text('Bluetooth').fontSize(18)
        Blank().color(this.colorValue).key('blank3Jsunit_blank')
        Toggle({ type: ToggleType.Switch })
      }.width('100%')
      .backgroundColor(Color.Red)
      .borderRadius(15)
      .padding({ left: 12 } as Margin)
    }.backgroundColor(Color.Red).padding(20)
  }
}