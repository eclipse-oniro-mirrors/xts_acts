/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function listLazyFalse() {
  describe('listLazyFalse', () => {
    beforeEach(async (done: Function) => {
      console.info("listLazyFalse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/emptyBranch/listLazyFalse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listLazyFalse state pages:" + JSON.stringify(pages));
        if (!("listLazyFalse" == pages.name)) {
          console.info("get listLazyFalse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listLazyFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listLazyFalse page error:" + err);
      }
      console.info("listLazyFalse beforeEach end");
      done();
    });
    /**
     * @tc.name   listLazyFalse_0100
     * @tc.number listLazyFalse_0100
     * @tc.desc   set List LazyForEach supportEmptyBranchInLazyLoading to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listLazyFalse_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[listLazyFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let onText1 = await driver.findComponent(ON.id('list_lazy_false_7'));
      console.info("[listLazyFalse_0100] onText1 is: " + onText1);
      expect(onText1).assertEqual(null);

      let onText2 = await driver.findComponent(ON.id('list_lazy_false_8'));
      console.info("[listLazyFalse_0100] onText2 is: " + onText2);
      expect(onText2).assertEqual(null);
      console.info('[listLazyFalse_0100] END');
      done();
    });
  })
}
