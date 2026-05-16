/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SearchDeleteTest() {
  describe('SearchDeleteTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SearchDeleteTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/TextDelete/SearchDelete',
      };
      try {
        router.clear();
        const pages = router.getState();
        console.info('get SearchDeleteTest state success ' + JSON.stringify(pages));
        if (!pages.path.includes('Page/Page')) {
          const result = await router.replaceUrl(options);
          console.info('push SearchDeleteTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push SearchDeleteTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SearchDeleteTest afterEach called');
    });

    /**
     * @tc.name   SearchDeleteTest001
     * @tc.number SearchDeleteTest001
     * @tc.desc   test the Search deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SearchDeleteTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[SearchDeleteTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let deleteBackwardBtn = await driver.findComponent(ON.id('searchBackward'));
      await CommonFunc.sleep(500);
      await deleteBackwardBtn.click();
      await CommonFunc.sleep(500);

      let strJson1 = getInspectorByKey('miningTimeSearch');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchDeleteTest001] component obj is: " + obj1.$attrs.value);
      console.info("[SearchDeleteTest001] component obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.value).assertEqual('测试文本⛏️⛏️⛏️');
     
      console.info('[SearchDeleteTest001] END');
      done();
    });
  })
}