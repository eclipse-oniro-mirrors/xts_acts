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

import { expect, describe, it, afterEach, beforeEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import router from '@ohos.router';

export default function gestureNestScrollTest() {

  describe('gestureNestScrollTest', () => {

    beforeEach(async (done: Function) => {
      console.info("gestureNestScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gesturenestScroll/gestureNestScrollTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureNestScrollTest state pages:" + JSON.stringify(pages));
        if (!("gestureNestScrollTest" == pages.name)) {
          console.info("get gestureNestScrollTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info("push SwipeGestureExample03Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGestureExample03Test page error:" + err);
      }
      console.info("SwipeGestureExample03Test beforeEach end");
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE001
     * @tc.name       : testGestureNestScroll001
     * @tc.desc       : testing scene test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll001', 0, async (done: Function) => {
      let driver = Driver.create();
      await Utils.sleep(500);
      // inner list scroll
      let rect = Utils.getComponentRect("inner");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("gestureNestScrollTest  x= " +  x  + ", y = " + y);
      await driver.swipe(x, y, x, Math.round(y - vp2px(200)));
      await Utils.sleep(3000);
      console.info("test");
      let button = await driver.findComponent(ON.text('flowItem8'));
      expect(button != null).assertTrue();
      // outer scroll  scroll
      let recto = Utils.getComponentRect("outer");   
      let x0 = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(recto));
      let y0 = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(recto));
      console.info("gestureNestScrollTest  xo= " +  x0  + ", y = " + y0);
      await driver.swipe(x0, y0, x0 , Math.round(vp2px(50)));
      await Utils.sleep(3000);
      let button2 = await driver.findComponent(ON.text('flowItem11'));
      expect(button2 != null).assertTrue();
      done();
   
    });
   
    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE002
     * @tc.name       : testGestureNestScroll002
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll002', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter001()).assertEqual(0)
      done();
    });

     /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE003
     * @tc.name       : testGestureNestScroll003
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll003', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE004
     * @tc.name       : testGestureNestScroll004
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll004', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter003()).assertEqual(0)
      done();
    });

     /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE005
     * @tc.name       : testGestureNestScroll005
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll005', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE006
     * @tc.name       : testGestureNestScroll006
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll006', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter005()).assertEqual(0)
      done();
    });

     /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE007
     * @tc.name       : testGestureNestScroll007
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll007', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter006()).assertEqual(0)
      done();
    });

     /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE008
     * @tc.name       : testGestureNestScroll008
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll008', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter007()).assertEqual(0)
      done();
    });

     /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE009
     * @tc.name       : testGestureNestScroll009
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll009', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter008()).assertEqual(0)
      done();
    });
     /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURENESTSCROLL_GESTURE010
     * @tc.name       : testGestureNestScroll010
     * @tc.desc       : test parameter and return value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGestureNestScroll010', 0, async (done: Function) => {
      expect(nativeFunc.gestureTestParaMeter009()).assertEqual(0)
      done();
    });

  })
}
