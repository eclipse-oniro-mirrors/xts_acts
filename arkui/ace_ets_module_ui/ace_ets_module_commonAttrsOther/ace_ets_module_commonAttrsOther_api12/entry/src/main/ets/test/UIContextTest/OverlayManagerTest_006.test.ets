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

export default function OverlayManagerTest_006() {
  describe('OverlayManagerTest_006', () => {
    beforeEach(async (done: Function) => {
      console.info("OverlayManagerTest_006 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/OverlayManager_006",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OverlayManagerTest_006 state pages:" + JSON.stringify(pages));
        if (!("OverlayManager_006" == pages.name)) {
          console.info("get OverlayManagerTest_006 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OverlayManagerTest_006 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OverlayManagerTest_006 page error:" + err);
      }
      console.info("OverlayManagerTest_006 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OverlayManagerTest_006 after each called");
    });

    /**
     * @tc.name   hideAllComponentContents_006
     * @tc.number hideAllComponentContents_006
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hideAllComponentContents_006', Level.LEVEL0, async (done: Function) => {
      console.info('[hideAllComponentContents_006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let add = await driver.findComponent(ON.id('addComponentContent'));
      await add.click();
      await CommonFunc.sleep(1000);
      let hideAll = await driver.findComponent(ON.id('hideAllComponentContents'));
      await hideAll.click();
      await CommonFunc.sleep(1000);
      let Column = getInspectorByKey('Column');
      console.info('Column: ' + JSON.parse(Column).$attrs.visibility);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(Column).$attrs.visibility).assertEqual('Visibility.None');
      await CommonFunc.sleep(1000);
      console.info('[hideAllComponentContents_006] END');
      let remove = await driver.findComponent(ON.id('removeComponentContent'));
      await remove.click();
      await CommonFunc.sleep(1000);
      done();
    });


  })
}
