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

'use static';

import { Column, ColumnOptions, Button, Text, WaterFlow, FlowItem, Entry, Component } from '@ohos.arkui.component';
import { typeNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[WaterFlowAttr]';

@Entry
@Component
struct WaterFlowAttrTestPage {
  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('waterFlow syncLoad + UIWaterFlowEvent')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('wfAttr_title');
      Button('wire getWaterFlowEvent')
        .id('wfAttr_wire')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          this.wire(this.getUIContext());
        });
      WaterFlow() {
        FlowItem() {
          Text('cell').fontSize(9).height('5%');
        }
      }
      .columnsTemplate('1fr')
      .syncLoad(true)
      .height('16%')
      .width('100%')
      .id('wfAttr_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }

  private wire(ctx: UIContext): void {
    try {
      const n = ctx.getFrameNodeById('wfAttr_body');
      if (n) {
        const ev = typeNode.getWaterFlowEvent(n);
        ev?.setOnWillScroll(() => {});
        ev?.setOnDidScroll(() => {});
        ev?.setOnScrollIndex(() => {});
      }
      AppStorage.setOrCreate<boolean>('wfAttr_wire', true);
    } catch (e) {
      console.error(`${LOG_TAG} ${e}`);
      AppStorage.setOrCreate<boolean>('wfAttr_wire', false);
    }
  }
}
