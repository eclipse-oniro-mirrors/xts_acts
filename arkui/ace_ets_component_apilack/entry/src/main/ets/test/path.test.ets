/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils'

export default function pathNewTest() {
  describe('pathNewTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/path',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push path page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("pathNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpathNe0001
     * @tc.desic         acepathNeEtsTest0001
     */
    it('testpathNe0001', 0, async () => {
      console.info('pathNe testpathNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Path');
      console.info("[testpathNe0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Path');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00px");
      console.info("[testpathNe0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpathNe0002
     * @tc.desic         acepathNeEtsTest0002
     */
    it('testpathNe0002', 0, async () => {
      console.info('pathNe testpathNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Path');
      console.info("[testpathNe0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Path');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("100.00px");
      console.info("[testpathNe0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testpathNe0003
     * @tc.desic         acepathNeEtsTest0003
     */
    it('testpathNe0003', 0, async () => {
      console.info('pathNe testpathNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Path');
      console.info("[testpathNe0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Path');
      expect(JSON.parse(strJson).$attrs.commands).assertEqual("M150 0 L300 300 L0 300 Z");
      console.info("[testpathNe0003] commands value :" + JSON.parse(strJson).$attrs.commands);

    });
  })
}
