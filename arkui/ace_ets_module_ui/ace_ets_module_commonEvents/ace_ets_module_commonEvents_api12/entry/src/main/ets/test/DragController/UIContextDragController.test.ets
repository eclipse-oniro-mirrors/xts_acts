/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function UIContextDragControllerTest() {

  describe('UIContextDragControllerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/UIContextDragController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextDragController state pages: " + JSON.stringify(pages));
        if (!("UIContextDragController" == pages.name)) {
          console.info("get UIContextDragController state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContextDragController success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextDragController page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextDragController after each called");
    });

    /**
     * @tc.number    UIContextDragController_0010
     * @tc.name      UIContextDragController_0010
     * @tc.desc      api: UIContext DragController
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIContextDragController_0010', Level.LEVEL0, async (done: Function) => {
      console.info('UIContextDragController_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let grid = await driver.findComponent(ON.id('UIContextDragController1'));
      let button = await driver.findComponent(ON.id('UIContextDragController2'));
      await grid.dragTo(button);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('UIContextDragController2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIContextDragController_0010] dragPreviewOptions: " + JSON.stringify(obj));
      console.info("[UIContextDragController_0010] dragPreviewOptions: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.label).assertEqual('Drag Success');
      console.info('[UIContextDragController_0010] END');
      done();
    });
  })
}
