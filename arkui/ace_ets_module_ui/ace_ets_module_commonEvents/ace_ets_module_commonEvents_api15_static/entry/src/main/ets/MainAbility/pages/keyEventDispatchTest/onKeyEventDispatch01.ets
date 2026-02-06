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
struct onKeyEventExample {
  @State text: string = ''
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  @State text5: string = ''
  @State text6: string = ''
  @State text7: string = ''
  @State text8: string = ''
  @State eventType: string = ''
build() {
    Column() {
      Row() {
          Text(this.text).key('keyEvent0')
          Text(this.text1).key('keyEvent1')
          Text(this.text2).key('keyEvent2')
          Text(this.text3).key('keyEvent3')
          Text(this.text4).key('keyEvent4')
      }
      Row() {
        Text(this.text5).key('keyEvent5')
        Text(this.text6).key('keyEvent6')
        Text(this.text7).key('keyEvent7')
        Text(this.text8).key('keyEvent8')
      }
      Button('KeyEvent')
        .onKeyEventDispatch((keyEvent: KeyEvent): boolean => {
          console.info("the key is " + JSON.stringify(keyEvent))
          if(keyEvent.type == KeyType.Down) {
            this.text = keyEvent.type + "";
          }
          if(keyEvent.type == KeyType.Up) {
            this.text1 = keyEvent.type + "";
          }
          this.text2 = keyEvent.keyCode + "";
          this.text3 = keyEvent.keySource + "";
          this.text4 = keyEvent.deviceId + "";
          this.text5 = keyEvent.keyText;
          this.text6 = keyEvent.metaKey + "";
          this.text7 = keyEvent.timestamp + ""
          this.text8 = keyEvent.intentionCode + ""

          return false
        })
    }.height('100%').width('100%').padding(35)
  }
}