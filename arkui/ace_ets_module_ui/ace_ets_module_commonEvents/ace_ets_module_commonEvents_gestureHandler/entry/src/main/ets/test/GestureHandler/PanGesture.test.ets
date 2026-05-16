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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PanGestureHandlerTest() {

  describe('PanGestureHandlerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/PanGestureHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGestureHandler state pages: " + JSON.stringify(pages));
        if (!("PanGestureHandler" == pages.name)) {
          console.info("get PanGestureHandler state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PanGestureHandler success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGestureHandler page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PanGestureHandler after each called");
    });

    /**
     * @tc.name   PanGestureHandler_0010
     * @tc.number PanGestureHandler_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGestureHandler_0010', Level.LEVEL0, async (done: Function) => {
      console.info('PanGestureHandler_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureHandlerColumn');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(colum.left + (colum.right - colum.left) / 2), Math.round((top + bottom) / 2), Math.round(colum.right), Math.round((top + bottom) / 2))
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PanGestureHandler1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('pan succ');
      console.info('[PanGestureHandler_0010] END');
      done();
    });
  })
}