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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function text_inputPhoneNumberJsunit() {
  describe('text_inputPhoneNumberTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/text_input',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text_input state success " + JSON.stringify(pages));
        if (!("text_input" == pages.name)) {
          console.info("get text_input state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push text_input page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push text_input page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("text_inputPhoneNumber after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtext_inputPhoneNumber0001
     * @tc.desic         acetext_inputPhoneNumberEtsTest0001
     */
    it('testtext_inputPhoneNumber0001', 0, async function (done) {
      console.info('text_inputPhoneNumber testtext_inputPhoneNumber0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('PhoneNumberText');
      console.info("[testtext_inputPhoneNumber0001] component type strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      console.info("[testtext_inputPhoneNumber0001] type value :" + obj.$attrs.type);
      done();
    });

    it('testtextInputStyle0001', 0, async function (done) {
      console.info('textInputStyle testtextInputStyle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textInput1');
      console.info("[testtextInputStyle0001] strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Default');
      console.info("[testtextInputStyle0001] textInput1 InputStyle value :" + obj.$attrs.style);
      done();
    });

    it('testtextInputStyle0002', 0, async function (done) {
      console.info('textInputStyle testtextInputStyle0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textInput2');
      console.info("[testtextInputStyle0002] strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Inline');
      console.info("[testtextInputStyle0002] textInput2 inputStyle value :" + obj.$attrs.style);
      done();
    });
  })
}
