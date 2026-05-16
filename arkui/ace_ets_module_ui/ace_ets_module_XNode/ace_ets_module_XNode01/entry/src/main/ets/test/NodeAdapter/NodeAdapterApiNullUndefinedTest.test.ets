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

export default function NodeAdapterApiNullUndefinedTest() {
  describe('NodeAdapterApiNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NodeAdapterApiNullUndefinedTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/NodeAdapter/NodeAdapterApiNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NodeAdapterApiNullUndefined state pages: " + JSON.stringify(pages));
        if (!("NodeAdapterApiNullUndefined" == pages.name)) {
          console.info("get NodeAdapterApiNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push NodeAdapterApiNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NodeAdapterApiNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   NodeAdapterApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_NodeAdapterApiNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeAdapterApiNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('NodeAdapterApiNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('nodeAdapterRemoveDataNull'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id('nodeAdapterRemoveDataUndefined'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let button3 = await driver.findComponent(ON.id('nodeAdapterInsertItemNull'));
      await button3.click();
      await CommonFunc.sleep(1000);

      let button4 = await driver.findComponent(ON.id('nodeAdapterInsertItemUndefined'));
      await button4.click();
      await CommonFunc.sleep(1000);

      let button5 = await driver.findComponent(ON.id('nodeAdapterMoveItemNull'));
      await button5.click();
      await CommonFunc.sleep(1000);

      let button6 = await driver.findComponent(ON.id('nodeAdapterMoveItemUndefined'));
      await button6.click();
      await CommonFunc.sleep(1000);

      let button7 = await driver.findComponent(ON.id('nodeAdapterDetachNodeNull'));
      await button7.click();
      await CommonFunc.sleep(1000);

      let button8 = await driver.findComponent(ON.id('nodeAdapterDetachNodeUndefined'));
      await button8.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NodeAdapterApiNullUndefined');
      expect(JSON.parse(strJson1).$type).assertEqual('NodeContainer');
      
      console.info('[NodeAdapterApiNullUndefinedTest_0100 ] END');
      done();
    });
  })
}