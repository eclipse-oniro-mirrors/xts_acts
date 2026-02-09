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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY, UiDirection, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function getPinchAxisScaleValue() {
  describe('getPinchAxisScaleValueTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AxisEvent/getPinchAxisScaleValue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getPinchAxisScaleValueTest state pages: ' + JSON.stringify(pages));
        if (!('getPinchAxisScaleValue' == pages.name)) {
          console.info('get getPinchAxisScaleValueTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push getPinchAxisScaleValueTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getPinchAxisScaleValueTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreDragTest after each called');
    });

    /**
     * @tc.name   getPinchAxisScaleValueTest_0010
     * @tc.number getPinchAxisScaleValueTest_0010
     * @tc.desc   api axisPinch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getPinchAxisScaleValueTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('getPinchAxisScaleValueTest_0010 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      let center = await button.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[getPinchAxisScaleValueTest_0010] PreDrag: ' + JSON.stringify(obj));
      console.info('[getPinchAxisScaleValueTest_0010] PreDrag: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.content).assertEqual('axisPinch:0');
      console.info('[getPinchAxisScaleValueTest_0010] END');
      done();
    });

    /**
     * @tc.name   getPinchAxisScaleValueTest_0020
     * @tc.number getPinchAxisScaleValueTest_0020
     * @tc.desc   api getPinchAxisScaleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getPinchAxisScaleValueTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('getPinchAxisScaleValueTest_0020 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      let center = await button.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[getPinchAxisScaleValueTest_0020] PreDrag: ' + JSON.stringify(obj));
      console.info('[getPinchAxisScaleValueTest_0020] PreDrag: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.content).assertEqual('PinchAxisScaleValue:0');
      console.info('[getPinchAxisScaleValueTest_0020] END');
      done();
    });
  })
}