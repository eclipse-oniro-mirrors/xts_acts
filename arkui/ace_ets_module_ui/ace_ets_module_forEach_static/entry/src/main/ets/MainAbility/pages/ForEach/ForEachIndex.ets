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
import { Entry, Component, Column, Text, ForEach } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ForEachIndex {
  @State items: string[] = ['Alpha', 'Beta', 'Gamma', 'Delta'];

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] ForEachIndex error ' + error); }
  }

  build() {
    Column() {
      Text('ForEach Test').key('forEachRoot').id('forEachRoot').fontSize(20)
      Column() {
        ForEach(this.items, (item: string) => {
          Text(item).fontSize(16)
        }, (item: string) => item)
          .debugLine('ForEachIndex.ets:22', 'entry')
      }.key('forEachContainer').id('forEachContainer').width('100%')
    }.width('100%').height('100%')
  }
}
