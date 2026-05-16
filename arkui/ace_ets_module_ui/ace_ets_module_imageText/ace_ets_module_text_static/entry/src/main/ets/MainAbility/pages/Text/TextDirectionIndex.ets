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
  ColumnOptions,
  Text,
  Scroll,
  TextDirection
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextDirectionIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextDirectionIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 } as ColumnOptions) {
        // TextDirection.LTR = 0: left-to-right layout direction
        Text('Hello World - LTR')
          .textDirection(TextDirection.LTR)
          .key('textDirectionLTR')

        // TextDirection.RTL = 1: right-to-left layout direction
        Text('مرحبا بالعالم - RTL')
          .textDirection(TextDirection.RTL)
          .key('textDirectionRTL')

        // TextDirection.DEFAULT = 2: follows component layout direction
        Text('Hello World - DEFAULT')
          .textDirection(TextDirection.DEFAULT)
          .key('textDirectionDEFAULT')

        // TextDirection.AUTO = 3: follows actual text content direction
        Text('Hello World - AUTO')
          .textDirection(TextDirection.AUTO)
          .key('textDirectionAUTO')

        // textDirection: undefined (resets to default)
        Text('Hello World - undefined')
          .textDirection(undefined)
          .key('textDirectionUndefined')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
