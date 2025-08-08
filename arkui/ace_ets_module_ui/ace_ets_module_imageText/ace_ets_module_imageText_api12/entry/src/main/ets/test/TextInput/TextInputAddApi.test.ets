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
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextInputAddApi() {
  describe('TextInputAddApi', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputAddApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputAddApi state pages:" + JSON.stringify(pages));
        if (!("TextInputAddApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/TextInput/TextInputAddApi"})
          await CommonFunc.sleep(2000);
          console.info("push TextInputAddApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputAddApi page error:" + err);
      }
      console.info("TextInputAddApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputAddApi after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_TextInput_001
     * @tc.desc      onWillInsert test of TextInput
     * @tc.level     Level 3
     * @tc.type
     */

    it('TextInputAddApi_001', 0, async (done: Function) => {
      console.info('[TextInputAddApi_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputTest'));
      await text.inputText('9');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputAddApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[TextInputAddApi_001] END');
      done();

    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_TextInput_002
     * @tc.desc      onDidInsert test of TextInput
     * @tc.level     Level 3
     * @tc.type
     */

    it('TextInputAddApi_002', 0, async (done: Function) => {
      console.info('[TextInputAddApi_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputText2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputAddApi_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onDidInsert');
      console.info('[TextInputAddApi_002] END');
      done();

    });





  })
}
