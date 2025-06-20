/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils.ets'

export default function gridRowXlJsunit() {
  describe('gridRowXlTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridRow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridRow state success " + JSON.stringify(pages));
        if (!("gridRow" == pages.name)) {
          console.info("get gridRow state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push gridRow page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridRow page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridRowXl after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgridRowXl0001
     * @tc.desic         acegridRowXlEtsTest0001
     */
    it('testgridRowXl0001', Level.LEVEL1, async (done: Function) => {
      console.info('gridRowXl testgridRowXl0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('GridRowColumnOption——xl');
      console.info("[testgridRowXl0001] component backgroundColor strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('GridRow');
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("Color.Red");
      console.info("[testgridRowXl0001] backgroundColor value :" + JSON.parse(strJson).$attrs.backgroundColor);
      done();
    });
  })
}
