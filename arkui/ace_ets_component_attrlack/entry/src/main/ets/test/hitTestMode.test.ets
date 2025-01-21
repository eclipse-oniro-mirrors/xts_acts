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
import Utils from './Utils.ets'

export default function hitTestModeJsunit() {
  describe('hitTestModeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("hitTestMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/hitTestMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hitTestMode state success " + JSON.stringify(pages));
        if (!("hitTestMode" == pages.name)) {
          console.info("get hitTestMode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push hitTestMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hitTestMode page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("hitTestModeTest after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testhitTestMode0002
     * @tc.desic         acehitTestModelEtsTest0002
     */
    it('testhitTestMode0002', 0, async (done: Function) => {
      console.info('hitTestMode testhitTestMode0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Block');
      console.info("[testhitTestMode0002] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      console.info("[testhitTestMode0002] hitTestBehavior value :" + JSON.parse(strJson).$attrs.hitTestBehavior);
      done();
    });
  })
}
