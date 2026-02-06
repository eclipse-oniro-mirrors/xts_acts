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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function RectResourceTest() {
  describe('RectResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RectResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Rect/RectResource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectResource state pages: " + JSON.stringify(pages));
        if (!("RectResourceTest" == pages.name)) {
          console.info("get RectResource state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RectResource success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectResource page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   RectResourceTest_0100
     * @tc.number SUB_ARKUI_API_RectResourceTest_0100
     * @tc.desc   RectAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RectResourceTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[RectResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey("RectResource1");
      console.info("[RectResourceTest_0100] width1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.width));
      console.info("[RectResourceTest_0100] height1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.height));
      console.info("[RectResourceTest_0100] radiusHeight1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.radiusHeight));
      console.info("[RectResourceTest_0100] radiusWidth1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.radiusWidth));

      let strJson2 = getInspectorByKey("RectResource2");
      console.info("[RectResourceTest_0100] width2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.width));
      console.info("[RectResourceTest_0100] height2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.height));
      console.info("[RectResourceTest_0100] radius2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.radius));


      let strJson3 = getInspectorByKey("RectResource3");
      console.info("[RectResourceTest_0100] width3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.width));
      console.info("[RectResourceTest_0100] height3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.height));
      console.info("[RectResourceTest_0100] radiusHeight3 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.radiusHeight));
      console.info("[RectResourceTest_0100] radiusWidth3 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.radiusWidth));


      let strJson4 = getInspectorByKey("RectResource4");
      console.info("[RectResourceTest_0100] width4 is: " + JSON.stringify(JSON.parse(strJson4).$attrs.width));
      console.info("[RectResourceTest_0100] height4 is: " + JSON.stringify(JSON.parse(strJson4).$attrs.height));
      console.info("[RectResourceTest_0100] radius4 is: " + JSON.stringify(JSON.parse(strJson4).$attrs.radius));

      expect(JSON.parse(strJson1).$attrs.width).assertEqual(JSON.parse(strJson3).$attrs.width);
      expect(JSON.parse(strJson1).$attrs.height).assertEqual(JSON.parse(strJson3).$attrs.height);
      expect(JSON.parse(strJson1).$attrs.radiusHeight).assertEqual(JSON.parse(strJson3).$attrs.radiusHeight);
      expect(JSON.parse(strJson1).$attrs.radiusWidth).assertEqual(JSON.parse(strJson3).$attrs.radiusWidth);

      expect(JSON.parse(strJson2).$attrs.width).assertEqual(JSON.parse(strJson4).$attrs.width);
      expect(JSON.parse(strJson2).$attrs.height).assertEqual(JSON.parse(strJson4).$attrs.height);
      expect(JSON.parse(strJson2).$attrs.radius).assertEqual(JSON.parse(strJson4).$attrs.radius);
    
      console.info('[RectResourceTest_0100] END');
      done();
    });
  })
}

