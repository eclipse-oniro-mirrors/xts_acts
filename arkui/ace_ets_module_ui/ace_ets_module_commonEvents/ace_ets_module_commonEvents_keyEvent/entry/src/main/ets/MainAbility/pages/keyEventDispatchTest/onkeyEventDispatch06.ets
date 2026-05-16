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
struct onKeyEventExample6 {

 @State keyText : string = "";
  @State childText : string = "";
  EventHandler: Callback<KeyEvent, boolean> = (event:KeyEvent): boolean=> {

    console.info("the keyEvent is " + JSON.stringify(event))
    this.keyText = "keyTrigger"
    return false
  }

  childEventHandler: Callback<KeyEvent, undefined> = (event:KeyEvent): undefined=> {

    console.info("the child key is " + JSON.stringify(event))
    this.childText = "childTrigger"
    return undefined
  }



  build() {
    Column() {
      Row() {
        Text(this.keyText).key("keykey")
        Text(this.childText).key("childkey")
      }
      Button('KeyEvent')
        .onKeyEventDispatch(this.childEventHandler).onKeyEvent(this.EventHandler)
      Button('KeyEvent')
        .onKeyEvent(this.EventHandler)


    }.height('100%').width('100%').padding(35)
  }
}