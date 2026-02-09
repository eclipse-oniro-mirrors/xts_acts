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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function queryNavigationInfoTest() {
  describe('queryNavigationInfoTest', () => {
    beforeEach(async (done: Function) => {
      console.info("queryNavigationInfoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/queryNavigationInfoTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get queryNavigationInfoTest state success " + JSON.stringify(pages));
        if (!("queryNavigationInfoTest" == pages.name)) {
          console.info("get queryNavigationInfoTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push queryNavigationInfoTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push queryNavigationInfoTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("queryNavigationInfoTest after each called");
    });

    /**
     * @tc.name   queryNavigationInfoTest_0200
     * @tc.number queryNavigationInfoTest_0200
     * @tc.desc   Test queryNavigationInfo return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('queryNavigationInfoTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[queryNavigationInfoTest_0200] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('testQueryNavigationInfoUndefinedId'));
      await btn.click()
      console.info('[queryNavigationInfoTest_0200] btn click');
      await CommonFunc.sleep(2000);
      let queryNavigationInfoUndefined: NavigationInfo | undefined = AppStorage.get('queryNavigationInfoUndefined')
      expect(queryNavigationInfoUndefined).assertEqual(undefined);
      AppStorage.delete('queryNavigationInfoUndefined');
      console.info('[queryNavigationInfoTest_0200] END');
      done();
    });

    /**
     * @tc.name   queryNavigationInfoTest_0100
     * @tc.number queryNavigationInfoTest_0100
     * @tc.desc   Test queryNavigationInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('queryNavigationInfoTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[queryNavigationInfoTest_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('queryNavigationInfoTest_btn1'));
      await btn.click()
      console.info('[queryNavigationInfoTest_0100] btn click');
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.text('queryNavigationInfo'));
      await btn2.click()
      console.info('[queryNavigationInfoTest_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('queryNavigationInfoTest_text1');
      await CommonFunc.sleep(1000);
      console.info("[queryNavigationInfoTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('queryNavigationInfoTest_navId');

      let btn3 = await driver.findComponent(ON.id('queryNavigationInfoTest_btn2'));
      await btn3.click()
      console.info('[queryNavigationInfoTest_0100] btn3 click');
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('queryNavigationInfoTest_text2');
      await CommonFunc.sleep(1000);
      console.info("[queryNavigationInfoTest_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('pageTwo');

      console.info('[queryNavigationInfoTest_0100] END');
      done();
    });
  })
}

