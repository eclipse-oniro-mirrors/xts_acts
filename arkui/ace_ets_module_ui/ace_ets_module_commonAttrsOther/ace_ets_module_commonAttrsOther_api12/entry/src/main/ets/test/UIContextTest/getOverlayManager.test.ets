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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function getOverlayManager() {
  describe('getOverlayManager', () => {
    beforeEach(async (done: Function) => {
      console.info("getOverlayManager beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/getOverlayManager",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getOverlayManager state pages:" + JSON.stringify(pages));
        if (!("getOverlayManager" == pages.name)) {
          console.info("get getOverlayManager pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getOverlayManager page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getOverlayManager page error:" + err);
      }
      console.info("getOverlayManager beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getOverlayManager after each called");
    });

    /**
     * @tc.number    getOverlayManager_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('getOverlayManager_001', 0, async (done: Function) => {
      console.info('[getOverlayManager_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let add = await driver.findComponent(ON.id('addComponentContent'));
      await add.click();
      await CommonFunc.sleep(1000);
      let Column = getInspectorByKey('Column');
      console.info('getOverlayManager_001 Column: ' + JSON.parse(Column).$attrs.visibility);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(Column).$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[getOverlayManager_001] END');
      await CommonFunc.sleep(1000);
      let remove = await driver.findComponent(ON.id('removeComponentContent'));
      await remove.click();
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
