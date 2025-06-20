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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function waterFlow5Jsunit() {
  describe('waterFlow5Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlow5Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow5",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlow5Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow5" == pages.name)) {
          console.info("get waterFlow5Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlow5Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlow5Jsunit page error:" + err);
      }
      console.info("waterFlow5Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow5Jsunit after each called");
    });

    /**
     * @tc.number    waterFlow5Jsunit_001
     * @tc.name      waterFlow5Jsunit_001
     * @tc.desc      Add and delete data to waterFlow component
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('waterFlow5Jsunit_001', 0, async (done: Function) => {
      console.info('[waterFlow5Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('flowItem_hei');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlow5Jsunit_001] component obj is: " + JSON.stringify(obj));
      console.info("[waterFlow5Jsunit_001] content: " + JSON.stringify(obj.$attrs.height));
	  let heightStr:string = obj.$attrs.height.slice(0,6)
      console.info("[waterFlow5Jsunit_001] heightStr: " + heightStr);
      expect(Math.abs(Math.round(Number(heightStr)) - Math.round(vp2px(100))) <= 1).assertTrue();
      console.info('[waterFlow5Jsunit_001] END');
      done();
    });
  })
}
