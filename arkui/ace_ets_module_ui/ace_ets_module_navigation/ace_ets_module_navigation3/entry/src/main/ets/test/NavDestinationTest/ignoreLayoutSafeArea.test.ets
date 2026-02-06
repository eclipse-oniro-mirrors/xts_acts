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


export default function ignoreLayoutSafeArea() {
  describe('ignoreLayoutSafeArea', () => {
    beforeEach(async (done: Function) => {
      console.info("ignoreLayoutSafeArea beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/ignoreLayoutSafeArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ignoreLayoutSafeArea state success " + JSON.stringify(pages));
        if (!("ignoreLayoutSafeArea" == pages.name)) {
          console.info("get ignoreLayoutSafeArea state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ignoreLayoutSafeArea page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ignoreLayoutSafeArea page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ignoreLayoutSafeArea after each called");
    });

    /**
     * @tc.name   ignoreLayoutSafeArea_0100
     * @tc.number ignoreLayoutSafeArea_0100
     * @tc.desc   Test NavDestination ignoreLayoutSafeArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ignoreLayoutSafeArea_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[ignoreLayoutSafeArea_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ignoreLayoutSafeAreaTest1_push'));
      await btn1.click()
      console.info("[ignoreLayoutSafeArea_0100] btn1");
      await CommonFunc.sleep(2000);

      let navRect = CommonFunc.getComponentRect('ignoreLayoutSafeAreaTest1_nav');
      let columnRect = CommonFunc.getComponentRect('ignoreLayoutSafeAreaTest1_column');
      expect(Math.round(navRect.top)).assertEqual(Math.round(columnRect.top));

      console.info('[ignoreLayoutSafeArea_0100] END');
      done();
    });
  })
}

