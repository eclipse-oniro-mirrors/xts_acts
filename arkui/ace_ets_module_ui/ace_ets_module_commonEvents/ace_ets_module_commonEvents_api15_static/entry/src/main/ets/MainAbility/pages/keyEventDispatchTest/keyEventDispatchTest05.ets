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

import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { KeyType, KeyEvent, Row, Entry, Column, Text, Button, ClickEvent, Component } from '@ohos.arkui.component'

@Entry
@Component
struct KeyEventExample5 {
  @State childText: string = ''
  @State parentText: string = ''

build() {
    Column() {
      Row() {
        Text(this.childText).key('childText5')
        Text(this.parentText).key('parentText5')
      }

      Button('KeyEvent')
        .onKeyEvent(((keyEvent: KeyEvent):boolean => {
          this.childText = "childResponse"
          console.info("the child key is " + JSON.stringify(keyEvent))
          return false
        }) as ((data: KeyEvent) => Boolean)
        )

    }.height('100%').width('100%').padding(35).onKeyEvent(((keyEvent: KeyEvent):boolean => {
      console.info("the parent key is " + JSON.stringify(keyEvent))
      this.parentText = "parentResponse"
      return false
    }) as ((data: KeyEvent) => Boolean))
  }
}