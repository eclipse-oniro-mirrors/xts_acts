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
import { Entry, Component, Column, Scroll, Tabs, TabContent, Text, TabsNestedScrollMode } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabsNestedIndex {
  @State currentIndex: int = 0;
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] TabsNestedIndex error ' + error); }
  }
  build() {
    Scroll() {
      Column() {
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }.nestedScroll(TabsNestedScrollMode.SELF_ONLY).key('tabsNestedSelfOnly').id('tabsNestedSelfOnly').height('15%').width('100%')

        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }.nestedScroll(TabsNestedScrollMode.SELF_FIRST).key('tabsNestedSelfFirst').id('tabsNestedSelfFirst').height('15%').width('100%')

        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }.nestedScroll(undefined).key('tabsNestedUndefined').id('tabsNestedUndefined').height('15%').width('100%')
      }.width('100%').padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }.width('100%').height('100%')
  }
}
