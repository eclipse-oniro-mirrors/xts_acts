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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function search_maxLength2() {
  describe('search_maxLength2', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search_maxLength2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search_maxLength2 state pages: " + JSON.stringify(pages));
        if (!("search_maxLength2" == pages.name)) {
          console.info("get search_maxLength2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search_maxLength2 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_maxLength2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0020
      * @tc.name  : SearchMaxLength2_001
      * @tc.desc  : set maxLength to 9
      * @tc.level : Level 3
      */
    it('SearchMaxLength2_001', 0, async (done:Function)=> {

      console.info('SearchMaxLength2_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength9'));
      await button.click();
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await setText.click();
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength2_001 click success');

      let strJson1 = getInspectorByKey('SearchMaxLength2');
      let obj2: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength2_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(obj2.$attrs.value).assertEqual('123456789');
      console.info('[SearchMaxLength2_001] END');

      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0040
      * @tc.name  : SearchMaxLength2_002
      * @tc.desc  : set maxLength   first add and then subtract
      * @tc.level : Level 3
      */
    it('SearchMaxLength2_002', 0, async (done:Function)=> {

      console.info('SearchMaxLength2_002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await setText.click();
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength2_002 click success');

      let strJson1 = getInspectorByKey('SearchMaxLength2');
      let obj4: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength2_002] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(obj4.$attrs.value).assertEqual('12345');
      console.info('[SearchMaxLength2_002] END');

      done();
    });



  })
}
