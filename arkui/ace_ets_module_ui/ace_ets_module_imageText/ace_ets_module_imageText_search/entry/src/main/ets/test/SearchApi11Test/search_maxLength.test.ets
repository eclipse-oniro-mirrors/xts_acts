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


export default function search_maxLength() {
  describe('search_maxLength', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi11/search_maxLength',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search_maxLength state pages: " + JSON.stringify(pages));
        if (!("search_maxLength" == pages.name)) {
          console.info("get search_maxLength state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search_maxLength page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_maxLength page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SearchMaxLength_001
     * @tc.number SUB_ACE_SearchMaxLength_001
     * @tc.desc   set maxLength to 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SearchMaxLength_001', Level.LEVEL3, async (done:Function)=> {

      console.info('SearchMaxLength_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await setText.click();
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength_001 click success');

      let strJson1 = getInspectorByKey('SearchMaxLength');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(obj1.$attrs.value).assertEqual('123456');
      console.info('[SearchMaxLength_001] END');

      done();
    });

    /**
     * @tc.name   SearchMaxLength_003
     * @tc.number SUB_ACE_SearchMaxLength_003
     * @tc.desc   set maxLength to 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SearchMaxLength_003', Level.LEVEL3, async (done:Function)=> {

      console.info('SearchMaxLength_003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await setText.click();
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength_003 click success');

      let strJson1 = getInspectorByKey('SearchMaxLength');
      let obj3: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength_003] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(obj3.$attrs.value).assertEqual('1234');
      console.info('[SearchMaxLength_003] END');

      done();
    });
  })
}
