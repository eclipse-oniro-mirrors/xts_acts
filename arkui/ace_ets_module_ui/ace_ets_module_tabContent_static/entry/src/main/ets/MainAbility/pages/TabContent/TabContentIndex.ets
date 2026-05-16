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
  Tabs,
  TabContent,
  SubTabBarStyle,
  SubTabBarIndicatorStyle,
  Text,
  Color
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabContentIndex {
  @State currentIndex: int = 0;

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TabContentIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // DrawableTabBarIndicator: width=40, height=4, borderRadius=2, marginTop=8
        // SubTabBarIndicatorStyle shares the same width/height/borderRadius/marginTop props
        // as DrawableTabBarIndicator; cast to SubTabBarIndicatorStyle for compile compatibility
        Tabs({ index: this.currentIndex }) {
          TabContent() {
            Text('Content 1').key('tabContent1Text')
          }
          .tabBar(SubTabBarStyle.of('Tab 1').indicator({
            width: 40,
            height: 4,
            borderRadius: 2,
            marginTop: 8
          } as SubTabBarIndicatorStyle))
          .key('tabContentItem1')

          TabContent() {
            Text('Content 2').key('tabContent2Text')
          }
          .tabBar(SubTabBarStyle.of('Tab 2').indicator({
            width: 60,
            height: 6,
            borderRadius: 4,
            marginTop: 10
          } as SubTabBarIndicatorStyle))
          .key('tabContentItem2')

          TabContent() {
            Text('Content 3').key('tabContent3Text')
          }
          .tabBar('Tab 3')
          .key('tabContentItem3')
        }
        .key('tabsDrawableIndicator')
        .width('100%')
        .height('30%')

        Tabs({ index: this.currentIndex }) {
          TabContent() {
            Text('D1').key('tabContentDrawable1Text')
          }
          .tabBar(SubTabBarStyle.of('DTab').indicator({ width: 40, height: 4, borderRadius: 2, marginTop: 8 } as SubTabBarIndicatorStyle))
          .key('tabContentDrawableItem')
        }
        .key('tabsDrawableProperty')
        .width('100%')
        .height('30%')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
