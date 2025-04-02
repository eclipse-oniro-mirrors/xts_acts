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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function MarqueeMirroringTest() {
  describe('MarqueeMirroringTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MarqueeMirroringTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarqueeMirroringTest state pages:" + JSON.stringify(pages));
        if (!("MarqueeMirroringTest" == pages.name)) {
          console.info("get  MarqueeMirroringTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url:"MainAbility/pages/Marquee/MarqueeMirroring"
            })
          await CommonFunc.sleep(2000);
          console.info("push MarqueeMirroringTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarqueeMirroringTest page error:" + err);
      }
      console.info("MarqueeMirroringTest foreEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MarqueeMirroringTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_MarqueeMirroringTest_001
     * @tc.desc      Marquee onStart test
     * @tc.level     Level 3
     * @tc.type
     */
    it('MarqueeMirroringTest_001', 0, async (done: Function) => {
      console.info('[MarqueeMirroringTest_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MarqueeMirroring_Start'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('MarqueeMirroring_onStart');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[MarqueeMirroringTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('onStart succ');
      console.info('[MarqueeMirroringTest_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_MarqueeMirroringTest_002
     * @tc.desc      Marquee onBounce test
     * @tc.level     Level 3
     * @tc.type
     */
    it('MarqueeMirroringTest_002', 0, async (done: Function) => {
      console.info('[MarqueeMirroringTest_002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MarqueeMirroring_Start'));
      await CommonFunc.sleep(1000);
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MarqueeMirroring_onBounce');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[MarqueeMirroringTest_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('onBounce succ');
      console.info('[MarqueeMirroringTest_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_MarqueeMirroringTest_003
     * @tc.desc      Marquee onFinish test
     * @tc.level     Level 3
     * @tc.type
     */
    it('MarqueeMirroringTest_003', 0, async (done: Function) => {
      console.info('[MarqueeMirroringTest_003] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MarqueeMirroring_Start'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('MarqueeMirroring_onFinish');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[MarqueeMirroringTest_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(2000);
      expect(obj.$attrs.content).assertEqual('onFinish succ');
      console.info('[MarqueeMirroringTest_003] END');
      done();
    });
  })
}