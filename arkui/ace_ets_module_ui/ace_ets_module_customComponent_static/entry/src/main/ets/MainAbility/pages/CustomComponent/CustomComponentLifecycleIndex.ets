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
import { Entry, Component, ComponentV2, Column, Text, Button } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import {
  CustomComponentLifecycle,
  CustomComponentLifecycleObserver,
  CustomComponentLifecycleState,
  ReuseObject
} from '@ohos.arkui.component';

@ComponentV2
struct LifecycleTestComp {
  @State statusText: string = 'init';

  aboutToAppear() {
    try {
      let addObserverCalled = false;
      let removeObserverCalled = false;
      let getCurrentStateCalled = false;

      let observer: CustomComponentLifecycleObserver = {
        aboutToAppear(): void {
          console.info('[ARKUI_NEW] observer.aboutToAppear triggered');
        },
        onDidBuild(): void {
          console.info('[ARKUI_NEW] observer.onDidBuild triggered');
        },
        aboutToDisappear(): void {
          console.info('[ARKUI_NEW] observer.aboutToDisappear triggered');
        },
        aboutToReuse(params?: ReuseObject): void {
          console.info('[ARKUI_NEW] observer.aboutToReuse triggered params=' + params);
        },
        aboutToRecycle(): void {
          console.info('[ARKUI_NEW] observer.aboutToRecycle triggered');
        }
      };

      let lifecycle: CustomComponentLifecycle = {
        getCurrentState(): CustomComponentLifecycleState {
          getCurrentStateCalled = true;
          return CustomComponentLifecycleState.APPEARED;
        },
        addObserver(obs: CustomComponentLifecycleObserver): void {
          addObserverCalled = true;
        },
        removeObserver(obs: CustomComponentLifecycleObserver): void {
          removeObserverCalled = true;
        }
      };

      let state = lifecycle.getCurrentState();
      AppStorage.setOrCreate<string>('lifecycleGetCurrentState', String(state));
      console.info('[ARKUI_NEW] LifecycleTestComp getCurrentState = ' + state);

      lifecycle.addObserver(observer);
      AppStorage.setOrCreate<string>('lifecycleAddObserver', addObserverCalled ? 'called' : 'notCalled');
      console.info('[ARKUI_NEW] LifecycleTestComp addObserver done, called=' + addObserverCalled);

      lifecycle.removeObserver(observer);
      AppStorage.setOrCreate<string>('lifecycleRemoveObserver', removeObserverCalled ? 'called' : 'notCalled');
      console.info('[ARKUI_NEW] LifecycleTestComp removeObserver done, called=' + removeObserverCalled);

      this.statusText = 'state:' + String(state);
    } catch (error) {
      this.statusText = 'error:' + error;
      AppStorage.setOrCreate<string>('lifecycleGetCurrentState', 'error:' + error);
      console.error('[ARKUI_NEW] LifecycleTestComp error: ' + error);
    }
  }

  onDidBuild() {
    AppStorage.setOrCreate<string>('lifecycleCompOnDidBuild', 'true');
    console.info('[ARKUI_NEW] LifecycleTestComp onDidBuild called');
  }

  build() {
    Text('Lifecycle: ' + this.statusText)
      .key('lifecycleTestComp').id('lifecycleTestComp').fontSize(14).margin({ top: 4 })
  }
}

@Entry
@Component
struct CustomComponentLifecycleIndex {
  @State pageStatus: string = 'init';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] CustomComponentLifecycleIndex error ' + error);
    }
  }

  onPageShow() {
    AppStorage.setOrCreate<string>('lifecyclePageShown', 'true');
    this.pageStatus = 'shown';
    console.info('[ARKUI_NEW] CustomComponentLifecycleIndex onPageShow done');
  }

  build() {
    Column() {
      Text('CustomComponentLifecycle Test Page')
        .key('lifecyclePageRoot').id('lifecyclePageRoot').fontSize(20).fontWeight(500)

      Text('Page Status: ' + this.pageStatus)
        .key('lifecyclePageStatus').id('lifecyclePageStatus').fontSize(12).margin({ top: 8 })

      LifecycleTestComp()

    }.width('100%').height('100%').padding(8)
  }
}
