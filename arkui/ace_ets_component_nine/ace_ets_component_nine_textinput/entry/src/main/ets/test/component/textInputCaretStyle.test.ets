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

export default function textInputCaretStyleTest() {
  describe('textInputCaretStyleTest', function () {
    beforeEach(async function (done) {
      console.info("textInputCaretStyleTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputCaretStyle',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputcaretStyle state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputcaretStyle pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputcaretStyle page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputcaretStyle page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputcaretStyleTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputcaretStyleTest after each called");
    })



    /**
     * @tc.number  textInputCaretStyle0100
     * @tc.name    Test the caretStyle property of the TextInput component
     * @tc.desc    set the caretStyle property value is {width:-1}
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputCaretStyle0100', 0, async function (done) {
      var tagName = 'textInputCaretStyle0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)


      try {
        let defaultJson = JSON.stringify({ width: -1 })
        var eventData = {
          data: {
            "caretStyleValue": defaultJson
          }
        }
        var innerEvent = {
          eventId: 890,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = getInspectorByKey('key_textinput_caretstyle');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text caretstyle is: ' + JSON.stringify(obj.$attrs.caretStyle));

      let objcaretStyle = JSON.parse(obj.$attrs.caretStyle);
      expect(objcaretStyle.width).assertEqual('2.00vp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputCaretStyle0200
     * @tc.name    Test the caretStyle property of the TextInput component
     * @tc.desc    set the caretStyle property value is {width:'30'}
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputCaretStyle0200', 0, async function (done) {
      var tagName = 'textInputCaretStyle0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)


      try {
        let defaultJson = JSON.stringify({ width: '30' })
        var eventData = {
          data: {
            "caretStyleValue": defaultJson
          }
        }
        var innerEvent = {
          eventId: 891,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = getInspectorByKey('key_textinput_caretstyle');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text caretstyle is: ' + JSON.stringify(obj.$attrs.caretStyle));
      let objcaretStyle = JSON.parse(obj.$attrs.caretStyle);
      expect(objcaretStyle.width).assertEqual('30.00vp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputCaretStyle0300
     * @tc.name    Test the caretStyle property of the TextInput component
     * @tc.desc    set the caretStyle property value is {width:'10tpx'}
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputCaretStyle0300', 0, async function (done) {
      var tagName = 'textInputCaretStyle0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)


      try {
        let defaultJson = JSON.stringify({ width: '10tpx' })
        var eventData = {
          data: {
            "caretStyleValue": defaultJson
          }
        }
        var innerEvent = {
          eventId: 892,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = getInspectorByKey('key_textinput_caretstyle');

      console.info(' Text Object json is:' + strJsonNew);
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text caretstyle is: ' + JSON.stringify(obj.$attrs.caretStyle));

      let objcaretStyle = JSON.parse(obj.$attrs.caretStyle);
      expect(objcaretStyle.width).assertEqual('2.00vp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputCaretStyle0400
     * @tc.name    Test the caretStyle property of the TextInput component
     * @tc.desc    set the caretStyle property value is {width:'app.float.length_xl'}
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputCaretStyle0400', 0, async function (done) {
      var tagName = 'textInputCaretStyle0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)


      try {
        let defaultJson = JSON.stringify({ width: 'app.float.length_xl' })
        var eventData = {
          data: {
            "caretStyleValue": defaultJson
          }
        }
        var innerEvent = {
          eventId: 893,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = getInspectorByKey('key_textinput_caretstyle');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text caretstyle is: ' + JSON.stringify(obj.$attrs.caretStyle));

      let objcaretStyle = JSON.parse(obj.$attrs.caretStyle);
      expect(objcaretStyle.width).assertEqual('50.00fp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
