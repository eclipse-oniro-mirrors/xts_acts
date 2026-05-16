/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function addGestureNullAndUndefinedTest() {
  describe('addGestureNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("addGestureNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AddGesture/AddGestureNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get addGestureNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("AddGestureNullAndUndefined" == pages.name)) {
          console.info("get addGestureNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push addGestureNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push addGestureNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   addGestureNullV12001
     * @tc.number SUB_ARKUI_COMMONMETHOD_ADDGESTURE_PARAM_001
     * @tc.desc   Test addGesture with gesture null parameter - verify no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addGestureNullV12001', Level.LEVEL0, async () => {
      console.info('[addGestureNullV12001] START');
      await CommonFunc.sleep(1000);
      console.info("[addGestureNullV12001] result: " + AppStorage.get('addGestureNull'));
      expect(JSON.stringify(AppStorage.get('addGestureNull'))).assertContain('Cannot read property gestureType of null');
      console.info('[addGestureNullV12001] END');
    });

    /**
     * @tc.name   addGestureUndefinedV12002
     * @tc.number SUB_ARKUI_COMMONMETHOD_ADDGESTURE_PARAM_002
     * @tc.desc   Test addGesture with gesture undefined parameter - verify no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level 1EVEL0
     */
    it('addGestureUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[addGestureUndefinedV12002] START');
      await CommonFunc.sleep(1000);
      console.info("[addGestureUndefinedV12002] result: " + AppStorage.get('addGestureUndefined'));
      expect(JSON.stringify(AppStorage.get('addGestureUndefined'))).assertContain('Cannot read property gestureType of undefined');
      console.info('[addGestureUndefinedV12002] END');
    });
  })
}
