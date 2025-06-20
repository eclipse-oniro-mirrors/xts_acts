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

import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so';

export default function gesturecancelTest() {

  describe('gesturecancelTest', () => {

    beforeEach(async (done: Function) => {
      console.info("gesturecancelTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gestureCancel/gestureCancel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureCancel state pages:" + JSON.stringify(pages));
        if (!("gestureCancel" == pages.name)) {
          console.info("get gestureCancel pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info("push gestureCancel page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureCancel page error:" + err);
      }
      console.info("gestureCancel beforeEach end");
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURCANCEL_GESTURE001
     * @tc.name       : testGestureCancelTest001
     * @tc.desc       : testing Gesture test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureCancelTest001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      await Utils.sleep(500);
      // inner list scroll
      let rect = Utils.getComponentRect("inner");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      // the visual list height is vp2px(200)
      let y = Math.round(globalThis.winTop + rect.top + vp2px(100));
      console.info("testGestureCancelTest001  x= " +  x  + ", y = " + y);
      await driver.swipe(x, y, x, Math.round(y - vp2px(200)));
      await Utils.sleep(2000);
       // test the callbackData;
      let object1:ESObject = nativeRender.GetTouchEventData();
      console.info("testGestureCancelTest00_" + object1.scrollCount);
      console.info("testGestureCancelTest00_" + object1.columnCount);

      expect(object1.scrollCount >= object1.columnCount).assertTrue();
      done();
   
    });

  })
}
