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
export default function PathResourceTest() {
  describe('PathResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PathResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Path/PathResource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PathResourceTest state pages: " + JSON.stringify(pages));
        if (!("PathResourceTest" == pages.name)) {
          console.info("get PathResourceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PathResourceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PathResourceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   PathResourceTest_0100
     * @tc.number SUB_ARKUI_API_PathResourceTest_0100
     * @tc.desc   PathAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PathResourceTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[PathResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey("PathResource1");
      console.info("[PathResourceTest_0100] width1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.width));
      console.info("[CircleResourceTest_0100] height1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.height));

      let strJson2 = getInspectorByKey("PathResource2");
      console.info("[PathResourceTest_0100] width2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.width));
      console.info("[PathResourceTest_0100] height2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.height));

      let strJson3 = getInspectorByKey("PathResource3");
      console.info("[PathResourceTest_0100] width3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.width));
      console.info("[PathResourceTest_0100] height3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.height));
      
      expect(JSON.parse(strJson1).$attrs.width).assertEqual(JSON.parse(strJson2).$attrs.width);
      expect(JSON.parse(strJson1).$attrs.height).assertEqual(JSON.parse(strJson2).$attrs.height);
      expect(JSON.parse(strJson1).$attrs.commands).assertEqual(JSON.parse(strJson2).$attrs.commands);
      expect(JSON.parse(strJson1).$attrs.width).assertEqual(JSON.parse(strJson3).$attrs.width);
      expect(JSON.parse(strJson1).$attrs.height).assertEqual(JSON.parse(strJson3).$attrs.height);
      expect(JSON.parse(strJson1).$attrs.commands).assertEqual(JSON.parse(strJson3).$attrs.commands);
         
      console.info('[PathResourceTest_0100] END');
      done();
    });
  })
}

