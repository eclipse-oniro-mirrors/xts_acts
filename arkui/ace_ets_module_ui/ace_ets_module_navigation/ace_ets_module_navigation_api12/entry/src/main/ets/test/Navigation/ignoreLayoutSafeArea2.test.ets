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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function ignoreLayoutSafeArea2() {
  describe('ignoreLayoutSafeArea2', () => {
    beforeEach(async (done: Function) => {
      console.info("ignoreLayoutSafeArea2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ignoreLayoutSafeArea2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ignoreLayoutSafeArea2 state success " + JSON.stringify(pages));
        if (!("ignoreLayoutSafeArea2" == pages.name)) {
          console.info("get ignoreLayoutSafeArea2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ignoreLayoutSafeArea2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ignoreLayoutSafeArea2 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ignoreLayoutSafeArea2 after each called");
    });

    /**
     * @tc.number    ignoreLayoutSafeArea2_0100
     * @tc.name      ignoreLayoutSafeArea2_0100
     * @tc.desc      Test Navigation ignoreLayoutSafeArea2
     * @tc.level     Level 2
     */
    it('ignoreLayoutSafeArea2_0100', 0, async (done: Function) => {
      console.info('[ignoreLayoutSafeArea2_0100] START');
      await CommonFunc.sleep(2000);

      let navRect = CommonFunc.getComponentRect('ignoreLayoutSafeAreaTest2_nav');
      let columnRect = CommonFunc.getComponentRect('ignoreLayoutSafeAreaTest2_column');
      expect(Math.round(navRect.top)).assertEqual(Math.round(columnRect.top));

      console.info('[ignoreLayoutSafeArea2_0100] END');
      done();
    });
  })
}

