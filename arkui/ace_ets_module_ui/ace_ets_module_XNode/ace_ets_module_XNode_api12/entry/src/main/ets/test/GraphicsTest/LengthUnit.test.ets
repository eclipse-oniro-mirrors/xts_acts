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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function LengthUnitTest() {
  describe('LengthUnitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LengthUnitTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/LengthUnit",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LengthUnitTest state pages:" + JSON.stringify(pages));
        if (!("LengthUnitTest" == pages.name)) {
          console.info("get LengthUnitTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LengthUnitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LengthUnitTest page error:" + err);
      }
      console.info("LengthUnitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LengthUnitTest after each called");
    });

    /**
     * @tc.number    LengthUnitTest_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('LengthUnitTest_001', 0, async (done: Function) => {
      console.info('[LengthUnitTest_001] START');
      await CommonFunc.sleep(1000);
      let span_px = getInspectorByKey('span_px');
      console.info('span_px log-----' + JSON.parse(span_px).$attrs.baselineOffset);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(span_px).$attrs.baselineOffset).assertEqual('20.00px');
      console.info('[LengthUnitTest_001] END');
      done();
    });

    /**
     * @tc.number    LengthUnitTest_002
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('LengthUnitTest_002', 0, async (done: Function) => {
      console.info('[LengthUnitTest_002] START');
      await CommonFunc.sleep(1000);
      let span_fp = getInspectorByKey('span_fp');
      console.info('span_fp log-----' + JSON.parse(span_fp).$attrs.baselineOffset);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(span_fp).$attrs.baselineOffset).assertEqual('20.00fp');
      console.info('[LengthUnitTest_002] END');
      done();
    });

    /**
     * @tc.number    LengthUnitTest_003
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('LengthUnitTest_003', 0, async (done: Function) => {
      console.info('[LengthUnitTest_003] START');
      await CommonFunc.sleep(1000);
      let span_percent = getInspectorByKey('span_percent');
      console.info('span_percent log-----' + JSON.parse(span_percent).$attrs.baselineOffset);
      console.info('span_percent attrs-----' + JSON.parse(span_percent).$attrs);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(span_percent).$attrs.baselineOffset).assertEqual('0.00px');
      console.info('[LengthUnitTest_003] END');
      done();
    });

    /**
     * @tc.number    LengthUnitTest_004
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('LengthUnitTest_004', 0, async (done: Function) => {
      console.info('[LengthUnitTest_004] START');
      await CommonFunc.sleep(1000);
      let span_lpx = getInspectorByKey('span_lpx');
      console.info('span_lpx log-----' + JSON.parse(span_lpx).$attrs.baselineOffset);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(span_lpx).$attrs.baselineOffset).assertEqual('20.00lpx');
      console.info('[LengthUnitTest_004] END');
      done();
    });
  })
}
