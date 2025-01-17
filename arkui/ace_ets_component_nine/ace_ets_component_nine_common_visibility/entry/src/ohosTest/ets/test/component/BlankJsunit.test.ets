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
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function blankJsunit() {
  describe('blankTest', () => {
    beforeEach(async (done: Function) => {
      console.info("blank beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/blankPage',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blank state pages: " + JSON.stringify(pages));
        if (!("blankPage" == pages.name)) {
          console.info("get blank state pages.name: " + JSON.stringify(pages.name));
          result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push blank page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push blank page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("blank after each called");
    })
    /**
     * @tc.number Common_Visibility_10010
     * @tc.name testBlank01
     * @tc.desc The Visibility property of the Common component is set to Visibility.Visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBlank01', 0, async (done: Function) => {
      console.info('[testBlank01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('blank');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testBlank01] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Blank');
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      expect(obj.$attrs.min).assertEqual('0.00vp');
      done();
    });
    /**
     * @tc.number Common_Visibility_10020
     * @tc.name testBlank02
     * @tc.desc The Visibility property of the Common component is set to Visibility.Hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBlank02', 0, async (done: Function) => {
      console.info('[testBlank02] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBlank02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBlank02] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('blank');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testBlank02] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.visibility).assertEqual("Visibility.Hidden");
      expect(objNew.$type).assertEqual('Blank');
      done();
    });
    /**
     * @tc.number Common_Visibility_10030
     * @tc.name testBlank03
     * @tc.desc The Visibility property of the Common component is set to Visibility.None
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBlank03', 0, async (done: Function) => {
      console.info('[testBlank02] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 2,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBlank02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBlank02] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('blank');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testBlank02] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.visibility).assertEqual("Visibility.None");
      expect(objNew.$type).assertEqual('Blank');
      done();
    });
  })
}