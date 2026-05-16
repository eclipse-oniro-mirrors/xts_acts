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
import { CustomComponentLifecycleState, CustomComponentInvokeOptions } from '@ohos.arkui.component';

@ComponentV2
struct ChildV2Comp {
  aboutToAppear() {
    AppStorage.setOrCreate<string>('childV2AboutToAppear', 'true');
    console.info('[ARKUI_NEW] ChildV2Comp aboutToAppear called');
  }

  onDidBuild() {
    AppStorage.setOrCreate<string>('childV2OnDidBuild', 'true');
    console.info('[ARKUI_NEW] ChildV2Comp onDidBuild called');
  }

  build() {
    Text('ChildV2 Component')
      .key('childV2Comp').id('childV2Comp').fontSize(14)
  }
}

@Entry
@Component
struct CustomComponentIndex {
  @State lifecycleInitVal: string = 'pending';
  @State lifecycleAppearedVal: string = 'pending';
  @State lifecycleBuiltVal: string = 'pending';
  @State lifecycleRecycledVal: string = 'pending';
  @State lifecycleDisappearedVal: string = 'pending';
  @State invokeOptionsVal: string = 'pending';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] CustomComponentIndex error ' + error);
    }
  }

  onPageShow() {
    try {
      this.lifecycleInitVal = String(CustomComponentLifecycleState.INIT);
      AppStorage.setOrCreate<string>('lifecycleStateInit', this.lifecycleInitVal);

      this.lifecycleAppearedVal = String(CustomComponentLifecycleState.APPEARED);
      AppStorage.setOrCreate<string>('lifecycleStateAppeared', this.lifecycleAppearedVal);

      this.lifecycleBuiltVal = String(CustomComponentLifecycleState.BUILT);
      AppStorage.setOrCreate<string>('lifecycleStateBuilt', this.lifecycleBuiltVal);

      this.lifecycleRecycledVal = String(CustomComponentLifecycleState.RECYCLED);
      AppStorage.setOrCreate<string>('lifecycleStateRecycled', this.lifecycleRecycledVal);

      this.lifecycleDisappearedVal = String(CustomComponentLifecycleState.DISAPPEARED);
      AppStorage.setOrCreate<string>('lifecycleStateDisappeared', this.lifecycleDisappearedVal);

      let opts: CustomComponentInvokeOptions = {};
      this.invokeOptionsVal = (opts.sClass != null && opts.sClass != undefined) ? 'defined' : 'undefined';
      AppStorage.setOrCreate<string>('invokeOptionsResult', this.invokeOptionsVal);

      console.info('[ARKUI_NEW] CustomComponentIndex onPageShow done');
    } catch (error) {
      console.error('[ARKUI_NEW] CustomComponentIndex onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Text('CustomComponent Test Page')
        .key('customCompRoot').id('customCompRoot').fontSize(20).fontWeight(500)

      ChildV2Comp()

      Text('INIT=' + this.lifecycleInitVal + ' APPEARED=' + this.lifecycleAppearedVal)
        .key('ccLifecycleState1').id('ccLifecycleState1').fontSize(12).margin({ top: 8 })

      Text('BUILT=' + this.lifecycleBuiltVal + ' RECYCLED=' + this.lifecycleRecycledVal)
        .key('ccLifecycleState2').id('ccLifecycleState2').fontSize(12).margin({ top: 4 })

      Text('DISAPPEARED=' + this.lifecycleDisappearedVal)
        .key('ccLifecycleState3').id('ccLifecycleState3').fontSize(12).margin({ top: 4 })

      Text('InvokeOptions.sClass=' + this.invokeOptionsVal)
        .key('ccInvokeOptions').id('ccInvokeOptions').fontSize(12).margin({ top: 4 })

      Button('CustomComponentV2 Page')
        .key('ccPageBtn').id('ccPageBtn')
        .fontSize(14).width('80%').margin({ top: 10 })
    }.width('100%').height('100%').padding(8)
  }
}
