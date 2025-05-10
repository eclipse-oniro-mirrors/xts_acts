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
import Utils from '../../MainAbility/common/Utils'

export default function datePickerLunarJsunit() {
  describe('datePickerLunarTest', () =>{
    beforeEach(async (done:Function) => {
      console.info("flex beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/datePickerNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get datePicker state success " + JSON.stringify(pages));
        if (!("datePicker" == pages.name)) {
          console.info("get datePicker state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push datePicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
      done()
    });

    afterEach(async () =>{
      await Utils.sleep(1000);
      console.info("datePickerLunar after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         testdatePickerLunar001
     * @tc.desic         acedatePickerLunarEtsTest001
     */
    it('testdatePickerLunar001', 0, async (done:Function) => {
      console.info('datePickerLunar testdatePickerLunar001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('DatePicker');
      console.info("[testdatePickerLunar001] component lunar strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('DatePicker');
      expect(JSON.parse(strJson).$attrs.lunar).assertEqual("true");
      console.info("[testdatePickerLunar001] lunar value :" + JSON.parse(strJson).$attrs.lunar);
      done();
    });
  })
}
