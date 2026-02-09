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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function pathNewJsunit() {
  describe('pathNewJsunit', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
     let options:router.RouterOptions = {
        url:'MainAbility/pages/Path/path2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path2" == pages.name)) {
          console.info("get path2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push path2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push path2 page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("path2 after each called");
    });

    /**
     * @tc.name   testpathNe0001
     * @tc.number SUB_ARKUI_API_testpathNe0001
     * @tc.desc   PathAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpathNe0001', Level.LEVEL0, async () => {
      console.info('pathNe testpathNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Path');
      console.info("[testpathNe0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Path');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00px");
      console.info("[testpathNe0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testpathNe0002
     * @tc.number SUB_ARKUI_API_testpathNe0002
     * @tc.desc   PathAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpathNe0002', Level.LEVEL0, async () => {
      console.info('pathNe testpathNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Path');
      console.info("[testpathNe0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Path');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("100.00px");
      console.info("[testpathNe0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testpathNe0003
     * @tc.number SUB_ARKUI_API_testpathNe0003
     * @tc.desc   PathAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpathNe0003', Level.LEVEL0, async () => {
      console.info('pathNe testpathNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Path');
      console.info("[testpathNe0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Path');
      expect(JSON.parse(strJson).$attrs.commands).assertEqual("M150 0 L300 300 L0 300 Z");
      console.info("[testpathNe0003] commands value :" + JSON.parse(strJson).$attrs.commands);

    });
  })
}
