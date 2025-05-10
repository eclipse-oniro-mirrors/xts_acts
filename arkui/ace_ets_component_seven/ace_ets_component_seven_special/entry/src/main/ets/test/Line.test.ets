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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils'

export default function lineNeJsunit() {
  describe('lineNeTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push line page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testLineNe00071
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testLineNe00071', 0, async (done: Function) => {
      console.info('lineNe testLineNe00071 START');
      let strJson = getInspectorByKey('LineKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testLineNe00071] obj value :" + obj.$attrs);
      expect(obj.$attrs.startPoint[0]).assertEqual(0);
      console.info('lineNe testLineNe00071 END');
      done();
    });

    /**
     * @tc.number testLineNe00072
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testLineNe00072', 0, async (done: Function) => {
      console.info('lineNe testLineNe00072 START');
      let strJson = getInspectorByKey('LineKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testLineNe00072] obj value :" + obj.$attrs);
      expect(obj.$attrs.endPoint[0]).assertEqual(200);
      console.info('lineNe testLineNe00072 END');
      done();
    });
  })
}
