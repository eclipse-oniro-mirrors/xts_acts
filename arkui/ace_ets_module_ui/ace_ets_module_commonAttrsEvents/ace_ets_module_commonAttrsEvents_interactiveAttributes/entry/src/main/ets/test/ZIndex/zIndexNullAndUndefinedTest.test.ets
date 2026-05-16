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

export default function zIndexNullAndUndefined() {
  describe('zIndexNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("zIndexNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ZIndex/ZIndexNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get zIndexNullAndUndefined state success " + JSON.stringify(pages));
        if (!("ZIndexNullAndUndefined" == pages.name)) {
          console.info("get zIndexNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push zIndexNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push zIndexNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("zIndexNullAndUndefined after each called");
    });

    /**
     * @tc.name   zIndexNullV11001
     * @tc.number SUB_ARKUI_COMMONMETHOD_ZINDEX_PARAM_001
     * @tc.desc   Test zIndex with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('zIndexNullV11001', Level.LEVEL0, async () => {
      console.info('[zIndexNullV11001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('zIndexNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[zIndexNullV11001] zIndex is: " + JSON.stringify(obj.$attrs.zIndex));
      expect(obj.$attrs.zIndex).assertEqual(0);
      console.info('[zIndexNullV11001] END');
    });

    /**
     * @tc.name   zIndexUndefinedV11002
     * @tc.number SUB_ARKUI_COMMONMETHOD_ZINDEX_PARAM_002
     * @tc.desc   Test zIndex with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('zIndexUndefinedV11002', Level.LEVEL0, async () => {
      console.info('[zIndexUndefinedV11002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('zIndexUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[zIndexUndefinedV11002] zIndex is: " + JSON.stringify(obj.$attrs.zIndex));
      expect(obj.$attrs.zIndex).assertEqual(0);
      console.info('[zIndexUndefinedV11002] END');
    });
  })
}
