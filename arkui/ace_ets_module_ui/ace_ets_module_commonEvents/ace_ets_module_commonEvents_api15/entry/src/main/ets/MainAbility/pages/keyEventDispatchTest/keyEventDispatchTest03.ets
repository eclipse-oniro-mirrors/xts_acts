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
struct KeyEventExample3 {
  @State childText: string = ''

  @State modifierStatePress : string = ""

  childEventHandler: Callback<KeyEvent, boolean> = (event:KeyEvent): boolean=> {

    if (event.getModifierKeyState && event.getModifierKeyState(['ctrl', 'alt', 'shift', 'fn'])) {
        this.modifierStatePress =  'ctrl & alt & shift & fn is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['ctrl', 'alt', 'shift'])) {
       this.modifierStatePress =  'ctrl & alt & shift  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['ctrl',  'shift', 'fn'])) {
       this.modifierStatePress =  'ctrl & fn & shift  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['alt',  'shift', 'fn'])) {
       this.modifierStatePress =  'alt & fn & shift  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['ctrl', 'shift'])) {
      this.modifierStatePress =  'ctrl & shift  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['ctrl', 'alt'])) {
      this.modifierStatePress =  'ctrl & alt  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['ctrl', 'fn'])) {
      this.modifierStatePress =  'ctrl & fn  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['alt', 'shift'])) {
      this.modifierStatePress =  'alt & shift  is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['alt', 'fn'])) {
       this.modifierStatePress =  'alt & fn is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['shift', 'fn'])) {
      this.modifierStatePress =  'shift & fn is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['ctrl'])) {
       this.modifierStatePress =  'ctrl is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['alt'])) {
      this.modifierStatePress =  'alt is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['shift'])) {
      this.modifierStatePress =  'shift is press'
    } else if (event.getModifierKeyState && event.getModifierKeyState(['fn'])) {
      this.modifierStatePress =  'fn is press'
    }
    console.info("the child key is " + JSON.stringify(event))
    return false
  }




  build() {
    Column() {
      Row() {
        Text(this.modifierStatePress).key('modifierStatePress')
      }
      Button('KeyEvent')
        .onKeyEvent(this.childEventHandler)

    }.height('100%').width('100%').padding(35)
  }
}