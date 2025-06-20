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
struct onKeyEventExample4 {
  @State childText: string = ''

  @State parentText : string = ""


  EventHandler: Callback<KeyEvent, boolean> = (event:KeyEvent): boolean=> {


    console.info("the keyEvent is " + JSON.stringify(event))
    return false
  }

  childEventHandler: Callback<KeyEvent, boolean> = (event:KeyEvent): boolean=> {

    this.childText = 'childTab'
    console.info("the child key is " + JSON.stringify(event))
    return false
  }

  parentEventHandler: Callback<KeyEvent, boolean> = (event:KeyEvent): boolean=> {
    this.parentText = "parentTab"
    console.info("the parent key is " + JSON.stringify(event))
    return true
  }



  build() {
    Column() {
      Row() {
        Text(this.parentText).key('tabParent')
        Text(this.childText).key('tabChild')
      }
      Button('KeyEvent')
        .onKeyEventDispatch(this.childEventHandler)
      Button('KeyEvent1')
        .onKeyEventDispatch(this.childEventHandler)
      Button('KeyEvent2')
        .onKeyEventDispatch(this.childEventHandler)

    }.height('100%').width('100%').padding(35).onKeyEventDispatch(this.parentEventHandler).onKeyEvent(this.EventHandler)
  }
}