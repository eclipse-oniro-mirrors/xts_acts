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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function OverlayManagerTest_001() {
  describe('OverlayManagerTest_001', () => {
    beforeEach(async (done: Function) => {
      console.info("OverlayManagerTest_001 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/OverlayManager_001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OverlayManagerTest_001 state pages:" + JSON.stringify(pages));
        if (!("OverlayManager_001" == pages.name)) {
          console.info("get OverlayManagerTest_001 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OverlayManagerTest_001 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OverlayManagerTest_001 page error:" + err);
      }
      console.info("OverlayManagerTest_001 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OverlayManagerTest_001 after each called");
    });

    /**
     * @tc.number    hideAllComponentContents_002
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('addComponentContent_001', Level.LEVEL0, async (done: Function) => {
      console.info('[addComponentContent_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let add = await driver.findComponent(ON.id('addComponentContent'));
      await add.click();
      await CommonFunc.sleep(1000);
      let ParamsText = getInspectorByKey('ParamsText');
      console.info('ParamsText: ' + JSON.parse(ParamsText).$attrs.content);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(ParamsText).$attrs.content).assertEqual('ComponentContent0');
      console.info('[addComponentContent_001] END');
      await CommonFunc.sleep(1000);
      let remove = await driver.findComponent(ON.id('removeComponentContent'));
      await remove.click();
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
