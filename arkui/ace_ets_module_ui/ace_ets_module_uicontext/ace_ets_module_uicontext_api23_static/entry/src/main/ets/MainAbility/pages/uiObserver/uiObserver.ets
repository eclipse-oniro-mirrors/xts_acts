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
  TextAlign,
  Entry,
  Component,
  FlexAlign
} from '@ohos.arkui.component';
import { UIContext, UIObserver, SwiperContentInfo } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import uiObserver from '@ohos.arkui.observer';

@Entry
@Component
struct uiObserverTest {

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Text('UIObs')
        .fontSize(11)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Center)
        .id('uiObserverTitle')

      Button('Tab+')
        .id('btnOnTabChange')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onTabChange((info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnTabChange', true);
              let lastIndex = info.lastIndex;
              if (lastIndex !== undefined) {
                AppStorage.setOrCreate<string>('uiObserverTabContentLastIndex', `${lastIndex}`);
              }
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnTabChangeRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onTabChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnTabChangeRegistered', false);
          }
        })

      Button('offTabChange')
        .id('btnOffTabChange')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offTabChange();
            AppStorage.setOrCreate<boolean>('uiObserverOffTabChange', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offTabChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffTabChange', false);
          }
        })

      Button('Rsz+')
        .id('btnOnRouterPageSizeChange')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onRouterPageSizeChange((info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnRouterPageSizeChange', true);
              let serializedSize = JSON.stringify(info.size);
              AppStorage.setOrCreate<string>('uiObserverRouterPageInfoSize',
                serializedSize !== undefined ? serializedSize : '');
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnRouterPageSizeChangeRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onRouterPageSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnRouterPageSizeChangeRegistered', false);
          }
        })

      Button('Rsz-')
        .id('btnOffRouterPageSizeChange')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offRouterPageSizeChange();
            AppStorage.setOrCreate<boolean>('uiObserverOffRouterPageSizeChange', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offRouterPageSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffRouterPageSizeChange', false);
          }
        })

      Button('Nav+')
        .id('btnOnNavDestinationSizeChange')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onNavDestinationSizeChange((info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChange', true);
              let serializedSize = JSON.stringify(info.size);
              AppStorage.setOrCreate<string>('uiObserverNavDestinationInfoSize',
                serializedSize !== undefined ? serializedSize : '');
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onNavDestinationSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeRegistered', false);
          }
        })

      Button('Nav-')
        .id('btnOffNavDestinationSizeChange')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offNavDestinationSizeChange();
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChange', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offNavDestinationSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChange', false);
          }
        })

      Button('NavId+')
        .id('btnOnNavDestinationSizeChangeByUniqueId')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onNavDestinationSizeChangeByUniqueId(1, (info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueId', true);
              let serializedSize = JSON.stringify(info.size);
              AppStorage.setOrCreate<string>('uiObserverNavDestinationInfoByUniqueIdSize',
                serializedSize !== undefined ? serializedSize : '');
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onNavDestinationSizeChangeByUniqueId: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered', false);
          }
        })

      Button('NavId-')
        .id('btnOffNavDestinationSizeChangeByUniqueId')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(8)
        .onClick(() => {
          try {
            if (AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered') !== true) {
              AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId', false);
              return;
            }
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offNavDestinationSizeChangeByUniqueId(1);
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offNavDestinationSizeChangeByUniqueId: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId', false);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
