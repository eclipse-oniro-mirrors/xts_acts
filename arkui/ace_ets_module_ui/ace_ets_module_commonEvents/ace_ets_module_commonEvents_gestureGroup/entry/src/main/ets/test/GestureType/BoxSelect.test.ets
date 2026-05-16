/*
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function BoxSelectTest() {

  describe('BoxSelectTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureType/BoxSelect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BoxSelectTest state pages: " + JSON.stringify(pages));
        if (!("BoxSelectTest" == pages.name)) {
          console.info("get BoxSelectTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push BoxSelectTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BoxSelectTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BoxSelectTest after each called");
    });

    /**
     * @tc.name   BoxSelectTest_0100
     * @tc.number BoxSelectTest_0100
     * @tc.desc   test BOX_SELECT_GESTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BoxSelectTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('BoxSelectTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let box = await driver.findComponent(ON.id('0'));
      let rect =await box.getBounds()
      let rectCenter =await box.getBoundsCenter()
      await driver.swipe(rect.right,rectCenter.y,rectCenter.x,rectCenter.y)
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('BOX_SELECT_GESTURE')).assertEqual(GestureControl.GestureType.BOX_SELECT_GESTURE);
      console.info('[BoxSelectTest_0100] END');
      done();
    });
  })
}