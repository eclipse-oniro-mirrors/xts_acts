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

export default function CustomPropertyNullUndefinedTest() {
  describe('CustomPropertyNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("CustomPropertyNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/CustomPropertyNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomPropertyNullUndefined state success " + JSON.stringify(pages));
        if (!("CustomPropertyNullUndefined" == pages.name)) {
          console.info("get CustomPropertyNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomPropertyNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomPropertyNullUndefined page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomPropertyNullUndefinedTest after each called');
 	  });

    /**
     * @tc.name   CustomPropertyNullUndefinedTest_0100
     * @tc.number CustomPropertyNullUndefinedTest_0100
     * @tc.desc   test customProperty with null/undefined/empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CustomPropertyNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('CustomPropertyNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('CustomPropertyNullUndefinedTest_btn'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('CustomPropertyNullUndefinedTest_1')).assertEqual('{"number":10}');
      expect(AppStorage.get('CustomPropertyNullUndefinedTest_2')).assertEqual('{"number":20}');
      expect(AppStorage.get('CustomPropertyNullUndefinedTest_3')).assertEqual(undefined);
      expect(AppStorage.get('CustomPropertyNullUndefinedTest_4')).assertEqual('{}');
      expect(AppStorage.get('CustomPropertyNullUndefinedTest_5')).assertEqual(null);
      expect(AppStorage.get('CustomPropertyNullUndefinedTest_6')).assertEqual(undefined);
      AppStorage.delete('CustomPropertyNullUndefinedTest_1');
      AppStorage.delete('CustomPropertyNullUndefinedTest_2');
      AppStorage.delete('CustomPropertyNullUndefinedTest_3');
      AppStorage.delete('CustomPropertyNullUndefinedTest_4');
      AppStorage.delete('CustomPropertyNullUndefinedTest_5');
      AppStorage.delete('CustomPropertyNullUndefinedTest_6');

      console.info('CustomPropertyNullUndefinedTest_0100 END');
      done();
    });
  })
}

