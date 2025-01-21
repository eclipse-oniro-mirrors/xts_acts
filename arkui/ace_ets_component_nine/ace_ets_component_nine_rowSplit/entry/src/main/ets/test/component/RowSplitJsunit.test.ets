// @ts-nocheck
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

export default function rowSplitJsunit() {
  describe('rowSplitTest', function () {
    beforeEach(async function (done) {
      console.info("rowSplit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/rowSplitPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rowSplit state pages: " + JSON.stringify(pages));
        if (!("rowSplitPage" == pages.name)) {
          console.info("get rowSplit pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push rowSplit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rowSplit page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("rowSplit after each called");
    })
   
    /**
     * @tc.number testRowSplitResizeable01
     * @tc.name   Test the resizeable property of the RowSplit component
     * @tc.desc   set the resizeable property value is false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testRowSplitResizeable01', 0, async function (done) {
      var tagName = 'testRowSplitResizeable01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "resizeable": false
          }
        }
        var innerEvent = {
          eventId: 3501,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('rowSplit');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));

      console.info('[' + tagName + '] component objNew resizeable is: ' + objNew.$attrs.resizeable);
      expect(objNew.$attrs.resizeable).assertEqual("false");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testRowSplitResizeable02
     * @tc.name   Test the resizeable property of the RowSplit component
     * @tc.desc   set the resizeable property value is true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */    
    it('testRowSplitResizeable02', 0, async function (done) {
      var tagName = 'testRowSplitResizeable02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "resizeable": true
          }
        }
        var innerEvent = {
          eventId: 3502,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('rowSplit');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      console.info('[' + tagName + '] component objNew resizeable is: ' + objNew.$attrs.resizeable);
      expect(objNew.$attrs.resizeable).assertEqual("true"); 

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
