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
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  FlexAlign
} from '@ohos.arkui.component';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct routerTest {
  aboutToAppear() {
    try {
      let routerInstance: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
      // For RouterTest only; avoid other tests reading 'router'
      AppStorage.setOrCreate<Router>('routerForTest', routerInstance);
    } catch (error) {
      console.error('[ARKUI_NEW] router create error: ' + error);
    }
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Button('Clear')
        .id('btnRouterClear')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '42%' })
        .fontSize(10)
        .onClick(() => {
          try {
            let router = AppStorage.get<Router>('router');
            if (router) {
              router.clear();
              AppStorage.setOrCreate<boolean>('routerClear', true);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] router clear error: ' + error);
          }
        })

      Button('stack')
        .id('btnRouterGetStackSize')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '42%' })
        .fontSize(10)
        .onClick(() => {
          try {
            let router = AppStorage.get<Router>('router');
            if (router) {
              let stackSize: number = router.getStackSize();
              console.info('[ARKUI_NEW] router.getStackSize() = ' + stackSize);
              AppStorage.setOrCreate<number>('routerStackSize', stackSize);
            } else {
              // router is null, set flag -1 for failure
              AppStorage.setOrCreate<number>('routerStackSize', -1);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] router getStackSize error: ' + error);
            AppStorage.setOrCreate<number>('routerStackSize', -1);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
