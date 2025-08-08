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

export default function PushNameRouterTest() {
  describe('PushNameRouterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PushNameRouterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/PushNameRouterPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PushNameRouterTest state pages:" + JSON.stringify(pages));
        if (!("PushNameRouterPage" == pages.name)) {
          console.info("get PushNameRouterTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PushNameRouterTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PushNameRouterTest page error:" + err);
      }
      console.info("PushNameRouterTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number PushNameRouterTest_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('PushNameRouterTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('PushNameRouterTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id("PushNameRouter_btn_push"));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('PushNameRouterPage_pushNamedRoute')).assertEqual('success');
      expect(AppStorage.get('PushNameRouterPage_aboutToAppear')).assertEqual('success');
      AppStorage.delete('PushNameRouterPage_pushNamedRoute')
      AppStorage.delete('PushNameRouterPage_aboutToAppear')

      console.info('PushNameRouterTest_0100 END');
      done();
    });
  })
}