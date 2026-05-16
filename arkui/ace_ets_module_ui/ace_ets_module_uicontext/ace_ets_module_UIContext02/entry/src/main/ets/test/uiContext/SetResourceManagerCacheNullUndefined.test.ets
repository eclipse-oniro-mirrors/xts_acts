/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SetResourceManagerCacheNullUndefinedTest() {
  describe('SetResourceManagerCacheNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SetResourceManagerCacheNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uiContext/SetResourceManagerCacheNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetResourceManagerCacheNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get SetResourceManagerCacheNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SetResourceManagerCacheNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetResourceManagerCacheNullUndefinedTest page error:" + err);
      }
      console.info("SetResourceManagerCacheNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SetResourceManagerCacheNullUndefinedTest after each called");
    });

    /**
     * @tc.name   setResourceManagerCacheMaxCountForHSPNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETRESOURCEMANAGERCACHEMAXCOUNTFORHSP_NULL_0100
     * @tc.desc   Test UIContext.setResourceManagerCacheMaxCountForHSP with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setResourceManagerCacheMaxCountForHSPNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('setResourceManagerCacheMaxCountForHSPNull_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('setResourceManagerCache_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_null')).assertEqual('success');
      expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_undefined')).assertEqual('success');
      AppStorage.delete('setResourceManagerCacheMaxCountForHSP_null')
      AppStorage.delete('setResourceManagerCacheMaxCountForHSP_undefined')
      console.info('[setResourceManagerCacheMaxCountForHSPNull_0100] END');
      done();
    });

  })
}
