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

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

interface optionsObj {
  uri: string
}

export default function featureAbilityStartAbilityJsunit() {
  describe('featureAbilityStartAbilityTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/featureAbility/featureAbility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get featureAbility state success " + JSON.stringify(pages));
        if (!("featureAbility" == pages.name)) {
          console.info("get featureAbility state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push featureAbility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push featureAbility page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("featureAbilityStartAbility after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testfeatureAbilityStartAbility0001
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0001
     */
    it('testfeatureAbilityStartAbility0001', 0, async () => {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("320.00vp");
      console.info("[testfeatureAbilityStartAbility0001] width value :" + JSON.parse(strJson).$attrs.width);

    });
  })
}
