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

export default function AboutToReuseNullUndefinedTest() {
  describe('AboutToReuseNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("AboutToReuseNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Reusable/AboutToReuseNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AboutToReuseNullUndefined state success " + JSON.stringify(pages));
        if (!("AboutToReuseNullUndefined" == pages.name)) {
          console.info("get AboutToReuseNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AboutToReuseNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AboutToReuseNullUndefined page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      console.info("AboutToReuseNullUndefinedTest after each called");
      AppStorage.delete('AboutToReuseNullUndefinedTest_aboutToReuse');
    });

    /**
     * @tc.name   AboutToReuseNullUndefinedTest_0100
     * @tc.number AboutToReuseNullUndefinedTest_0100
     * @tc.desc   test aboutToReuse with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AboutToReuseNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('AboutToReuseNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('AboutToReuseNullUndefinedTest_null'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('AboutToReuseNullUndefinedTest_aboutToReuse')).assertEqual(null);
      AppStorage.delete('AboutToReuseNullUndefinedTest_aboutToReuse');

      console.info('AboutToReuseNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   AboutToReuseNullUndefinedTest_0200
     * @tc.number AboutToReuseNullUndefinedTest_0200
     * @tc.desc   test aboutToReuse with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AboutToReuseNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('AboutToReuseNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('AboutToReuseNullUndefinedTest_undefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('AboutToReuseNullUndefinedTest_aboutToReuse')).assertEqual(undefined);
      AppStorage.delete('AboutToReuseNullUndefinedTest_aboutToReuse');

      console.info('AboutToReuseNullUndefinedTest_0200 END');
      done();
    });
  })
}

