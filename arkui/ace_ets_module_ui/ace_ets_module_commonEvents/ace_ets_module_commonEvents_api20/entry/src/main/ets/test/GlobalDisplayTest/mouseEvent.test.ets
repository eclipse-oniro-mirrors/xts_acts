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
import {UiComponent, UiDriver, Component, Driver, ON, BY, MouseButton} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function mouseEventTest() {
  describe('mouseEventTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GlobalDisplay/mouseEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get mouseEventTest state pages: ' + JSON.stringify(pages));
        if (!('mouseEvent' == pages.name)) {
          console.info('get mouseEventTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push mouseEventTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push mouseEventTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('mouseEventTest after each called');
    });

    /**
     * @tc.name   mouseEventTest_0010
     * @tc.number mouseEventTest_0010
     * @tc.desc   mouseEvent get globalDisplay coordinates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('mouseEventTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[mouseEventTest_0010] START');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('button'));
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);

      let strJsonX = getInspectorByKey('globalDisplayX');
      let objX: ESObject = JSON.parse(strJsonX);
      let strJsonY = getInspectorByKey('globalDisplayY');
      let objY: ESObject = JSON.parse(strJsonY);

      console.info('[mouseEventTest_0010] globalDisplayX is: ' + JSON.stringify(objX.$attrs.content));
      expect(JSON.stringify(objX.$attrs.content)).not().assertEqual('0');

      console.info('[mouseEventTest_0010] globalDisplayY is: ' + JSON.stringify(objY.$attrs.content));
      expect(JSON.stringify(objY.$attrs.content)).not().assertEqual('0');

      console.info('[mouseEventTest_0010] END');
      done();
    });
  })
}