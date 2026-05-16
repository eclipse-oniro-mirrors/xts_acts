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
import { Entry, Component, Column, Text, BackgroundOptions, LayoutSafeAreaEdge } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CommonIndex {
  private bgOptions: BackgroundOptions = {
    ignoresLayoutSafeAreaEdges: [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM]
  };

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
      let readBack = this.bgOptions.ignoresLayoutSafeAreaEdges;
      console.info('[ARKUI_NEW] CommonIndex ignoresLayoutSafeAreaEdges len ' + (readBack ? readBack.length : 0));
    } catch (error) { console.info('[ARKUI_NEW] CommonIndex error ' + error); }
  }
  build() {
    Column() {
      Text('Common Test Page').key('commonRoot').id('commonRoot').fontSize(20)
    }
      .width('100%')
      .height('100%')
      .background('#E8E8E8', this.bgOptions)
  }
}
