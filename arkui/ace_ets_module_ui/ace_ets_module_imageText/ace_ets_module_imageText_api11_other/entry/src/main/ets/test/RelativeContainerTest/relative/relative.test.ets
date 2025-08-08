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
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function relativeCTest() {
  describe('relativeCTest', () => {
    beforeEach(async (done: Function) => {
      console.info("relativeCTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get relativeCTest state pages:" + JSON.stringify(pages));
        if (!("relative" == pages.name)) {
          console.info("get relativeCTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/relativecommon/relative"})
          await CommonFunc.sleep(2000);
          console.info("push relativeCTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push relativeCTest page error:" + err);
      }
      console.info("relativeCTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("relativeCTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_relativeCTest_0100
     * @tc.desc      test basis
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('relativeCTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[relativeCTest_0100] START');
      await CommonFunc.sleep(2000);
      let json = getInspectorByKey('row2common');
      console.info("relativeCTest_0100 json info " + JSON.stringify(json));
      let btRight = CommonFunc.getComponentRect('row1common');
      let right = btRight.right
      let btleft1 = CommonFunc.getComponentRect('row2common');
      let left1 = btleft1.left
      let diff = Math.round(left1 - right)
      expect(Math.abs((diff + Number("")) - (vp2px(100)+ Number(""))) <= 1).assertTrue();
      done();
    });

  })
}
