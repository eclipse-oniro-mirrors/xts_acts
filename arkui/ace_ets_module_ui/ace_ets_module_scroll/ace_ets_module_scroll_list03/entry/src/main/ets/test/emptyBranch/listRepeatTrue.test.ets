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

export default function listRepeatTrue() {
  describe('listRepeatTrue', () => {
    beforeEach(async (done: Function) => {
      console.info("listRepeatTrue beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/emptyBranch/listRepeatTrue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listRepeatTrue state pages:" + JSON.stringify(pages));
        if (!("listRepeatTrue" == pages.name)) {
          console.info("get listRepeatTrue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listRepeatTrue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listRepeatTrue page error:" + err);
      }
      console.info("listRepeatTrue beforeEach end");
      done();
    });
    /**
     * @tc.name   listRepeatTrue_0100
     * @tc.number listRepeatTrue_0100
     * @tc.desc   set List Repeat supportEmptyBranchInLazyLoading to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listRepeatTrue_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[listRepeatTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let onText1 = await driver.findComponent(ON.id('list_repeat_true_7'));
      console.info("[listRepeatTrue_0100] onText1 is: " + onText1);
      expect(onText1).assertEqual(null);

      let listItem0 = CommonFunc.getComponentRectOnScreen('list_repeat_true_4');
      let left = listItem0.left;
      let right = listItem0.right;
      console.info("listRepeatTrue_0100 value is" + left + " --" + right);
      let width = right - left;
      console.info("[listRepeatTrue_0100] listItem0 width is: " + width);
      let listItem1 = CommonFunc.getComponentRectOnScreen('list_repeat_true_6');
      console.info("[listRepeatTrue_0100] listItem1 right is: " + listItem1.right);
      let listItem2 = CommonFunc.getComponentRectOnScreen('list_repeat_true_8');
      console.info("[listRepeatTrue_0100] listItem2 left is: " + listItem2.left);
      expect(Math.floor(Math.abs(listItem2.left - listItem1.right - width)) <= 1).assertTrue();
      console.info('[listRepeatTrue_0100] END');
      done();
    });
  })
}
