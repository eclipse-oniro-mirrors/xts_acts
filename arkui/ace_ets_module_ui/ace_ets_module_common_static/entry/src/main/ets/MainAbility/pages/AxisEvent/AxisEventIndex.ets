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
import { Entry, Component, Column, Scroll, Text, AxisEvent, AxisType } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct AxisEventIndex {
  @State hasAxisStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('AxisEventIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('item_0').width('100%').height('15%');
          Text('item_1').width('100%').height('15%');
          Text('item_2').width('100%').height('15%');
          Text('item_3').width('100%').height('15%');
          Text('item_4').width('100%').height('15%');
          Text('item_5').width('100%').height('15%');
          Text('item_6').width('100%').height('15%');
          Text('item_7').width('100%').height('15%');
          Text('item_8').width('100%').height('15%');
          Text('item_9').width('100%').height('15%');
        }
      }
      .id('axisEventList')
      .width('100%')
      .height('30%')
      .onAxisEvent((event: AxisEvent) => {
        try {
          this.hasAxisStatus = event.hasAxis(AxisType.VERTICAL_AXIS) ? 'hasAxis_ok' : 'hasAxis_fail';
        } catch (error) {
          this.hasAxisStatus = 'hasAxis_fail';
        }
      });

      Text(this.hasAxisStatus).key('axisEventHasAxisStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
