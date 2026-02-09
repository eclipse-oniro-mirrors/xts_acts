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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeGuideLine5() {
  describe('RelativeGuideLine5', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeGuideLine5 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeGuideLine5 state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine5" == pages.name)) {
          console.info("get  RelativeGuideLine5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine5"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeGuideLine5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeGuideLine5 page error:" + err);
      }
      console.info("RelativeGuideLine5 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine5 after each called");
    });


    /**
     * @tc.name   RelativeGuideLine5_001
     * @tc.number RelativeGuideLine5_001
     * @tc.desc   RelativeGuideLine5_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeGuideLine5_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine5_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey("RelButton5");
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[RelativeGuideLine5_001] obj is: " + JSON.stringify(obj.$attrs.height) + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.height=='100.00vp').assertTrue();
      expect(obj.$attrs.width=='100.00vp').assertTrue();

      console.info('[RelativeGuideLine5_001] END');
      done();
    });
  })
}
