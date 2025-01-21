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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputShowPasswordIconTest() {
  describe('textInputShowPasswordIconTest', function () {
    beforeEach(async function (done) {
      console.info("textInputShowPasswordIconTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputShowPasswordIcon',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputShowPasswordIcon state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputShowPasswordIcon pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputShowPasswordIcon page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputShowPasswordIcon page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputShowPasswordIconTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputShowPasswordIconTest after each called");
    })



    /**
     * @tc.number  textInputShowPasswordIcon0100
     * @tc.name    Test the showPassword property of the textinput component
     * @tc.desc    set the showPassword property value is true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputShowPasswordIcon0100', 0, async function (done) {
      var tagName = 'textInputShowPasswordIcon0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData1 = {
          data: {
            "showPasswordIcon": true,
          }
        }
        let innerEvent1 = {
          eventId: 970,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('key_textinput_showpasswordicon');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('TextInput');
      expect(obj1.$attrs.showPasswordIcon).assertEqual(true);

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputShowPasswordIcon0200
     * @tc.name    Test the showPassword property of the textinput component
     * @tc.desc    set the showPassword property value is false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputShowPasswordIcon0200', 0, async function (done) {
      var tagName = 'textInputShowPasswordIcon0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)


      try {
        let eventData2 = {
          data: {
            "showPasswordIcon": false,
          }
        }
        let innerEvent2 = {
          eventId: 971,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson2 = getInspectorByKey('key_textinput_showpasswordicon');
      let obj2 = JSON.parse(strJson2);
      console.info('[' + tagName + '] component obj2 is: ' + JSON.stringify(obj2));
      expect(obj2.$type).assertEqual('TextInput');
      expect(obj2.$attrs.showPasswordIcon).assertEqual(false);

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
