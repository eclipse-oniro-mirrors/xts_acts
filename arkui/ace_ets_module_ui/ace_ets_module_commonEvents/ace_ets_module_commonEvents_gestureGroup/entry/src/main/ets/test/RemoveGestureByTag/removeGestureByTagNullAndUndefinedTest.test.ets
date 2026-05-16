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

export default function removeGestureByTagNullAndUndefinedTest() {
  describe('removeGestureByTagNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("removeGestureByTagNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RemoveGestureByTag/RemoveGestureByTagNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get removeGestureByTagNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("RemoveGestureByTagNullAndUndefined" == pages.name)) {
          console.info("get removeGestureByTagNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push removeGestureByTagNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push removeGestureByTagNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   removeGestureByTagEmptyV12001
     * @tc.number SUB_ARKUI_COMMONMETHOD_REMOVEGESTUREBYTAG_PARAM_001
     * @tc.desc   Test removeGestureByTag with empty string parameter - verify no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeGestureByTagEmptyV12001', Level.LEVEL0, async () => {
      console.info('[removeGestureByTagEmptyV12001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnTagEmpty');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[removeGestureByTagEmptyV12001] result: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      console.info('[removeGestureByTagEmptyV12001] END');
    });

    /**
     * @tc.name   removeGestureByTagNullV12002
     * @tc.number SUB_ARKUI_COMMONMETHOD_REMOVEGESTUREBYTAG_PARAM_002
     * @tc.desc   Test removeGestureByTag with null parameter - verify no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeGestureByTagNullV12002', Level.LEVEL0, async () => {
      console.info('[removeGestureByTagNullV12002] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnTagNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[removeGestureByTagNullV12002] result: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      console.info('[removeGestureByTagNullV12002] END');
    });

    /**
     * @tc.name   removeGestureByTagUndefinedV12003
     * @tc.number SUB_ARKUI_COMMONMETHOD_REMOVEGESTUREBYTAG_PARAM_003
     * @tc.desc   Test removeGestureByTag with undefined parameter - verify no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeGestureByTagUndefinedV12003', Level.LEVEL0, async () => {
      console.info('[removeGestureByTagUndefinedV12003] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnTagUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[removeGestureByTagUndefinedV12003] result: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      console.info('[removeGestureByTagUndefinedV12003] END');
    });
  })
}
