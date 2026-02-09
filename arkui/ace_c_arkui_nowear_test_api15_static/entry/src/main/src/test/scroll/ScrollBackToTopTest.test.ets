'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, afterEach, expect,  Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { Component } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
let libUtil: LibUtil = new LibUtil();

export default function scrollBackToTopTest() {
    console.info('push page export');
  describe('scrollBackToTopTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_nowear_api15_static", "EntryAbility")
    });
    console.info('push page trying');
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   testScrollBackToTop001
     * @tc.name     testScrollBackToTop001
     * @tc.desc     testScrollBackToTop001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBackToTop001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollBackToTopTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`,false);
      console.info('push page success');
      await Utils.sleep(2000);
      let driverGrid: Driver = Driver.create();
      let driver = Driver.create();
      console.info('create driver success');
      let grid: Component | null = await driverGrid.findComponent(ON.id('Grid1'));
      console.info('grid1 id find success');
      let rect = await (grid?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("GridScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let topButton: Component | null = await driver.findComponent(ON.id('Top'));
      console.info('qwer1');
      let GridButton: Component | null = await driver.findComponent(ON.id('GridTop'));
      console.info('qwer2');
      let ListButton: Component | null = await driver.findComponent(ON.id('ListTop'));
      console.info('qwer3');
      let WaterFlowButton: Component | null = await driver.findComponent(ON.id('Scroll/FlowTop'));
      console.info('qwer4');
      await Utils.sleep(2000)
      console.info('qwer5');
      // await driverGrid.swipe event
      await driverGrid.swipe(
        (Math.round(left + width * 0.2)).toInt(),
        (Math.round(bottom - height / 4)).toInt(),
        (Math.round(left + width * 0.2)).toInt(),
        (Math.round(bottom - height / 2)).toInt()
      );
      await Utils.sleep(1500)
      await (ListButton?.click() as Promise<void>);
      await (GridButton?.click() as Promise<void>);
      await (WaterFlowButton?.click() as Promise<void>);
      await Utils.sleep(1000)
      await (topButton?.click() as Promise<void>);
      await Utils.sleep(1000)
      await (ListButton?.click() as Promise<void>);
      await (GridButton?.click() as Promise<void>);
      await (WaterFlowButton?.click() as Promise<void>);
      await (topButton?.click() as Promise<void>);
      await Utils.sleep(1000)
      
      let strJson1 = inspector.getInspectorByKey('gridBackMessage');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('asdf1');
      let strJson2 = inspector.getInspectorByKey('listBackMessage');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('asdf2');
      let strJson3 = inspector.getInspectorByKey('scroll1BackMessage');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('asdf3');
      let strJson4 = inspector.getInspectorByKey('scroll7BackMessage');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('asdf4');
      let strJson5 = inspector.getInspectorByKey('waterFlowBackMessage');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info('asdf5');
      // assertEqual scroll back to top event
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onGridBack');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onListBack');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onScroll1Back');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('onScroll7Back');
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('onWaterFlowBack');
      done();
    })
  })
}