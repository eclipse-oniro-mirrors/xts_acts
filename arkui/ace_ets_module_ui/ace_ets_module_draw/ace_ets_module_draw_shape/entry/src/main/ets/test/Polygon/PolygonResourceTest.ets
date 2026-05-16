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
export default function PolygonResourceTest() {
  describe('PolygonResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PolygonResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Polygon/PolygonResource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PolygonResourceTest state pages: " + JSON.stringify(pages));
        if (!("PolygonResourceTest" == pages.name)) {
          console.info("get PolygonResourceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PolygonResourceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PolygonResourceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   PolygonResourceTest_0100
     * @tc.number SUB_ARKUI_API_PolygonResourceTest_0100
     * @tc.desc   PolygonAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PolygonResourceTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[PolygonResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey("PolygonResource1");
      console.info("[PolygonResourceTest_0100] width1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.width));
      console.info("[CircleResourceTest_0100] height1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.height));

      let strJson2 = getInspectorByKey("PolygonResource2");
      console.info("[PolygonResourceTest_0100] width2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.width));
      console.info("[PolygonResourceTest_0100] height2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.height));

      let strJson3 = getInspectorByKey("PolygonResource3");
      console.info("[PolygonResourceTest_0100] width3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.width));
      console.info("[PolygonResourceTest_0100] height3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.height));
      
      expect(JSON.parse(strJson1).$attrs.width).assertEqual(JSON.parse(strJson2).$attrs.width);
      expect(JSON.parse(strJson1).$attrs.height).assertEqual(JSON.parse(strJson2).$attrs.height);
      expect(JSON.parse(strJson1).$attrs.width).assertEqual(JSON.parse(strJson3).$attrs.width);
      expect(JSON.parse(strJson1).$attrs.height).assertEqual(JSON.parse(strJson3).$attrs.height);
    
      console.info('[PolygonResourceTest_0100] END');
      done();
    });
  })
}

