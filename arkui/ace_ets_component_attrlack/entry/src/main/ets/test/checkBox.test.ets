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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function checkBoxGroupJsunit() {
  describe('checkBoxGroupTest', () =>{
    beforeEach(async (done:Function) => {
      console.info("flex beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/checkBox',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBox state success " + JSON.stringify(pages));
        if (!("checkBox" == pages.name)) {
          console.info("get checkBox state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push checkBox page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBox page error: " + err);
      }
      done()
    });

    afterEach(async () =>{
      await Utils.sleep(1000);
      console.info("checkBoxGroup after each called");
    });

    it('testcheckBoxGroup001', 0, async (done:Function) => {
      console.info('checkBoxGroup testcheckBoxGroup001 START');
      await Utils.sleep(2000);
      try {
        console.info("testcheckBoxGroup_0011 click result is: " + JSON.stringify(sendEventByKey('CheckboxGroup', 10, "")));
        let strJson: string = getInspectorByKey('Checkbox2');
        console.info("[testcheckBoxGroup001] component select strJson:" + strJson);
        expect(JSON.parse(strJson).$type).assertEqual('Checkbox');
        expect(JSON.parse(strJson).$attrs.select).assertEqual("false");
      } catch (err) {
        console.info("testcheckBoxGroup_0011 on click err : " + JSON.stringify(err));
      }
      console.info('testcheckBoxGroup001 END');
      done();
    });
  })
}
