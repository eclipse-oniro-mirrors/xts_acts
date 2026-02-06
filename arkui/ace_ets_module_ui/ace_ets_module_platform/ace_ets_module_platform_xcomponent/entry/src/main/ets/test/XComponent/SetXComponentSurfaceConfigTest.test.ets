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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SetXComponentSurfaceConfigTest() {
  describe('SetXComponentSurfaceConfigTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SetXComponentSurfaceConfig beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/SetXComponentSurfaceConfigPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetXComponentSurfaceConfig state pages:" + JSON.stringify(pages));
        if (!("SetXComponentSurfaceConfigPage" == pages.name)) {
          console.info("get SetXComponentSurfaceConfig pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SetXComponentSurfaceConfig page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetXComponentSurfaceConfig page error:" + err);
      }
      console.info("SetXComponentSurfaceConfig beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SetXComponentSurfaceConfig after each called");
    });

    /**
     * @tc.name   SetXComponentSurfaceConfigTest_0100
     * @tc.number SetXComponentSurfaceConfigTest_0100
     * @tc.desc   Test setXComponentSurfaceConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetXComponentSurfaceConfigTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SetXComponentSurfaceConfigTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id("SetXComponentSurfaceConfigPage_btn_draw"));
      await button.click();
      await CommonFunc.sleep(1000)

      button = await driver.findComponent(ON.id("SetXComponentSurfaceConfigPage_btn_true"));
      await button.click();
      await CommonFunc.sleep(1000)

      button = await driver.findComponent(ON.id("SetXComponentSurfaceConfigPage_btn_false"));
      await button.click();
      await CommonFunc.sleep(1000)

      button = await driver.findComponent(ON.id("SetXComponentSurfaceConfigPage_btn_null"));
      await button.click();
      await CommonFunc.sleep(1000)

      button = await driver.findComponent(ON.id("SetXComponentSurfaceConfigPage_btn_undefined"));
      await button.click();
      await CommonFunc.sleep(1000)

      let strJson = getInspectorByKey("SetXComponentSurfaceConfigPage_XComponent");
      expect(JSON.parse(strJson).$type).assertEqual("XComponent");

      console.info('[SetXComponentSurfaceConfigTest_0100] END');
      done();
    });

  })
}