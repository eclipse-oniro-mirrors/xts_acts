/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function textInputApi1() {
  describe('textInputApi1', function () {
    beforeEach(async function (done) {
      console.info("textInputApi1 beforeEach start");
      let options = {
        url: 'MainAbility/pages/textInputApi/textInputApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputApi1 state pages:" + JSON.stringify(pages));
        if (!("textInputApi1" == pages.name)) {
          console.info("get textInputApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInputApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputApi1 page error:" + err);
      }
      console.info("textInputApi1 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("textInputApi1 after each called");
    });
    /* *
        * @tc.number: SUB_ACE_TextArea_onSubmit_001
        * @tc.name  : textInputApi1_001
        * @tc.desc  : onSubmit event test
        * @tc.level : Level 2
        */
    it('textInputApi1_001', 0, async function (done) {

      console.info('[textInputApi1_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let text = await driver.findComponent(ON.id('textInputApi1'));
      await CommonFunc.sleep(1000);
      await text.inputText('9');
      await CommonFunc.sleep(1000);
      //回车点击
      await driver.triggerKey(2054);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textInputApi1_text');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(strJson);
      console.info("[textInputApi1_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('PREVIOUS');

      console.info('[textInputApi1_001] END');
      done();
    });
  })
}
