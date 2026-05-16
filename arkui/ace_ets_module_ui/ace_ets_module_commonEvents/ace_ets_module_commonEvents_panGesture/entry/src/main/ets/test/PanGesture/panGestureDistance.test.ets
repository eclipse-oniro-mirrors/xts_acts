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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function panGestureDistanceTest() {

  describe('panGestureDistanceTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/panGestureDistance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panGesture state pages: " + JSON.stringify(pages));
        if (!("panGesture" == pages.name)) {
          console.info("get panGesture state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push panGesture success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panGesture page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("panGesture after each called");
    });

    /**
     * @tc.name   panGesture_panRecognizer_getDistance_0010
     * @tc.number panGesture_panRecognizer_getDistance_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('panGesture_panRecognizer_getDistance_0010', Level.LEVEL0, async (done: Function) => {
      console.info('panGesture_panRecognizer_getDistance_0010 START');
      let gridRect = CommonFunc.getComponentRectOnScreen('getDistance')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`)
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`)
        }, 5, 4000);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('distance1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[panGesture_panRecognizer_getDistance_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('5');
      console.info('[panGesture_panRecognizer_getDistance_0010] END');
      done();
    });

    /**
     * @tc.name   panGesture_panRecognizer_getDistance_0020
     * @tc.number panGesture_panRecognizer_getDistance_0020
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('panGesture_panRecognizer_getDistance_0020', Level.LEVEL0, async (done: Function) => {
      console.info('panGesture_panRecognizer_getDistance_0020 START');
      let gridRect = CommonFunc.getComponentRectOnScreen('getDistance')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`)
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`)
        }, 5, 4000);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('map');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[panGesture_panRecognizer_getDistance_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('5');
      console.info('[panGesture_panRecognizer_getDistance_0020] END');
      done();
    });

    /**
     * @tc.name   panGesture_panRecognizer_getDistance_0030
     * @tc.number panGesture_panRecognizer_getDistance_0030
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('panGesture_panRecognizer_getDistance_0030', Level.LEVEL0, async (done: Function) => {
      console.info('panGesture_panRecognizer_getDistance_0030 START');
      let gridRect = CommonFunc.getComponentRectOnScreen('modifierGetDistance')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`)
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`)
        }, 5, 4000);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('modifierMap');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[panGesture_panRecognizer_getDistance_0030] component obj is: " + JSON.stringify(obj));
      console.info("[SwipeGesture1_0300] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('5');
      console.info('[panGesture_panRecognizer_getDistance_0030] END');
      done();
    });
  })
}