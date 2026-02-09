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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function frameNodeApi() {
  describe('frameNodeApi', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeApi state pages:" + JSON.stringify(pages));
        if (!("frameNodeApi" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/FrameNode/frameNodeApi"})
          await CommonFunc.sleep(2000);
          console.info("push frameNodeApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeApi page error:" + err);
      }
      console.info("frameNodeApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeApi after each called");
    });

    /**
     * @tc.name   frameNodeApi_0100
     * @tc.number SUB_ACE_UI_COMPONENT_Performance_001
     * @tc.desc   background test of reuse and recycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('frameNodeApi_0100', Level.LEVEL3, async (done: Function) => {
      console.info('frameNodeApi_0100 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('frameNodeApi_Bind'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('frameNodeApi_Bind'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('reuse')).assertEqual(1);
      expect(AppStorage.get('recycle')).assertEqual(1);
      done();
    });
  })
}
