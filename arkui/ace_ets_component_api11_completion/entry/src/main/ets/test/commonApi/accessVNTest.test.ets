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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function accessVnTest() {
  describe('accessVnTest', function () {
    beforeEach(async function (done) {
      console.info("accessVnTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/commonApi/accessVN',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get accessVnTest state pages: " + JSON.stringify(pages));
        if (!("accessVN" == pages.name)) {
          console.info("get accessVnTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push accessVnTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push accessVnTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number accessVnTest
     * @tc.name accessVnTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('accessVnTest_0100', 0, async function (done) {
      console.info('accessVnTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('accessVn_1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Row');
      console.info('[accessVnTest_0100] END');
      done();
    });
  })
}

