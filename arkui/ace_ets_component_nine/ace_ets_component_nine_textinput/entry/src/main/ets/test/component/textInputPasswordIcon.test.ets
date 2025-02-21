/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputPasswordIconTest() {
  describe('textInputPasswordIconTest', function () {
    beforeEach(async function (done) {
      console.info("textInputPasswordIconTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputPasswordIcon',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputPasswordIcon state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputPasswordIcon pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputPasswordIcon page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputPasswordIcon page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputPasswordIcon beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputPasswordIcon after each called");
    }) 

    /**
     * @tc.number  textInputPasswordIcon0100
     * @tc.name    Test the passwordIcon property of the textinput component
     * @tc.desc    set the passwordIcon property value is "/test/assert/icon.png"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputPasswordIcon0100', 0, async function (done) {
      let tagName = 'textInputPasswordIcon0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(2000)
       
      let strJsonNew = getInspectorByKey('key_textinput_passwordIcon');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text passwordIcon is: ' + JSON.stringify(obj.$attrs.passwordIcon));
      let objpasswordIcon = JSON.parse(obj.$attrs.passwordIcon);
      expect(objpasswordIcon.onIconSrc).assertEqual('/test/assert/icon.png');
      expect(objpasswordIcon.offIconSrc).assertEqual('/test/assert/icon.png');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
})
}
