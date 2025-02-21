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

export default function textHeightAdaptivePolicyTest() {
  describe('textHeightAdaptivePolicyTest', function () {
    beforeEach(async function (done) {
      console.info("textHeightAdaptivePolicyTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textHeightAdaptivePolicyPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get heightAdaptivePolicy state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get heightAdaptivePolicy pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push heightAdaptivePolicy page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push heightAdaptivePolicy page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("heightAdaptivePolicy beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("heightAdaptivePolicy after each called");
    })

    /**
     * @tc.number testTextHeightAdaptivePolicy0100
     * @tc.name   Test the heightAdaptivePolicy property of the text component
     * @tc.desc   set the heightAdaptivePolicy property value is TextHeightAdaptivePolicy.MAX_LINES_FIRST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextHeightAdaptivePolicy0100', 0, async function (done) {
      var tagName = 'testTextTextOverflow0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "heightAdaptivePolicy": TextHeightAdaptivePolicy.MAX_LINES_FIRST
          }
        }
        var innerEvent = {
          eventId: 410,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy). assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testTextHeightAdaptivePolicy0200
     * @tc.name   Test the heightAdaptivePolicy property of the text component
     * @tc.desc   set the heightAdaptivePolicy property value is TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextHeightAdaptivePolicy0200', 0, async function (done) {
      var tagName = 'testTextTextOverflow0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "heightAdaptivePolicy": TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
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
    
      let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy). assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testTextHeightAdaptivePolicy0300
     * @tc.name   Test the heightAdaptivePolicy property of the text component
     * @tc.desc   set the heightAdaptivePolicy property value is TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextHeightAdaptivePolicy0300', 0, async function (done) {
      var tagName = 'testTextTextOverflow0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "heightAdaptivePolicy": TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
          }
        }
        var innerEvent = {
          eventId: 412,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy). assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
