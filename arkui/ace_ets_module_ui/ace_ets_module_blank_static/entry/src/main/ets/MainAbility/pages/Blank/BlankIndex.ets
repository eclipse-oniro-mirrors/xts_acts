'use static';
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
import {
  Entry,
  Component,
  Column,
  Scroll,
  Blank,
  Row,
  Text
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct BlankIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] BlankIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // Blank() no args
        Row() {
          Text('L')
          Blank()
            .id('blankNoArgs').key('blankNoArgs')
          Text('R')
        }.width('100%').height('8%')

        // Blank(100) double min
        Row() {
          Text('L')
          Blank(100)
            .id('blankMinDouble').key('blankMinDouble')
          Text('R')
        }.width('100%').height('8%')

        // Blank('50vp') string min
        Row() {
          Text('L')
          Blank('50vp')
            .id('blankMinString').key('blankMinString')
          Text('R')
        }.width('100%').height('8%')

        // Blank(0) zero
        Row() {
          Text('L')
          Blank(0)
            .id('blankMinZero').key('blankMinZero')
          Text('R')
        }.width('100%').height('8%')

        // Blank(undefined) undefined
        Row() {
          Text('L')
          Blank(undefined)
            .id('blankMinUndefined').key('blankMinUndefined')
          Text('R')
        }.width('100%').height('8%')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
