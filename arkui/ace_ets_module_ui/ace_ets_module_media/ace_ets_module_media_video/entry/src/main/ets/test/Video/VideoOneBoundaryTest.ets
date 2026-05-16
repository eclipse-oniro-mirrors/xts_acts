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
export default function VideoOneBoundaryTest() {
  describe('VideoOneBoundaryTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoOneBoundaryTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/VideoOneBoundary",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoOneBoundary state pages: " + JSON.stringify(pages));
        if (!("VideoOneBoundary" == pages.name)) {
          console.info("get VideoOneBoundary state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoOneBoundary success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoOneBoundary page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   VideoOneBoundaryTest_0100
     * @tc.number SUB_ARKUI_API_VideoOneBoundaryTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoOneBoundaryTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[VideoOneBoundaryTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('VideoOneBoundaryStart'));
      await button.click();
      await Utils.sleep(2000)

      let button1 = await driver.findComponent(ON.id('setCurrentTime_0'));
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = getInspectorByKey('VideoOneBoundaryText');

      let button2 = await driver.findComponent(ON.id('setCurrentTime_-1'));
      await button2.click();
      await Utils.sleep(1000)
      let strJson2 = getInspectorByKey('VideoOneBoundaryText');

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('-1');
      
      console.info('[VideoOneBoundaryTest_0100] END');
      done();
    });
  })
}
