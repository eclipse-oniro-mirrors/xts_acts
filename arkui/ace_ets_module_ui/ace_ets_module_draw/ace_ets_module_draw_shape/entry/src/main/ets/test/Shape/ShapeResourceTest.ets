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
export default function ShapeResourceTest() {
  describe('ShapeResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ShapeResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Shape/ShapeResource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShapeResource state pages: " + JSON.stringify(pages));
        if (!("ShapeResource" == pages.name)) {
          console.info("get ShapeResource state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ShapeResource success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeResource page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ShapeResourceTest_0100
     * @tc.number SUB_ARKUI_API_ShapeResourceTest_0100
     * @tc.desc   ShapeAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ShapeResourceTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ShapeResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey("ShapeResource1");

      console.info("[ShapeResourceTest_0100] viewPort_x1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.viewPort.x));
      console.info("[ShapeResourceTest_0100] viewPort_y1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.viewPort.y));
      console.info("[ShapeResourceTest_0100] viewPort_width1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.viewPort.width));
      console.info("[ShapeResourceTest_0100] viewPort_height1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.viewPort.height));
      console.info("[ShapeResourceTest_0100] fill1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.fill));
      console.info("[ShapeResourceTest_0100] stroke1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.stroke));
      console.info("[ShapeResourceTest_0100] strokeMiterLimit1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.strokeMiterLimit));
      console.info("[ShapeResourceTest_0100] strokeWidth1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.strokeWidth));
      
      let strJson2 = getInspectorByKey("ShapeResource2");

      console.info("[ShapeResourceTest_0100] viewPort_x2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.viewPort.x));
      console.info("[ShapeResourceTest_0100] viewPort_y2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.viewPort.y));
      console.info("[ShapeResourceTest_0100] viewPort_width2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.viewPort.width));
      console.info("[ShapeResourceTest_0100] viewPort_height2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.viewPort.height));
      console.info("[ShapeResourceTest_0100] fill2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.fill));
      console.info("[ShapeResourceTest_0100] stroke2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.stroke));
      console.info("[ShapeResourceTest_0100] strokeMiterLimit2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.strokeMiterLimit));
      console.info("[ShapeResourceTest_0100] strokeWidth2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.strokeWidth));

      expect(JSON.parse(strJson1).$attrs.viewPort.x).assertEqual(JSON.parse(strJson2).$attrs.viewPort.x);
      expect(JSON.parse(strJson1).$attrs.viewPort.y).assertEqual(JSON.parse(strJson2).$attrs.viewPort.y);
      expect(JSON.parse(strJson1).$attrs.viewPort.width).assertEqual(JSON.parse(strJson2).$attrs.viewPort.width);
      expect(JSON.parse(strJson1).$attrs.viewPort.height).assertEqual(JSON.parse(strJson2).$attrs.viewPort.height);
      expect(JSON.parse(strJson1).$attrs.fill).assertEqual(JSON.parse(strJson2).$attrs.fill);
      expect(JSON.parse(strJson1).$attrs.stroke).assertEqual(JSON.parse(strJson2).$attrs.stroke);
      expect(JSON.parse(strJson1).$attrs.strokeMiterLimit).assertEqual(JSON.parse(strJson2).$attrs.strokeMiterLimit);
      expect(JSON.parse(strJson1).$attrs.strokeWidth).assertEqual(JSON.parse(strJson2).$attrs.strokeWidth);
    
      console.info('[ShapeResourceTest_0100] END');
      done();
    });
  })
}

