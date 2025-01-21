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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, UiDirection, MouseButton, UIElementInfo, UIEventObserver} from '@ohos.UiTest';
export default function getSizeJsunit() {
  describe('getSizeJsunit', function () {
    beforeEach(async function (done) {
      console.info("getSizeJsunit beforeEach start");
      let options = {
        url: "MainAbility/pages/renderNode001/getSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSizeJsunit state pages:" + JSON.stringify(pages));
        if (!("getSize" == pages.name)) {
          console.info("get getClipToFrame pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getSizeJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getSizeJsunit page error:" + err);
      }
      console.info("getSizeJsunit beforeEach end");
      done();
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_getSizeJsunit_001
     * @tc.name      getSizeJsunit
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('getSizeJsunit_001', 0, async function (done) {
      console.info('[getSizeJsunit_001] START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('getWidth');
      let strJson2 = getInspectorByKey('getHeight');
      let obj1 = JSON.parse(strJson1);
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[getSizeJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[getSizeJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[getSizeJsunit_001] component content1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[getSizeJsunit_001] component content2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("getSize_WidthStatus:300");
      expect(obj2.$attrs.content).assertEqual("getSize_HeightStatus:300");
      console.info('[getSizeJsunit_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
