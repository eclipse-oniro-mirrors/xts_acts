'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, TabsController, Tabs, TabContent, Text, SubTabBarStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TabsAp1 {
  @State currentIndex: int = 1
  private tabsController: TabsController = new TabsController()

  onPageShow(): void {
    this.tabsController.preloadItems([0, 2, 3])
      .then(() => {
        console.info('preloadItems success.')
      })
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex, controller: this.tabsController }) {
        TabContent() {
          Text('tabContent1')
        }.tabBar(SubTabBarStyle.of('green'))

        TabContent() {
          Text('tabContent2')

        }.tabBar(SubTabBarStyle.of('blue'))

        TabContent() {
          Text('tabContent3').id('TabsAp1_text1')

        }.tabBar(SubTabBarStyle.of('yellow'))

        TabContent() {
          Text('tabContent4')
        }.tabBar(SubTabBarStyle.of('pink'))
      }
      .width(360)
      .height(296)
      .backgroundColor('#F1F3F5')
      .onChange((index: int): void => {
        this.currentIndex = index
      })
    }
  }
}