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


export default function DismissReasonTest() {
  describe('DismissReasonTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DismissReasonTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/DismissReason",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DismissReasonTest state pages: " + JSON.stringify(pages));
        if (!("DismissReason" == pages.name)) {
          console.info("get DismissReasonTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DismissReasonTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DismissReasonTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    DismissReasonTest_0010
     * @tc.name      DismissReasonTest_0010
     * @tc.desc      popup: DismissReason: CLOSE_BUTTON
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DismissReasonTest_0010', 0, async (done: Function) => {
      console.info('DismissReasonTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('DismissReason_Button'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.pressBack()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DismissReason_Button');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DismissReasonTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('DismissReason succ');
      console.info('[DismissReasonTest_0010] END');
      done();
    });
  })
}

