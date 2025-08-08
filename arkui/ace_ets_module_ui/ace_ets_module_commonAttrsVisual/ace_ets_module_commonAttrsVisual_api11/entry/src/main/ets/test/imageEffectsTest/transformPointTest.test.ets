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

export default function transformPointTest() {
  describe('transformPointTest', () => {
    beforeEach(async (done: Function) => {
      console.info("transformPointTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/transformPointPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get transformPointTest state pages:" + JSON.stringify(pages));
        if (!("transformPointPage" == pages.name)) {
          console.info("get transformPointTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push transformPointTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push transformPointTest page error:" + err);
      }
      console.info("transformPointTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number transformPointTest_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('transformPointTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('transformPointTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id("transformPointPage_btn"));
      await button1.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('transformPointPage_transformPoint0')).assertEqual(200);
      expect(AppStorage.get('transformPointPage_transformPoint1')).assertEqual(0);
      AppStorage.delete('transformPointPage_transformPoint0')
      AppStorage.delete('transformPointPage_transformPoint1')

      console.info('transformPointTest_0100 END');
      done();
    });
  })
}