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
import { GlobalContext } from './../../common/GlobalContext';
import { ValueT } from './../../common/Value';
import { MessageManager, Callback, Message } from './../../common/MessageManager';
import { Entry, Component, Column, Row, Text, Blank, Toggle, ToggleType, Color, Margin,ResourceColor } from '@ohos.arkui.component'
import { State,AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct BlankParentWidth {
  @StoragePropRef('blankColor') colorString : ResourceColor = "#fc7fae53"
  @StoragePropRef('minWith') minWith: string | number = '120'
  
  build() {
    Column() {
      Row() {
        Text('Bluetooth').fontSize(18).key('text')
        Blank().key('blankUIJsunit_blank')
        Toggle({ type: ToggleType.Switch }).key('toggle')
      }.width('100%').backgroundColor(Color.Red).borderRadius(15).padding({ left: 12 } as Margin).id('row')

      Row() {
        Text('Bluetooth01').fontSize(18).key('text1')
        Blank().color(Color.Yellow).key('bl1')
        Toggle({ type: ToggleType.Switch }).key('toggle1')
      }.backgroundColor(Color.Red).borderRadius(15).padding({ left: 12 } as Margin).margin({top:60} as Margin)

      Row() {
        Text('Bluetooth02').fontSize(18)
        
        Blank(this.minWith).color(this.colorString).key('bl2')
        Toggle({ type: ToggleType.Switch })
      }.backgroundColor(Color.Red).borderRadius(15).padding({ left: 12 } as Margin).margin({top:60} as Margin)

    }.backgroundColor(Color.Red).padding(20)
    
  }
}