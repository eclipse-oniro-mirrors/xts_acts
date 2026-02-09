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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function EnableMultiTypeTest() {
  describe('EnableMultiTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EnableMultiTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/EnableMultiTypeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnableMultiTypeTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("EnableMultiTypeTest" == pages.name)) {
          console.info("get EnableMultiTypeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push EnableMultiTypeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnableMultiTypeTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("EnableMultiTypeTest after each called");
    });

    /**
     * @tc.name   EnableMultiTypeTest0001
     * @tc.number SUB_ACE_BASIC_ENABLE_MULTI_TYPE_ETS_API_0001
     * @tc.desc   test decoration option enableMultiType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('EnableMultiTypeTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('EnableMultiTypeTest0001 START');
      let setStyledString = await driver.findComponent(ON.id('setStyledString'))
      await CommonFunc.sleep(500);
      await setStyledString.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledStringEnableMultiType1')).assertEqual('true');
      expect(''+AppStorage.get('StyledStringEnableMultiType2')).assertEqual('true');
      expect(''+AppStorage.get('StyledStringEnableMultiType3')).assertEqual('true');
      expect(''+AppStorage.get('StyledStringEnableMultiType4')).assertEqual('false');
      AppStorage.delete('StyledStringEnableMultiType1')
      AppStorage.delete('StyledStringEnableMultiType2')
      AppStorage.delete('StyledStringEnableMultiType3')
      AppStorage.delete('StyledStringEnableMultiType4')
      console.info("[EnableMultiTypeTest0001] end");
      done();
    });
  })
}