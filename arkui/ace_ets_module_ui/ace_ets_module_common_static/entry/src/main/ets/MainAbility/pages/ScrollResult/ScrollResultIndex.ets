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
import { Entry, Component, Column, Button, Text, Scroll, ScrollResult } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ScrollResultIndex {
  @State setOffsetRemainStatus: string = 'init';
  @State getOffsetRemainStatus: string = 'init';
  @State offsetRemainValue: number = 0;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ScrollResultIndex aboutToAppear error: ' + error);
    }
  }

  private hasScrollInspectorInfo(): boolean {
    try {
      return inspector.getInspectorByKey('scrollResultTargetKey').length > 0;
    } catch (error) {
      return false;
    }
  }

  build() {
    Column() {
      Scroll() {
        Text('scroll_result_content')
          .height('500%');
      }
      .id('scrollResultTarget')
      .key('scrollResultTargetKey')
      .height('10%');

      Button('setOffsetRemain')
        .id('scrollResultSetOffsetRemainBtn')
        .height('8%')
        .onClick(() => {
          try {
            let scrollResult: ScrollResult = { offsetRemain: 0 };
            scrollResult.offsetRemain = 88;
            this.offsetRemainValue = scrollResult.offsetRemain;
            this.setOffsetRemainStatus = this.hasScrollInspectorInfo() && this.offsetRemainValue === 88 ?
              'setOffsetRemain_ok' : 'setOffsetRemain_fail';
          } catch (error) {
            this.setOffsetRemainStatus = 'setOffsetRemain_fail';
          }
        });
      Text(this.setOffsetRemainStatus).key('scrollResultSetOffsetRemainStatus').height('5%');

      Button('getOffsetRemain')
        .id('scrollResultGetOffsetRemainBtn')
        .height('8%')
        .onClick(() => {
          try {
            let scrollResult: ScrollResult = { offsetRemain: 66 };
            this.offsetRemainValue = scrollResult.offsetRemain;
            this.getOffsetRemainStatus = this.hasScrollInspectorInfo() && this.offsetRemainValue === 66 ?
              'getOffsetRemain_ok' : 'getOffsetRemain_fail';
          } catch (error) {
            this.getOffsetRemainStatus = 'getOffsetRemain_fail';
          }
        });
      Text(this.getOffsetRemainStatus).key('scrollResultGetOffsetRemainStatus').height('5%');
      Text(this.offsetRemainValue.toString()).key('scrollResultOffsetRemainValue').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
