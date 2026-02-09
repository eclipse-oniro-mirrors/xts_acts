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
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Button, Color, Column, Component, Entry, Text, TouchEvent, TouchType } from '@ohos.arkui.component'

@Entry
@Component
struct monopolize1 {
  @State message: string = 'set monopolizeEvents false'
  @State monopolize: boolean = false

  build() {
    Column() {
      Text(this.message)
      Column() {
        Column()
          .key('monopolize_column')
          .monopolizeEvents(this.monopolize)
          .width('100%')
          .height('40%')
          .backgroundColor(Color.Blue)
          .onTouch((event: TouchEvent) => {
            if (event.type == TouchType.Down) {
              console.log("inner column touch down")
            }
          })
      }
    }
    .height('100%')
  }
}