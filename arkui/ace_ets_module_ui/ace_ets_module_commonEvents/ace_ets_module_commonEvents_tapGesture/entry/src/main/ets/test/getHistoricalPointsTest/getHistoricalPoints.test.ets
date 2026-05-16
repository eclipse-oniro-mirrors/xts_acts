/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, ON, BY, MouseButton} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function getHistoricalPoints() {
  describe('getHistoricalPoints', () => {
    beforeEach(async (done: Function) => {
      console.info('getCurrentLocalPositionTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getHistoricalPoints/getHistoricalPoints',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getCurrentLocalPositionTest state pages: ' + JSON.stringify(pages));
        if (!('getHistoricalPoints' == pages.name)) {
          console.info('get getCurrentLocalPositionTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push getCurrentLocalPositionTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getCurrentLocalPositionTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });
/**
     * @tc.name   SUB_ARKUI_TouchEvent_getCurrentLocalPosition_0100
     * @tc.number SUB_ARKUI_TouchEvent_getCurrentLocalPosition_0100
     * @tc.desc   test the getCurrentLocalPositionTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TouchEvent_getCurrentLocalPosition_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[getCurrentLocalPositionTest_0100] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('button01'));
      let rect = await btn.getBounds();
      let centerX = Math.round((rect.left + rect.right) / 2);
      let centerY = Math.round((rect.top + rect.bottom) / 2);
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT);

      let strJsonX = getInspectorByKey('getHistoricalPointsX');
      let objX: ESObject = JSON.parse(strJsonX);
      let strJsonY = getInspectorByKey('getHistoricalPointsY');
      let objY: ESObject = JSON.parse(strJsonY);

      console.info('[getCurrentLocalPositionTest_0100] getHistoricalPointsX is: ' + JSON.stringify(objX.$attrs.content));
      expect(JSON.stringify(objX.$attrs.content)).not().assertEqual('0');

      console.info('[getCurrentLocalPositionTest_0100] getHistoricalPointsY is: ' + JSON.stringify(objY.$attrs.content));
      expect(JSON.stringify(objY.$attrs.content)).not().assertEqual('0');

      console.info('[getCurrentLocalPositionTest_0100] END');
      done();
    });
  })
}