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

export default function textInputCaretPositionTest() {
  describe('textInputCaretPositionTest', function () {
    beforeEach(async function (done) {
      console.info("textInputCaretPositionTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputCaretPosition',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputcaretPosition state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputcaretPosition pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputcaretPosition page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputcaretPosition page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputCaretPositionTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputCaretPositionTest after each called");
    })



    /**
     * @tc.number  textInputcaretPosition0100
     * @tc.name    Test the caretPosition property of the TextInput component
     * @tc.desc    set the caretPosition property value is 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputcaretPosition0100', 0, async function (done) {
      var tagName = 'textInputcaretPosition0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData1 = {
          data: {
            "caretPosition": 10,
          }
        }
        let innerEvent1 = {
          eventId: 880,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('key_textinput_caretposition');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$attrs.caretPosition).assertEqual('10');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputcaretPosition0200
     * @tc.name    Test the caretPosition property of the TextInput component
     * @tc.desc    set the caretPosition property value is 5.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputcaretPosition0200', 0, async function (done) {
      var tagName = 'textInputcaretPosition0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData2 = {
          data: {
            "caretPosition": 5.5,
          }
        }
        let innerEvent2 = {
          eventId: 881,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson2 = getInspectorByKey('key_textinput_caretposition');
      let obj2 = JSON.parse(strJson2);
      console.info('[' + tagName + '] component obj2 is: ' + JSON.stringify(obj2));
      expect(obj2.$attrs.caretPosition).assertEqual('5');
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputcaretPosition0300
     * @tc.name    Test the caretPosition property of the TextInput component
     * @tc.desc    set the caretPosition property value is -1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputcaretPosition0300', 0, async function (done) {
      var tagName = 'textInputcaretPosition0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData3 = {
          data: {
            "caretPosition": -1,
          }
        }
        let innerEvent3 = {
          eventId: 882,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson3 = getInspectorByKey('key_textinput_caretposition');
      let obj3 = JSON.parse(strJson3);
      console.info('[' + tagName + '] component obj3 is: ' + JSON.stringify(obj3));
      expect(obj3.$attrs.caretPosition).assertEqual('0');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
