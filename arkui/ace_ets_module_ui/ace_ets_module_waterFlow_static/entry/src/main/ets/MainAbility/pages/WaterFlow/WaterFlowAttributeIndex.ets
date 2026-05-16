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
  Text,
  WaterFlow,
  FlowItem,
  ItemFillPolicy
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct WaterFlowAttributeIndex {

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('WaterFlowAttributeIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // ---------- WaterFlowAttribute.columnsTemplate - string '1fr 1fr' ----------
        WaterFlow() {
          FlowItem() { Text('item 1').height('8%').width('100%') }
          FlowItem() { Text('item 2').height('10%').width('100%') }
          FlowItem() { Text('item 3').height('7%').width('100%') }
          FlowItem() { Text('item 4').height('9%').width('100%') }
        }
        .columnsTemplate('1fr 1fr')
        .key('waterFlowColTemplateStr')
        .height('20%')
        .width('100%')

        // ---------- WaterFlowAttribute.columnsTemplate - string '1fr 1fr 1fr' ----------
        WaterFlow() {
          FlowItem() { Text('item A').height('8%').width('100%') }
          FlowItem() { Text('item B').height('10%').width('100%') }
          FlowItem() { Text('item C').height('7%').width('100%') }
        }
        .columnsTemplate('1fr 1fr 1fr')
        .key('waterFlowColTemplate3fr')
        .height('20%')
        .width('100%')

        // ---------- WaterFlowAttribute.columnsTemplate - ItemFillPolicy ----------
        WaterFlow() {
          FlowItem() { Text('item X').height('8%').width('100%') }
          FlowItem() { Text('item Y').height('10%').width('100%') }
        }
        .columnsTemplate({ fillType: undefined } as ItemFillPolicy)
        .key('waterFlowColTemplateItemFill')
        .height('20%')
        .width('100%')

        // ---------- WaterFlowAttribute.columnsTemplate - undefined ----------
        WaterFlow() {
          FlowItem() { Text('item P').height('8%').width('100%') }
          FlowItem() { Text('item Q').height('10%').width('100%') }
        }
        .columnsTemplate(undefined)
        .key('waterFlowColTemplateUndefined')
        .height('20%')
        .width('100%')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
