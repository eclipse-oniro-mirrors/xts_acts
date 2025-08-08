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

import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct KeyEventExample6 {
  @State childText: string = ''
  @State parentText: string = ''

  eventHandler: Callback<KeyEvent, undefined> = (keyEvent) => {
    console.info("the parent key is " + JSON.stringify(keyEvent))
    this.parentText = "parentResponse"
    return undefined
  }
  childEventHandler: Callback<KeyEvent, undefined> = (keyEvent) => {
    this.childText = "childResponse"
    console.info("the child key is " + JSON.stringify(keyEvent))
    return undefined
  }

  build() {
    Column() {
      Row() {
        Text(this.childText).key('childText6')
        Text(this.parentText).key('parentText6')
      }
      Button('KeyEvent')
        .onKeyEvent(this.childEventHandler)

    }.height('100%').width('100%').padding(35).onKeyEvent(this.eventHandler)
  }
}