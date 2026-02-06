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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function EnvironmentTest0040() {
  describe('EnvironmentTest0040', () => {
    beforeEach(async (done: Function) => {
      console.info("EnvironmentTest0040 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Environment/Environment0040',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnvironmentTest0040 state pages: " + JSON.stringify(pages));
        if (!("Environment0040" == pages.name)) {
          console.info("get EnvironmentTest0040 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push EnvironmentTest0040 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnvironmentTest0040 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   EnvironmentTest0040_0100
     * @tc.number EnvironmentTest0040_0100
     * @tc.desc   aceEtsTest_ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnvironmentTest0040_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('EnvironmentTest0040001 START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvKeysOne'));
      console.info("[EnvironmentTest0040001] component tvKeysOne is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain("accessibilityEnabled,languageCode,propA,propB");
      await CommonFunc.sleep(1000);
      obj = JSON.parse(getInspectorByKey('tvKeysTwo'));
      console.info("[EnvironmentTest0040001] component tvKeysTwo is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain("accessibilityEnabled,languageCode,propA,propB");
      console.info('EnvironmentTest0040_0100 END');
    });
  })
}