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
  Scroll,
  Text,
  XComponent,
  XComponentParameters,
  XComponentType,
  XComponentController
} from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct XComponentIndex {
  private xController: XComponentController = new XComponentController();

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
      AppStorage.setOrCreate<XComponentController>('xController', this.xController);
    } catch (error) {
      console.log('XComponentIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('XComponent Test Page')
          .fontSize(16)
          .key('xComponentPageTitle')

        XComponent({
          id: 'xComponentView',
          type: XComponentType.TEXTURE,
          nativeXComponentHandler: (_nativeXComponent: long): void => {},
          controller: this.xController
        } as XComponentParameters)
          .key('xComponentView')
          .height('20%')
          .width('100%')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
