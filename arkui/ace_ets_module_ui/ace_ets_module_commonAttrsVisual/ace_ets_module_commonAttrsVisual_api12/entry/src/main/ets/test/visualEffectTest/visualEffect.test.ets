/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function visualEffectTest() {
  describe('visualEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("visualEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visualEffect/visualEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get visualEffectTest state pages: " + JSON.stringify(pages));
        if (!("visualEffect" == pages.name)) {
          console.info("get visualEffectTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push visualEffectTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push visualEffectTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   visualEffectTest_0100
     * @tc.number visualEffectTest_0100
     * @tc.desc   api: visualEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('visualEffectTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('visualEffectTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('visualEffect_text');
      console.log('visualEffectTest_0100', JSON.parse(strJson).$attrs)
      console.log('visualEffectTest_0100', JSON.parse(strJson).$attrs.visualEffect)
      expect(JSON.parse(strJson).$attrs.visualEffect).assertEqual(undefined);
      console.info('visualEffectTest_0100 END');
      done();
    });

    /**
     * @tc.name   foregroundFilterTest_0200
     * @tc.number foregroundFilterTest_0200
     * @tc.desc   api: foregroundFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foregroundFilterTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('foregroundFilterTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('foregroundFilter_text');
      console.log('foregroundFilterTest_0200', JSON.parse(strJson).$attrs)
      console.log('foregroundFilterTest_0200', JSON.parse(strJson).$attrs.foregroundFilter)
      expect(JSON.parse(strJson).$attrs.foregroundFilter).assertEqual(undefined);
      console.info('foregroundFilterTest_0200 END');
      done();
    });

    /**
     * @tc.name   backgroundFilterTest_0300
     * @tc.number backgroundFilterTest_0300
     * @tc.desc   api: backgroundFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backgroundFilterTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('backgroundFilterTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundFilter_text');
      console.log('backgroundFilterTest_0300', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.backgroundFilter).assertEqual(undefined);
      console.info('backgroundFilterTest_0300 END');
      done();
    });

    /**
     * @tc.name   compositingFilterTest_0400
     * @tc.number compositingFilterTest_0400
     * @tc.desc   api: compositingFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('compositingFilterTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('compositingFilterTest_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('compositingFilter_text');
      console.log('compositingFilterTest_0400', JSON.parse(strJson).$attrs)
      console.log('compositingFilterTest_0400', JSON.parse(strJson).$attrs.compositingFilter)
      expect(JSON.parse(strJson).$attrs.compositingFilter).assertEqual(undefined);
      console.info('compositingFilterTest_0400 END');
      done();
    });
  })
}
