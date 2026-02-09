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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function FlexFourBoundaryTest() {
  describe('FlexFourBoundaryTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexFourBoundaryTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonAttrs/FlexFourBoundary",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexFourBoundary state pages: " + JSON.stringify(pages));
        if (!("FlexFourBoundary" == pages.name)) {
          console.info("get FlexFourBoundary state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexFourBoundary success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexFourBoundary page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   FlexFourBoundaryTest_0100
     * @tc.number SUB_ARKUI_API_FlexFourBoundaryTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FlexFourBoundaryTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[FlexFourBoundaryTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('oneBoundaryText');
      let strJson2 = getInspectorByKey('twoBoundaryText');
      let strJson3 = getInspectorByKey('threeBoundaryText');
      let strJson4 = getInspectorByKey('fourBoundaryText');

      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson1).$attrs.flexGrow));   
      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson2).$attrs.flexGrow));   
      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson2).$attrs.aspectRatio));  
      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson3).$attrs.aspectRatio));  
      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson3).$attrs.flexShrink));   
      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson4).$attrs.aspectRatio));  
      console.info("[FlexFourBoundaryTest_0100] BoundaryText is: " + JSON.stringify(JSON.parse(strJson4).$attrs.flexShrink));   

      expect(JSON.stringify(JSON.parse(strJson1).$attrs.flexGrow)).assertEqual('0');
      expect(JSON.stringify(JSON.parse(strJson2).$attrs.flexGrow)).assertEqual('0');
      expect(JSON.stringify(JSON.parse(strJson3).$attrs.flexShrink)).assertEqual('0');
      expect(JSON.stringify(JSON.parse(strJson4).$attrs.aspectRatio)).assertEqual('1');
      expect(JSON.stringify(JSON.parse(strJson4).$attrs.flexShrink)).assertEqual('1');
      
      console.info('[FlexFourBoundaryTest_0100] END');
      done();
    });
  })
}
