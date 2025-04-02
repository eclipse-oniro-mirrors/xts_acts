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
import { Component, Driver, UiWindow, On, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function APIsetOnFocusTest() {
  describe('APIsetOnFocusTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIsetOnFocusTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/APIsetOnFocus",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIsetOnFocusTest state pages: " + JSON.stringify(pages));
        if (!("APIsetOnFocus" == pages.name)) {
          console.info("get APIsetOnFocusTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push APIsetOnFocusTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIsetOnFocusTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number frameNode
     * @tc.name APIsetOnFocusTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('APIsetOnFocusTest_0100', 0, async (done: Function) => {
      console.info('APIsetOnFocusTest_0100 START');
      let strJson = getInspectorByKey('setOnFocus_1');
      let obj = JSON.parse(strJson);
      console.info("[APIsetOnFocusTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[APIsetOnFocusTest_0100] backgroundColor: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');

      let strJson2 = getInspectorByKey('setOn_text');
      let obj2 = JSON.parse(strJson2);
      console.info("[APIsetOnFocusTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[APIsetOnFocusTest_0100] title: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('setOnFocus');
      console.info('[APIsetOnFocusTest_0100] END');
      done();
    });
    /**
     * @tc.number frameNode
     * @tc.name APIsetOnBlurTest_0200
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('APIsetOnFocusTest_0200', 0, async (done: Function) => {
      console.info('APIsetOnFocusTest_0200 START');

      let driver = await Driver.create()
      let buttonCl = await driver.findComponent(ON.id('setOnFocus_2'));
      if (await buttonCl.isFocused()) {
        console.info('This button is focused');
      } else {
        console.info('This button is not focused');
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('setOnFocus_2');
      let obj = JSON.parse(strJson);
      console.info("[APIsetOnFocusTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[APIsetOnHoverTest_0200] label: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[APIsetOnFocusTest_0200] END');
      done();
    });

  })
}
