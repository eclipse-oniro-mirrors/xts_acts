/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ToolBarItemTest() {
  describe('ToolBarItemTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolbar/ToolBarItem',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ToolBarItemTest state pages: ' + JSON.stringify(pages));
        if (!('ToolBarItem' == pages.name)) {
          console.info('get ToolBarItemTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push ToolBarItemTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ToolBarItemTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ToolBarItemTest after each called');
    });

    /**
     * @tc.name   ToolBarItemTest_0010
     * @tc.number ToolBarItemTest_0010
     * @tc.desc   test ToolBarItem add button on toolbar succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToolBarItemTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('ToolBarItemTest_0010 START');
      if (globalThis.winLeft != 0) {
        let strJson = getInspectorByKey('left');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ToolBarItemTest_0010] left: ' + JSON.stringify(obj.$attrs.label));
        expect(obj.$attrs.label).assertEqual('left');

        strJson = getInspectorByKey('right');
        obj = JSON.parse(strJson);
        console.info('[ToolBarItemTest_0010] right: ' + JSON.stringify(obj.$attrs.label));
        expect(obj.$attrs.label).assertEqual('right');
      }
      console.info('[ToolBarItemTest_0010] END');
      done();
    });

    /**
     * @tc.name   ToolBarItemTest_0020
     * @tc.number ToolBarItemTest_0020
     * @tc.desc   test ToolBarItemPlacement setting succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToolBarItemTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('ToolBarItemTest_0020 START');
      if (globalThis.winLeft != 0) {
        let driver: Driver = Driver.create();
        let leftButton: Component = await driver.findComponent(ON.id('left'));
        let leftPoint = await leftButton.getBoundsCenter();
        let rightButton: Component = await driver.findComponent(ON.id('right'));
        let rightPoint = await rightButton.getBoundsCenter();
        console.info('[ToolBarItemTest_0020] left: ' ,leftPoint.x);
        console.info('[ToolBarItemTest_0020] right: ',rightPoint.x);
        expect(rightPoint.x).assertLarger(leftPoint.x);
      }
      console.info('[ToolBarItemTest_0020] END');
      done();
    });
  })
}