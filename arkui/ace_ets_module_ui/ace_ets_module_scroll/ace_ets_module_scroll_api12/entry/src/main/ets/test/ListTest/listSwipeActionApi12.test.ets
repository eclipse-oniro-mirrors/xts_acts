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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { Driver, ON, On } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function listSwipeActionApi12Test() {
  describe('listSwipeActionApi12Test', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeActionApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listSwipeActionApi12"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listSwipeActionApi12Test state pages: " + JSON.stringify(pages));
        if (!("listSwipeActionApi12" == pages.name)) {
          console.info("get listSwipeActionApi12Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listSwipeActionApi12Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listSwipeActionApi12Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /*
     * @tc.number : listSwipeActionApi12Test_001
     * @tc.name : when swipe,then return the init position
     * @tc.desc : test the onStateChange function parameter state
     * @tc.level : Level 2
     * @tc.type :
     * @tc.size :
    */
    it('listSwipeActionApi12Test_001', 0, async (done: Function) => {
      console.info('listSwipeActionApi12Test_001 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // swipe the listItem to right
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(50)), Math.round(globalThis.winTop + vp2px(108)), Math.round(globalThis.winLeft + vp2px(200)), Math.round(globalThis.winTop + vp2px(108))
      );
      await CommonFunc.sleep(5000);
      let strJson1 = getInspectorByKey('ListTestApi12_2');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('160');
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('item0'));
      btn1.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('ListTestApi12_2');
      let obj2: ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.content).assertEqual('0');
      done();
    });


  })
}
