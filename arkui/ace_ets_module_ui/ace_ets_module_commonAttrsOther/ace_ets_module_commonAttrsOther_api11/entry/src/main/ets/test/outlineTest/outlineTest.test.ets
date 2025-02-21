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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function outlineTest() {
  describe('outlineTest', () => {
    beforeEach(async (done: Function) => {
      console.info("outlineTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/outline/outline',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get outlineTest state pages: " + JSON.stringify(pages));
        if (!("outline" == pages.name)) {
          console.info("get outlineTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push outlineTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push outlineTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    outline
     * @tc.name      outlineTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('outlineTest_0100', 0, async (done: Function) => {
      console.info('outlineTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline_text');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[outlineTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[outlineTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[outlineTest_0100] text: " + JSON.stringify(obj.$attrs.label));
      let obj1: string = JSON.parse(obj.$attrs.outline).style.left;
      expect(obj1).assertEqual("OutlineStyle.SOLID");
      console.info('[outlineTest_0100] END');
      done();
    });
    /**
     * @tc.number    outline
     * @tc.name      outlineTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('outlineTest_0200', 0, async (done: Function) => {
      console.info('outlineTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline_text');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[outlineTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[outlineTest_0200] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      let obj1: string = JSON.parse(obj.$attrs.outline).style.right;
      expect(obj1).assertEqual("OutlineStyle.DASHED");
      console.info('[outlineTest_0200] END');
      done();
    });
    /**
     * @tc.number    outline
     * @tc.name      outlineTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('outlineTest_0300', 0, async (done: Function) => {
      console.info('outlineTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline_text');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[outlineTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[outlineTest_0300] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      let obj1: string = JSON.parse(obj.$attrs.outline).style.top;
      expect(obj1).assertEqual("OutlineStyle.DOTTED");
      console.info('[outlineTest_0300] END');
      done();
    });
  })
}

