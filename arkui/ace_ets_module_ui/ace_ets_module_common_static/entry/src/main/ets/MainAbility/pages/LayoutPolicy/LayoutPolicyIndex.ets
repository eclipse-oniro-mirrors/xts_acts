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
  Text,
  Scroll,
  Row
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LayoutPolicy } from '@ohos.arkui.component';

@Entry
@Component
struct LayoutPolicyIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('LayoutPolicyIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('LayoutPolicy Test Page')
          .key('layoutPolicyPage')

        Row()
          .key('wrapContentRow')
          .width(LayoutPolicy.wrapContent)
          .height(LayoutPolicy.wrapContent)

        Row()
          .key('fixAtIdealSizeRow')
          .width(LayoutPolicy.fixAtIdealSize)
          .height(LayoutPolicy.fixAtIdealSize)
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
