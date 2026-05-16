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
import { Entry, Component, Column, Button, Text, Scroll } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ScrollableCommonMethodIndex {
  @State scrollBarColorStatus: string = 'init';

  private hasScrollableInspectorInfo(): boolean {
    try {
      return inspector.getInspectorByKey('scrollableCommonMethodTargetKey').length > 0;
    } catch (error) {
      return false;
    }
  }

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ScrollableCommonMethodIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Scroll() {
        Text('scrollable_common_content');
      }
      .id('scrollableCommonMethodTarget')
      .key('scrollableCommonMethodTargetKey')
      .scrollBarColor('#ff0000')
      .height('10%');
    }
    .width('100%')
    .height('100%');
  }
}
