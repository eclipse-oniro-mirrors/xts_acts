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

interface optionsObj {
  uri: string
}

export default function columnHorizontalAlignTest() {
  describe('HorizontalAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("HorizontalAlignn beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/component/columnHorizontalAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HorizontalAlign state pages: " + JSON.stringify(pages));
        if (!("columnHorizontalAlign" == pages.name)) {
          console.info("get columnHorizontalAlign pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push columnHorizontalAlign page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnHorizontalAlign page error: " + err);
      }
      await Utils.sleep(1000)
      console.info("Column_columnHorizontalAlign beforeEach end");
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("HorizontalAlign after each called");
    })
     /**
     * @tc.number Column_AlignItems_10010
     * @tc.name   testColumnAlignItemsVerticalAlignStart
     * @tc.desc   The AlignItems property of the Column component is set to HorizontalAlign.Start
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testColumnHorizontalAlignHorizontalAlignStart', 0, async (done: Function) => {
      let tagName = 'testColumnHorizontalAlignHorizontalAlignStart';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "HorizontalAlign": HorizontalAlign.Start,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 311,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_column_HorizontalAlign');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignItems));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.alignItems).assertEqual("HorizontalAlign.Start");    
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number Column_AlignItems_10020
     * @tc.name   testColumnAlignItemsVerticalAlignCenter
     * @tc.desc   The AlignItems property of the Column component is set to HorizontalAlign.Center
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testColumnHorizontalAlignHorizontalAlignCenter', 0, async (done: Function) => {
      let tagName = 'testColumnHorizontalAlignHorizontalAlignCenter';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "HorizontalAlign": HorizontalAlign.Center,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 312,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_column_HorizontalAlign');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignItems));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.alignItems).assertEqual("HorizontalAlign.Center");    
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number Column_AlignItems_10030
     * @tc.name   testColumnAlignItemsVerticalAlignEnd
     * @tc.desc   The AlignItems property of the Column component is set to HorizontalAlign.End
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testColumnHorizontalAlignHorizontalAlignEnd', 0, async (done: Function) => {
      let tagName = 'testColumnHorizontalAlignHorizontalAlignEnd';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "HorizontalAlign": HorizontalAlign.End,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 313,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_column_HorizontalAlign');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignItems));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.alignItems).assertEqual("HorizontalAlign.End");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}