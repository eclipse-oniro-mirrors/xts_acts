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
import { Entry, Component, Column, Text, List, ListItem, LazyForEach, IDataSource, DataChangeListener } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

export class SimpleDataSource implements IDataSource<string> {
  private data: string[] = ['Item0', 'Item1', 'Item2', 'Item3', 'Item4'];
  private listeners: DataChangeListener[] = [];

  totalCount(): int { return this.data.length; }
  getData(index: int): string { return this.data[index]; }
  registerDataChangeListener(listener: DataChangeListener): void { this.listeners.push(listener); }
  unregisterDataChangeListener(listener: DataChangeListener): void {
    let idx = this.listeners.indexOf(listener);
    if (idx >= 0) { this.listeners.splice(idx, 1); }
  }
}

@Entry
@Component
struct LazyForEachIndex {
  private dataSource: SimpleDataSource = new SimpleDataSource();

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] LazyForEachIndex error ' + error); }
  }

  build() {
    Column() {
      Text('LazyForEach Test').key('lazyForEachRoot').id('lazyForEachRoot').fontSize(20)
      List() {
        LazyForEach(this.dataSource, (item: string) => {
          ListItem() { Text(item).fontSize(14) }
        }, (item: string) => item)
          .debugLine('LazyForEachIndex.ets:36', 'entry')
      }.key('lazyForEachList').id('lazyForEachList').width('100%').height('60%')
    }.width('100%').height('100%')
  }
}
