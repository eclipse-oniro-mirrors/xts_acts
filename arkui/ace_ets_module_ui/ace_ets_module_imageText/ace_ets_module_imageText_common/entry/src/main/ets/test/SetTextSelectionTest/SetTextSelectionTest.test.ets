/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function SetTextSelectionTest() {
  describe('SetTextSelectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SetTextSelectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SetTextSelectionTest/SetTextSelectionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetTextSelectionTest state pages:" + JSON.stringify(pages));
        if (!("SetTextSelectionTest" == pages.name)) {
          console.info("get SetTextSelectionTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push SetTextSelectionTest success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetTextSelectionTest page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   SetTextSelectionTest_0100
     * @tc.number SetTextSelectionTest_0100
     * @tc.desc   setTextSelection test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetTextSelectionTest_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('SetTextSelectionTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('selectedTest'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('selectedText');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('SetTextSelectionTest_0100 component obj is: ' + obj);
      console.info('SetTextSelectionTest_0100 component obj.$attrs.content is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('SetTextSelectionTest_0100 END')
      done();
    });
  })
}