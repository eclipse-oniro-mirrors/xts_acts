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

export default function textCopyOptionTest() {
  describe('textCopyOptionTest', function () {
    beforeEach(async function (done) {
      console.info("textCopyOptionTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textCopyOption',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textCopyOption state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textCopyOption pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textCopyOption page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textCopyOption page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textCopyOption beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textCopyOption after each called");
    }) 

    /**
     * @tc.number textCopyOption0100
     * @tc.name   Test the CopyOption property of the text component
     * @tc.desc   set the CopyOption property value is CopyOptions.None
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextCopyOption0100', 0, async function (done) {
      var tagName = 'testTextCopyOption0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "copyOption":  CopyOptions.None
          }
        }
        var innerEvent = {
          eventId: 810,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_copyoption');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text copyOption is: ' + JSON.stringify(obj.$attrs.copyOption));
 
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.None');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textCopyOption0200
     * @tc.name   Test the CopyOption property of the text component
     * @tc.desc   set the CopyOption property value is CopyOptions.InApp
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextCopyOption0200', 0, async function (done) {
      var tagName = 'testTextCopyOption0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "copyOption":  CopyOptions.InApp
          }
        }
        var innerEvent = {
          eventId: 811,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_copyoption');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text copyOption is: ' + JSON.stringify(obj.$attrs.copyOption));
 
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.InApp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number textCopyOption0300
     * @tc.name   Test the CopyOption property of the text component
     * @tc.desc   set the CopyOption property value is CopyOptions.LocalDevice
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextCopyOption0300', 0, async function (done) {
      var tagName = 'testTextCopyOption0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "copyOption":  CopyOptions.LocalDevice
          }
        }
        var innerEvent = {
          eventId: 812,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_copyoption');

      console.info(' Text Object json is:' + strJsonNew);
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text copyOption is: ' + JSON.stringify(obj.$attrs.copyOption));
 
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.Local');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number textCopyOption0400
     * @tc.name   Test the CopyOption property of the text component
     * @tc.desc   set the CopyOption property value is CopyOptions.CROSS_DEVICE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextCopyOption0400', 0, async function (done) {
      var tagName = 'testTextCopyOption0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "copyOption":  CopyOptions.CROSS_DEVICE
          }
        }
        var innerEvent = {
          eventId: 813,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_copyoption');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text copyOption is: ' + JSON.stringify(obj.$attrs.copyOption));
 
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.Distributed');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
