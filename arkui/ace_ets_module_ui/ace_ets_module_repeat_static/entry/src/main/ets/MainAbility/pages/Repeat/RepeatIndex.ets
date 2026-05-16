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
import { Entry, Component, Column, Text, List, ListItem, Repeat, RepeatItem } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RepeatIndex {
  @State items: string[] = ['R1', 'R2', 'R3', 'R4', 'R5'];

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] RepeatIndex error ' + error); }
  }

  build() {
    Column() {
      Text('Repeat Test').key('repeatRoot').id('repeatRoot').fontSize(20)
      List() {
        Repeat<string>(this.items)
          .each((ri: RepeatItem<string>) => {
            ListItem() { Text(ri.item).fontSize(14) }
          })
          .key((item: string, index: int) => item)
          .debugLine('RepeatIndex.ets:22', 'entry')
      }.key('repeatList').id('repeatList').width('100%').height('60%')
    }.width('100%').height('100%')
  }
}
