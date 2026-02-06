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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function NavigationLevelTest2() {
  describe('NavigationLevelTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationLevelTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationLevel/NavigationLevelTest2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationLevelTest2 state success " + JSON.stringify(pages));
        if (!("NavigationLevelTest2" == pages.name)) {
          console.info("get NavigationLevelTest2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationLevelTest2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationLevelTest2 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationLevelTest2 after each called");
    });

    /**
     * @tc.number    NavigationLevelTest2_0200
     * @tc.name      NavigationLevelTest2_0200
     * @tc.desc      Test NavPathStack pop return undefined
     * @tc.level     Level 0
     */
    it('NavigationLevelTest2_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest2_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('popTrueBtn2'));
      await btn.click()
      console.info('[NavigationLevelTest2_0200] btn click');
      await CommonFunc.sleep(1000);
      let result: NavPathInfo | undefined = AppStorage.get('popResult');
      expect(result).assertUndefined();
      AppStorage.delete('popResult');
      await CommonFunc.sleep(1000);
      console.info('[NavigationLevelTest2_0200] END');
      done();
    });

    /**
     * @tc.number    NavigationLevelTest2_0300
     * @tc.name      NavigationLevelTest2_0300
     * @tc.desc      Test NavPathStack pop with param return undefined
     * @tc.level     Level 0
     */
    it('NavigationLevelTest2_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest2_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('pop2TrueBtn2'));
      await btn.click()
      console.info('[NavigationLevelTest2_0300] btn click');
      await CommonFunc.sleep(1000);
      let result: NavPathInfo | undefined = AppStorage.get('pop2Result');
      expect(result).assertUndefined();
      AppStorage.delete('pop2Result');
      await CommonFunc.sleep(1000);
      console.info('[NavigationLevelTest2_0300] END');
      done();
    });

    /**
     * @tc.number    NavigationLevelTest2_0100
     * @tc.name      NavigationLevelTest2_0100
     * @tc.desc      Test Navigation
     * @tc.level     Level 0
     */
    it('NavigationLevelTest2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest2_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest2_btn1'));
      await btn.click()
      console.info('[NavigationLevelTest2_0100] btn click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavigationLevelTest2_btn2'));
      await btn2.click()
      console.info('[NavigationLevelTest2_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let result: NavPathInfo | undefined = AppStorage.get('popFalseResult');
      expect(result?.name).assertEqual('pageOne');
      AppStorage.delete('popFalseResult');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavigationLevelTest2_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest2_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('NavBar');

      console.info('[NavigationLevelTest2_0100] END');
      done();
    });

    /**
     * @tc.number    NavigationLevelTest2_0400
     * @tc.name      NavigationLevelTest2_0400
     * @tc.desc      Test NavPathStack pop with param return NavPathInfo
     * @tc.level     Level 0
     */
    it('NavigationLevelTest2_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest2_0400] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest2_btn1'));
      await btn.click()
      console.info('[NavigationLevelTest2_0400] btn click');
      await CommonFunc.sleep(1000);
   
      let btn2 = await driver.findComponent(ON.id('pop2FalseBtn'));
      await btn2.click()
      console.info('[NavigationLevelTest2_0400] btn2 click');
      await CommonFunc.sleep(1000);

      let result: NavPathInfo | undefined = AppStorage.get('popFalseResult2');
      expect(result?.name).assertEqual('pageOne');
      AppStorage.delete('popFalseResult2');
      console.info('[NavigationLevelTest2_0400] END');
      done();
    });
  })
}

