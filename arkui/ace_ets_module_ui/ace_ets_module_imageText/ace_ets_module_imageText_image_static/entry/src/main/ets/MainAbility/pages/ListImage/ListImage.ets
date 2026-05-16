/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Image,
  List,
  $r
} from '@ohos.arkui.component';

@Entry
@Component
struct ListImagePage {
  build() {
    Column() {
      Image($r('app.media.icon')).width(24).height(24)
        .antialiased(true)
        .id('imgAntiTrue').key('imgAntiTrue')
      Image($r('app.media.icon')).width(24).height(24)
        .antialiased(false)
        .id('imgAntiFalse').key('imgAntiFalse')
      Image($r('app.media.icon')).width(24).height(24)
        .antialiased(undefined)
        .id('imgAntiUndef').key('imgAntiUndef')

      List().lanes(2 as Int).width('100%').height(24)
        .id('listLanesInt').key('listLanesInt')
      List().lanes(undefined).width('100%').height(24)
        .id('listLanesUndef').key('listLanesUndef')
      List().lanes(2 as Int, 10.0).width('100%').height(24)
        .id('listLanesGutterDim').key('listLanesGutterDim')
      List().lanes(2 as Int, undefined).width('100%').height(24)
        .id('listLanesGutterUndef').key('listLanesGutterUndef')

      List().contentStartOffset(10.0).width('100%').height(24)
        .id('listCsoDouble').key('listCsoDouble')
      List().contentStartOffset($r('app.float.float_1')).width('100%').height(24)
        .id('listCsoRes').key('listCsoRes')
      List().contentStartOffset(undefined).width('100%').height(24)
        .id('listCsoUndef').key('listCsoUndef')

      List().contentEndOffset(20.0).width('100%').height(24)
        .id('listCeoDouble').key('listCeoDouble')
      List().contentEndOffset($r('app.float.float_1')).width('100%').height(24)
        .id('listCeoRes').key('listCeoRes')
      List().contentEndOffset(undefined).width('100%').height(24)
        .id('listCeoUndef').key('listCeoUndef')

      List().cachedCount(3 as Int).width('100%').height(24)
        .id('listCcInt').key('listCcInt')
      List().cachedCount(undefined).width('100%').height(24)
        .id('listCcUndef').key('listCcUndef')
      List().cachedCount(3 as Int, true).width('100%').height(24)
        .id('listCcShowTrue').key('listCcShowTrue')
      List().cachedCount(3 as Int, false).width('100%').height(24)
        .id('listCcShowFalse').key('listCcShowFalse')
      List().cachedCount(3 as Int, undefined).width('100%').height(24)
        .id('listCcShowUndef').key('listCcShowUndef')

      List().width('100%').height(24)
        .id('listGlobal').key('listGlobal')
    }
    .width('100%')
    .height('100%')
    .padding(5)
  }
}
