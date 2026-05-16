/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RouterPageUpdateTest() {
  describe('RouterPageUpdateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RouterPageUpdateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/RouterPageUpdatePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RouterPageUpdateTest state pages:" + JSON.stringify(pages));
        if (!("RouterPageUpdatePage" == pages.name)) {
          console.info("get RouterPageUpdateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RouterPageUpdateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RouterPageUpdateTest page error:" + err);
      }
      console.info("RouterPageUpdateTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   RouterPageUpdateTest_0100
     * @tc.number RouterPageUpdateTest_0100
     * @tc.desc   RouterPageUpdateTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RouterPageUpdateTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('RouterPageUpdateTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id("RouterPageUpdate_btn_off"));
      await button.click();
      await CommonFunc.sleep(1000);

      button = await driver.findComponent(ON.id("RouterPageUpdate_btn_push"));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.pressBack();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('RouterPageUpdatePage_callBackFuncOnCount')).assertEqual(1);
      AppStorage.delete('RouterPageUpdatePage_callBackFuncOnCount')

      console.info('RouterPageUpdateTest_0100 END');
      done();
    });
  })
}