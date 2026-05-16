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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function colorEnumJsunit() {
  describe('colorEnumJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("color beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/color',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get color state success " + JSON.stringify(pages));
        if (!("color" == pages.name)) {
          console.info("get color state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push color page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push color page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("colorEnumTest after each called");
    });

    /**
     * @tc.name   testcolorTransparent0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testcolorTransparent0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testcolorTransparent0001', Level.LEVEL1, async (done: Function) => {
      console.info('colorEnumTest testcolorTransparent0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('Transparent');
      console.info("[testcolorTransparent0001] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testcolorTransparent0001] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#00000000");
      done();
    });
  })
}
