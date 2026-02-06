/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function TransitionEdgeTest() {
  describe('TransitionEdgeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TransitionEdgeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TransitionEdgeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TransitionEdgeTest state pages:' + JSON.stringify(pages));
        if (!('TransitionEdgeTest' == pages.name)) {
          console.info('get TransitionEdgeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TransitionEdgeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TransitionEdgeTest page error:' + err);
      }
      console.info('TransitionEdgeTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TransitionEdgeTest after each called');
    });

    /**
     * @tc.name   TransitionEdgeTest_001
     * @tc.number TransitionEdgeTest_001
     * @tc.desc   test TransitionEdge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TransitionEdgeTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[TransitionEdgeTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);

      expect(TransitionEdge.END).assertEqual(3);
      await driver.assertComponentExist(ON.id('imageId'));
      let btn1 = await driver.findComponent(ON.id('clickId'));
      await btn1.click();
      await driver.delayMs(1000);
      console.log("[TransitionEdgeTest_001] click btn1");
      await driver.delayMs(2000);

      let image = await driver.findComponent(ON.id('imageId'));
      expect(image).assertNull()

      let btn2 = await driver.findComponent(ON.id('clickId'));
      await btn2.click();
      await driver.delayMs(1000);
      console.log("[TransitionEdgeTest_001] click btn2");
      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.id('imageId'));
      done();
    });

    /**
     * @tc.name   SlideEffect_002
     * @tc.number SlideEffect_002
     * @tc.desc   Test Enumerated value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SlideEffect_002',  Level.LEVEL0, async (done: Function) => {
      console.info('SlideEffect_002 START');
      let driver = Driver.create();
      await driver.delayMs(1000);
      expect(SlideEffect.Left).assertEqual(1);
      expect(SlideEffect.Right).assertEqual(2);
      expect(SlideEffect.Top).assertEqual(3);
      expect(SlideEffect.Bottom).assertEqual(4);
      expect(SlideEffect.START).assertEqual(5);
      expect(SlideEffect.END).assertEqual(6);
      console.log('[SlideEffect_002] END');
      done();
    });
  })
}