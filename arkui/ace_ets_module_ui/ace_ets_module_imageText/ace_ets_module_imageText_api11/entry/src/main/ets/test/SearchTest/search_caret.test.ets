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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function search_caret() {
  describe('search_caret', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search_caret',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search_caret state pages: " + JSON.stringify(pages));
        if (!("search_caret" == pages.name)) {
          console.info("get search_caret state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search_caret page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_caret page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0270
      * @tc.name  : search_caret_001
      * @tc.desc  : set caretPosition to 1
      * @tc.level : Level 3
      */
    it('search_caret_001', Level.LEVEL3, async (done: Function) => {

      console.info('[search_caret_001] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret1'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('search_caret_002 click success');
      let strJson1 = getInspectorByKey('SearchCaretText');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('1');

      console.info('[search_caret_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0290
      * @tc.name  : search_caret_002
      * @tc.desc  : set caretPosition to 5
      * @tc.level : Level 3
      */
    it('search_caret_002', Level.LEVEL3, async (done: Function) => {

      console.info('[search_caret_002] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret5'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('search_caret_002 click success');
      let strJson1 = getInspectorByKey('SearchCaretText');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('5');

      console.info('[search_caret_002] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0310
      * @tc.name  : search_caret_003
      * @tc.desc  : set caretPosition to 3
      * @tc.level : Level 3
      */
    it('search_caret_003', Level.LEVEL3, async (done: Function) => {

      console.info('[search_caret_003] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret3'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('search_caret_003 click success');
      let strJson1 = getInspectorByKey('SearchCaretText');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('3');

      console.info('[search_caret_003] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0280
      * @tc.name  : search_caret_004
      * @tc.desc  : set caretPosition to 20
      * @tc.level : Level 3
      */
    it('search_caret_004', Level.LEVEL3, async (done: Function) => {

      console.info('[search_caret_004] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret20'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('search_caret_004 click success');
      let strJson1 = getInspectorByKey('SearchCaretText');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('9');

      console.info('[search_caret_004] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0300
      * @tc.name  : search_caret_005
      * @tc.desc  : set caretPosition to -1
      * @tc.level : Level 3
      */
    it('search_caret_005', Level.LEVEL3, async (done: Function) => {

      console.info('[search_caret_005] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('search_caret_005 click success');
      let strJson1 = getInspectorByKey('SearchCaretText');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('0');

      console.info('[search_caret_005] END');
      done();
    });

  })
}
