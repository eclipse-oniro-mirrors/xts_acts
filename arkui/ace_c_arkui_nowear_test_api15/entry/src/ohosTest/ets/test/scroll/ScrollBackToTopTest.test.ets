/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, afterEach, expect,  Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';
import { Component, On, MouseButton } from '@kit.TestKit';

export default function scrollBackToTopTest() {
    console.info('push page export');
  describe('scrollBackToTopTest', () => {
    console.info('push page trying');
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   testScrollBackToTop001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_TOP_0100
     * @tc.desc   testing scroll back to top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBackToTop001',  Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollBackToTopTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`,() => setTimeout(() => {}, 1000));
      console.info('push page success');
      await Utils.sleep(2000);
      let driverGrid: Driver = Driver.create();
      let driver = Driver.create();
      console.info('create driver success');
      let grid: Component = await driverGrid.findComponent(ON.id('Grid1'));
      console.info('grid1 id find success');
      let rect = await grid.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("GridScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let topButton: Component = await driver.findComponent(ON.id('Top'));
      console.info('qwer1');
      let GridButton: Component = await driver.findComponent(ON.id('GridTop'));
      console.info('qwer2');
      let ListButton: Component = await driver.findComponent(ON.id('ListTop'));
      console.info('qwer3');
      let WaterFlowButton: Component = await driver.findComponent(ON.id('Scroll/FlowTop'));
      console.info('qwer4');
      await Utils.sleep(2000)
      console.info('qwer5');
      // await driverGrid.swipe event
      await driverGrid.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      await Utils.sleep(1500)
      await ListButton.click();
      await GridButton.click();
      await WaterFlowButton.click();
      await Utils.sleep(1000)
      await topButton.click();
      await Utils.sleep(1000)
      await ListButton.click();
      await GridButton.click();
      await WaterFlowButton.click();
      await topButton.click();
      await Utils.sleep(1000)
      
      let strJson1 = getInspectorByKey('gridBackMessage');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('asdf1');
      let strJson2 = getInspectorByKey('listBackMessage');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('asdf2');
      let strJson3 = getInspectorByKey('scroll1BackMessage');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('asdf3');
      let strJson4 = getInspectorByKey('scroll7BackMessage');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('asdf4');
      let strJson5 = getInspectorByKey('waterFlowBackMessage');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info('asdf5');
      // assertEqual scroll back to top event
      expect(obj1.$attrs.content).assertEqual('onGridBack');
      expect(obj2.$attrs.content).assertEqual('onListBack');
      expect(obj3.$attrs.content).assertEqual('onScroll1Back');
      expect(obj4.$attrs.content).assertEqual('onScroll7Back');
      expect(obj5.$attrs.content).assertEqual('onWaterFlowBack');
      done();
    })
  })
}