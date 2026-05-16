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
import { Entry, Component, Column, Text, Button, List, ListItem, VoidCallback } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIInspector } from '@ohos.arkui.UIContext';

@Entry
@Component
struct InspectorIndex {
  @State drawChildrenResult: string = 'waiting';
  @State observerStatus: string = 'not created';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] InspectorIndex error ' + error); }
  }

  onPageShow() {
    try {
      let uiInspector: UIInspector = this.getUIContext().getUIInspector();
      let observer = uiInspector.createComponentObserver('inspectorParent');
      this.observerStatus = 'created';
      AppStorage.setOrCreate<string>('observerCreated', 'true');

      let drawChildrenCb: VoidCallback = (): void => {
        this.drawChildrenResult = 'triggered';
        AppStorage.setOrCreate<string>('drawChildrenTriggered', 'true');
        console.info('[ARKUI_NEW] onDrawChildren callback triggered');
      };
      observer.onDrawChildren(drawChildrenCb);
      AppStorage.setOrCreate<string>('onDrawChildrenRegistered', 'true');

      setTimeout((): void => {
        observer.offDrawChildren(drawChildrenCb);
        AppStorage.setOrCreate<string>('offDrawChildrenCalled', 'true');
      }, 2000);
    } catch (error) {
      this.observerStatus = 'error';
      AppStorage.setOrCreate<string>('observerCreated', 'error:' + error);
      console.error('[ARKUI_NEW] InspectorIndex onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Text('Inspector Test').key('inspectorRoot').id('inspectorRoot').fontSize(20)
      Text('Observer: ' + this.observerStatus).key('inspObserverStatus').id('inspObserverStatus').fontSize(14)
      Text('DrawChildren: ' + this.drawChildrenResult).key('inspDrawResult').id('inspDrawResult').fontSize(14)

      Column() {
        List() {
          ListItem() { Text('Child1').key('inspChild1').id('inspChild1') }
          ListItem() { Text('Child2').key('inspChild2').id('inspChild2') }
          ListItem() { Text('Child3').key('inspChild3').id('inspChild3') }
        }.width('100%').height('30%')
      }.key('inspectorParent').id('inspectorParent').width('100%')

      Button('Refresh Inspector')
        .key('inspRefreshBtn').id('inspRefreshBtn')
        .fontSize(14).width('60%').margin({ top: 10 })
    }.width('100%').height('100%')
  }
}
