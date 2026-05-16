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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/common/Common';

export default function ReuseIdNullUndefinedTest() {
  describe('ReuseIdNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("ReuseIdNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Reusable/ReuseIdNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ReuseIdNullUndefined state success " + JSON.stringify(pages));
        if (!("ReuseIdNullUndefined" == pages.name)) {
          console.info("get ReuseIdNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReuseIdNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseIdNullUndefined page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      console.info("ReuseIdNullUndefinedTest after each called");
      AppStorage.delete('ReuseIdNullUndefinedTest_aboutToReuse');
    });

    /**
     * @tc.name   ReuseIdNullUndefinedTest_0100
     * @tc.number ReuseIdNullUndefinedTest_0100
     * @tc.desc   test reuseId with valid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReuseIdNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ReuseIdNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_switch'));
      await btn.click();
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('ReuseIdNullUndefinedTest_aboutToReuse')).assertEqual('aboutToReuse type1');
      AppStorage.delete('ReuseIdNullUndefinedTest_aboutToReuse');

      console.info('ReuseIdNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   ReuseIdNullUndefinedTest_0200
     * @tc.number ReuseIdNullUndefinedTest_0200
     * @tc.desc   test reuseId with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReuseIdNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ReuseIdNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_null'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_switch'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('ReuseIdNullUndefinedTest_aboutToReuse')).assertEqual(undefined);
      AppStorage.delete('ReuseIdNullUndefinedTest_aboutToReuse');

      console.info('ReuseIdNullUndefinedTest_0200 END');
      done();
    });

    /**
     * @tc.name   ReuseIdNullUndefinedTest_0300
     * @tc.number ReuseIdNullUndefinedTest_0300
     * @tc.desc   test reuseId with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReuseIdNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ReuseIdNullUndefinedTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_undefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_switch'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('ReuseIdNullUndefinedTest_aboutToReuse')).assertEqual(undefined);
      AppStorage.delete('ReuseIdNullUndefinedTest_aboutToReuse');

      console.info('ReuseIdNullUndefinedTest_0300 END');
      done();
    });

    /**
     * @tc.name   ReuseIdNullUndefinedTest_0400
     * @tc.number ReuseIdNullUndefinedTest_0400
     * @tc.desc   test reuseId with emtpy string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReuseIdNullUndefinedTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ReuseIdNullUndefinedTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_empty'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('ReuseIdNullUndefinedTest_switch'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('ReuseIdNullUndefinedTest_aboutToReuse')).assertEqual(undefined);
      AppStorage.delete('ReuseIdNullUndefinedTest_aboutToReuse');

      console.info('ReuseIdNullUndefinedTest_0400 END');
      done();
    });

  })
}

