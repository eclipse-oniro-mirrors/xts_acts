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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function appStorageRefJsunit() {
  describe('appStorageRefJsunit', function () {
    beforeEach(async function (done) {
      console.info("appStorageRefJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Storage/appStorageRef',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get appStorageRefJsunit state pages: " + JSON.stringify(pages));
        if (!("appStorageRef" == pages.name)) {
          console.info("get appStorageRefJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push appStorageRefJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push appStorageRefJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_ACE_BASIC_ETS_REF_0100
     * @tc.name: appStorageRefJsunit_0100
     * @tc.desc: aceEtsTest_ref
     * @tc.level: Level 2
     * @tc.type:
     * @tc.size:
     */
    it('appStorageRefJsunit_0100', 0, async () => {
      console.info('appStorageRefJsunit001 START');
      let strJson = getInspectorByKey('app_ref_1');
      let obj = JSON.parse(strJson);
      console.info("[appStorageRefJsunit001] component obj is: " + JSON.stringify(obj));
      console.info("[appStorageRefJsunit001] ref: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("ref:52");

      let strJson2 = getInspectorByKey('app_ref_2');
      let obj2 = JSON.parse(strJson2);
      console.info("[appStorageRefJsunit001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[appStorageRefJsunit001] setAndRef: " + JSON.stringify(obj2.$attrs.label));
      expect(obj2.$attrs.label).assertEqual("setAndRef:37");
      console.info('appStorageRefJsunit_0100 END');
    });
  })
}