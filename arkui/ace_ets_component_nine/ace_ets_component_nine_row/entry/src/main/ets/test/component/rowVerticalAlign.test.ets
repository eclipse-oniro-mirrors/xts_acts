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

export default function rowVerticalAlignTest() {
  describe('verticalAlignTest', function () {
    beforeEach(async function (done) {
      console.info("VerticalAlign beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/rowVerticalAlign',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VerticalAlign state pages: " + JSON.stringify(pages));
        if (!("RowVerticalAlign" == pages.name)) {
          console.info("get RowVerticalAlign pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push RowVerticalAlign page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowVerticalAlign page error: " + err);
      }
      await Utils.sleep(1000)
      console.info("Row_VerticalAlign beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("VerticalAlign after each called");
    }) 
    
     /**
     * @tc.number ROW_RowAlignItems_10010
     * @tc.name   testRowAlignItemsVerticalAlignTop
     * @tc.desc   The AlignItems property of the ROW component is set to VerticalAlign.Top
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0  
     */    
    it('testRowAlignItemsVerticalAlignTop', 0, async function (done) {
      var tagName = 'testRowAlignItemsVerticalAlignTop';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "VerticalAlign": VerticalAlign.Top,
          }
        }
        var innerEvent = {
          eventId: 311,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('key_row_VerticalAlign');
      let obj = JSON.parse(strJson);
      
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignItems));
      console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.alignItems).assertEqual("VerticalAlign.Top");    
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number ROW_RowAlignItems_10020
     * @tc.name   testRowAlignItemsVerticalAlignCenter
     * @tc.desc   The AlignItems property of the ROW component is set to VerticalAlign.Center
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0  
     */      
    it('testRowAlignItemsVerticalAlignCenter', 0, async function (done) {
      var tagName = 'testRowAlignItemsVerticalAlignCenter';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "VerticalAlign": VerticalAlign.Center,
          }
        }
        var innerEvent = {
          eventId: 312,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('key_row_VerticalAlign');
      let obj = JSON.parse(strJson);
      
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignItems));
      console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.alignItems).assertEqual("VerticalAlign.Center");    
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number ROW_RowAlignItems_10030
    * @tc.name   testRowAlignItemsVerticalAlignBottom
    * @tc.desc   The AlignItems property of the ROW component is set to VerticalAlign.Bottom
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  0  
    */      
    it('testRowAlignItemsVerticalAlignBottom', 0, async function (done) {
      var tagName = 'testRowAlignItemsVerticalAlignBottom';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "VerticalAlign": VerticalAlign.Bottom,
          }
        }
        var innerEvent = {
          eventId: 313,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('key_row_VerticalAlign');
      let obj = JSON.parse(strJson);
      
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignItems));
      console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.alignItems).assertEqual("VerticalAlign.Bottom");    
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });       

  })
}
