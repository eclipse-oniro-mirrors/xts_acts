'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';

import { Driver, ON, MouseButton, Component, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test.ets';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function WaterFlowDraggingFlingTest() {
  describe('WaterFlowDraggingFlingTest', () => {
    const SLEEP_TIME_1000 = 1000;
    const SLEEP_TIME_2000 = 2000;
    beforeAll(async (): Promise<void> => {
      console.info('WaterFlowDraggingFlingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
    });
    beforeEach(async (): Promise<void> => {
      console.info('WaterFlowDraggingFlingTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get WaterFlowDraggingFlingTest state pages:' + JSON.stringify(pages));
        if (!('waterFlowDraggingFling' == pages.name)) {
          console.info('get  WaterFlowDraggingFlingTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/WaterFlow/waterFlowDraggingFling',
          });
          await CommonFunc.sleep(SLEEP_TIME_2000);
        }
      } catch (err) {
        console.error('push WaterFlowDraggingFlingTest page error:' + err);
      }
      console.info('WaterFlowDraggingFlingTest foreEach end');
    });

    /**
     * @tc.number   WaterFlowDraggingFling_static_0100
     * @tc.name     WaterFlowDraggingFling_static_0100
     * @tc.desc     WaterFlowDraggingFling_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowDraggingFling_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowDraggingFling_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create()
      let dragScroll = await driver.findComponent(ON.id('waterFlow_dragging_fling'));
      const rect = await (dragScroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info('WaterFlowDraggingFling_static_0100 value is' + left + ' --' + right + '--' + top + '--' + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe(Math.round(left + width / 2).toInt(), Math.round(top + height * 0.8).toInt(),
        Math.round(left + width / 2).toInt(), Math.round(top + height * 0.2).toInt(), 1000);
      await CommonFunc.sleep(SLEEP_TIME_2000);

      let strJson1 = inspector.getInspectorByKey('waterFlow_startDragging');
      let content1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')
      console.info('[WaterFlowDraggingFling_static_0100] content1: ' + JSON.stringify(content1));
      expect(content1).assertEqual('onWillStartDragging');

      let strJson2 = inspector.getInspectorByKey('waterFlow_stopDragging');
      let content2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')
      console.info('[WaterFlowDraggingFling_static_0100] content2: ' + JSON.stringify(content2));
      expect(content2).assertEqual('onDidStopDragging willFling: true');

      let strJson3 = inspector.getInspectorByKey('waterFlow_startFling');
      let content3 = JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')
      console.info('[WaterFlowDraggingFling_static_0100] content3: ' + JSON.stringify(content3));
      expect(content3).assertEqual('onWillStartFling');

      let strJson4 = inspector.getInspectorByKey('waterFlow_stopFling');
      let content4 = JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')
      console.info('[WaterFlowDraggingFling_static_0100] content4: ' + JSON.stringify(content4));
      expect(content4).assertEqual('onDidStopFling');

      let strJson5 = inspector.getInspectorByKey('waterFlow_willStopDragging');
      let content5 = JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')
      console.info('[WaterFlowDraggingFling_static_0100] content5: ' + JSON.stringify(content5));
      expect(content5).assertEqual('onWillStopDragging');
      console.info('[' + tagName + '] END============================');
      done();
    });

  })
}
