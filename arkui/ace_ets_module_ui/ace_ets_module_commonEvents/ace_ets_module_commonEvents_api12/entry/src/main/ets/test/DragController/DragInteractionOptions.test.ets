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

export default function DragInteractionOptionsTest() {

  describe('DragInteractionOptionsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/DragInteractionOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DragInteractionOptions state pages: " + JSON.stringify(pages));
        if (!("DragInteractionOptions" == pages.name)) {
          console.info("get DragInteractionOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DragInteractionOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DragInteractionOptions page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DragInteractionOptions after each called");
    });

    /**
     * @tc.number    DragInteractionOptions_0010
     * @tc.name      DragInteractionOptions
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DragInteractionOptions_0010', Level.LEVEL0, async (done: Function) => {
      console.info('DragInteractionOptions_0010 START');
      let driver = await Driver.create()
      let grid = await driver.findComponent(ON.id('DragInteractionOptionsGridItem1'));
      let button = await driver.findComponent(ON.id('dragPreviewOptions_button'));
      await grid.dragTo(button);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragPreviewOptions_button');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('DragInteractionOptionsGridItem1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[DragInteractionOptions_0010] dragPreviewOptions: " + JSON.stringify(obj1));
      console.info("[DragInteractionOptions_0010] dragPreviewOptions: " + JSON.stringify(obj1.$attrs));
      console.info("[DragInteractionOptions_0010] dragPreviewOptions: " + JSON.stringify(obj1.$attrs.mode));
      expect(obj.$attrs.label).assertEqual('drag succ');
      console.info('[DragInteractionOptions_0010] END');
      done();
    });

    /**
     * @tc.number    DragInteractionOptions_0020
     * @tc.name      DragInteractionOptions
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DragInteractionOptions_0020', Level.LEVEL0, async (done: Function) => {
      console.info('DragInteractionOptions_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('dragPreviewOptions_button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let grid = await driver.findComponent(ON.id('DragInteractionOptionsGridItem1'));
      await grid.dragTo(button1);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragPreviewOptions_button');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DragInteractionOptions_0020] dragPreviewOptions: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.label).assertEqual('drag succ');
      console.info('[DragInteractionOptions_0020] END');
      done();
    });
  })
}
