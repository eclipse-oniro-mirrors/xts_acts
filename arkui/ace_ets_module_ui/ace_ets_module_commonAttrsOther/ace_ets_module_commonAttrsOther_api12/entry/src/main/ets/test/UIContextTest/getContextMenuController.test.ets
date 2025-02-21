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

export default function getContextMenuController() {
  describe('getContextMenuController', () => {
    beforeEach(async (done: Function) => {
      console.info("getContextMenuController beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/getContextMenuController",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getContextMenuController state pages:" + JSON.stringify(pages));
        if (!("getContextMenuController" == pages.name)) {
          console.info("get getContextMenuController pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getContextMenuController page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getContextMenuController page error:" + err);
      }
      console.info("getContextMenuController beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getContextMenuController after each called");
    });

    /**
     * @tc.number    getContextMenuController_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('getContextMenuController_001', 0, async (done: Function) => {
      console.info('[getContextMenuController_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let add = await driver.findComponent(ON.id('getContextClick'));
      await add.longClick();
      await CommonFunc.sleep(1000);

      let remove = await driver.findComponent(ON.id('getContextClose'));
      await remove.click();
      await CommonFunc.sleep(1000);

      let Column = getInspectorByKey('getContext');
      console.info('getContextMenuController_001 content: ' + JSON.parse(Column).$attrs.content);
      expect(JSON.parse(Column).$attrs.content).assertEqual('getContextMenuController close success');
      console.info('[getContextMenuController_001] END');

      await CommonFunc.sleep(1000);
      done();
    });

  })
}
