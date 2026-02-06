/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, afterEach, beforeEach } from "../../../hypium/index";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

export default function GetAppContextTest() {
  describe("GetAppContextTest", () => {

    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })
    
    /**
     * @tc.name   ACTS_GET_APP_CONTENT_0001
     * @tc.number ACTS_GET_APP_CONTENT_0001
     * @tc.desc   Test the api "abilityDelegator.getAppContext", return the result with callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_GET_APP_CONTENT_0001", Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.log("ACTS_GET_APP_CONTENT_0001 :start");
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context:common.Context = abilityDelegator.getAppContext() as common.Context;
      if (context != null) {
        abilityDelegator.printSync(
          "ACTS_GET_APP_CONTENT_0001 : " + JSON.stringify(context)
        );
        expect(context.applicationInfo.name).assertEqual(
          "com.example.delegatortest.static"
        );
        expect(context.applicationInfo.description).assertEqual("");
        expect(context.applicationInfo.label).assertEqual("$string:app_name");
        expect(context.applicationInfo.labelId > 0).assertTrue();
        expect(context.applicationInfo.icon).assertEqual("$media:app_icon");
        expect(context.applicationInfo.iconId > 0).assertTrue();
        expect(context.applicationInfo.codePath != null).assertTrue();
        abilityDelegator.printSync("ACTS_GET_APP_CONTENT_0001 pass ");
        done();
      } else {
        abilityDelegator.printSync(
          "ACTS_GET_APP_CONTENT_0001 not found context"
        );
        expect().assertFail();
        done();
      }
    });
  });
}
