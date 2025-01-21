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

export default function textDraggableTest() {
  describe('textDraggableTest', function () {
    beforeEach(async function (done) {
      console.info("textDraggableTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textDraggable',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textDraggable state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textDraggable pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textDraggable page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textDraggable page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textDraggable beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textDraggable after each called");
    }) 

    /**
     * @tc.number textDraggable0100
     * @tc.name   Test the draggable property of the text component
     * @tc.desc   set the draggable property value is false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextDraggable0100', 0, async function (done) {
      var tagName = 'testTextDraggable0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "textDraggable": false
          }
        }
        var innerEvent = {
          eventId: 411,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textdraggable');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text draggable is: ' + JSON.stringify(obj.$attrs.draggable));
 
      expect(obj.$attrs.draggable).assertEqual('false');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textDraggable0200
     * @tc.name   Test the draggable property of the text component
     * @tc.desc   set the draggable property value is true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextDraggable0200', 0, async function (done) {
      var tagName = 'testTextDraggable0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "textDraggable": true
          }
        }
        var innerEvent = {
          eventId: 411,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textdraggable');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text draggable is: ' + JSON.stringify(obj.$attrs.draggable));
 
      expect(obj.$attrs.draggable).assertEqual('true');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });    

})
}
