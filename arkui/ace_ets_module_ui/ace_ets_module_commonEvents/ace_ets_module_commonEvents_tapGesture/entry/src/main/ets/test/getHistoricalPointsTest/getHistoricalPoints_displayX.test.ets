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

export default function getHistoricalPoints_displayX() {
  describe('getHistoricalPoints_displayX', () => {
    beforeEach(async (done: Function) => {
      console.info('getHistoricalPoints_displayX beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getHistoricalPoints/getHistoricalPoints_displayX',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getHistoricalPoints_displayX state pages: ' + JSON.stringify(pages));
        if (!('getHistoricalPoints' == pages.name)) {
          console.info('get getHistoricalPoints_displayX state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push getHistoricalPoints_displayX success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getHistoricalPoints_displayX page error: ' + err);
        expect().assertFail();
      }
      done();
    });
/**
     * @tc.name   SUB_ARKUI_getHistoricalPoints_displayX_0100
     * @tc.number SUB_ARKUI_getHistoricalPoints_displayX_0100
     * @tc.desc   test the getCurrentLocalPositionTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_getHistoricalPoints_displayX_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[getHistoricalPoints_displayX_0100] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('button02'));
      let rect = await btn.getBounds();
      let centerX = Math.round((rect.left + rect.right) / 2);
      let centerY = Math.round((rect.top + rect.bottom) / 2);
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT);

      let strJsonX = getInspectorByKey('displayX');
      let objX: ESObject = JSON.parse(strJsonX);
      let strJsonY = getInspectorByKey('displayX');
      let objY: ESObject = JSON.parse(strJsonY);

      console.info('[getHistoricalPoints_displayX_0100] displayX is: ' + JSON.stringify(objX.$attrs.content));
      expect(JSON.stringify(objX.$attrs.content)).not().assertEqual('0');

      console.info('[getHistoricalPoints_displayX_0100] displayY is: ' + JSON.stringify(objY.$attrs.content));
      expect(JSON.stringify(objY.$attrs.content)).not().assertEqual('0');

      console.info('[getHistoricalPoints_displayX_0100] END');
      done();
    });
  })
}