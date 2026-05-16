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
  Text,
  Curve
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabsIndex {
  @State currentIndex: int = 0;

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TabsIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // ---------- TabsAttribute.animationCurve - Curve.Linear ----------
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }
        .animationCurve(Curve.Linear)
        .key('tabsAnimCurveLinear')
        .height('13%')
        .width('100%')

        // ---------- TabsAttribute.animationCurve - Curve.Ease ----------
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }
        .animationCurve(Curve.Ease)
        .key('tabsAnimCurveEase')
        .height('13%')
        .width('100%')

        // ---------- TabsAttribute.animationCurve - Curve.EaseIn ----------
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }
        .animationCurve(Curve.EaseIn)
        .key('tabsAnimCurveEaseIn')
        .height('13%')
        .width('100%')

        // ---------- TabsAttribute.animationCurve - undefined ----------
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }
        .animationCurve(undefined)
        .key('tabsAnimCurveUndefined')
        .height('13%')
        .width('100%')

        // ---------- TabsAttribute.onContentDidScroll - with callback ----------
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }
        .onContentDidScroll((selectedIndex: int, index: int, position: double, mainAxisLength: double) => {
          console.info('TabsIndex onContentDidScroll: sel=' + selectedIndex + ' idx=' + index +
            ' pos=' + position + ' len=' + mainAxisLength);
        })
        .key('tabsOnContentDidScroll')
        .height('13%')
        .width('100%')

        // ---------- TabsAttribute.onContentDidScroll - undefined ----------
        Tabs({ index: this.currentIndex }) {
          TabContent() { Text('T1') }.tabBar('T1')
          TabContent() { Text('T2') }.tabBar('T2')
        }
        .onContentDidScroll(undefined)
        .key('tabsOnContentDidScrollUndefined')
        .height('13%')
        .width('100%')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
