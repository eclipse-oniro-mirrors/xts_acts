/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function builderNodeUpdateNullUndefinedTest() {
  describe('builderNodeUpdateNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("builderNodeUpdateNullUndefinedTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/BuilderNode/builderNodeUpdateNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get builderNodeUpdateNullUndefined state pages: " + JSON.stringify(pages));
        if (!("builderNodeUpdateNullUndefined" == pages.name)) {
          console.info("get builderNodeUpdateNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push builderNodeUpdateNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push builderNodeUpdateNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   builderNodeUpdateNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_builderNodeUpdateNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builderNodeUpdateNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('builderNodeUpdateNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('builderNodeUpdateNullUndefinedButton'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('builderNodeUpdateNullUndefined');

      expect(JSON.parse(strJson1).$type).assertEqual('NodeContainer');
      
      console.info('[builderNodeUpdateNullUndefinedTest_0100 ] END');
      done();
    });
  })
}