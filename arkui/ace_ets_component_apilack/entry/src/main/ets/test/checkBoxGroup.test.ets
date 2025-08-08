/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function checkBoxGroupSelectAllJsunit() {
  describe('checkBoxGroupSelectAllTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/checkBoxGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBoxGroup state success " + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get checkBoxGroup state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push checkBoxGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBoxGroup page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("checkBoxGroupSelectAll after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcheckBoxGroupSelectAll0001
     * @tc.desic         acecheckBoxGroupSelectAllEtsTest0001
     */
    it('testcheckBoxGroupSelectAll0001', Level.LEVEL0, async () => {
      console.info('checkBoxGroupSelectAll testcheckBoxGroupSelectAll0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxGroup');
      console.info("[testcheckBoxGroupSelectAll0001] component selectedColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('CheckboxGroup');
      expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual("#FFED6F21");
      console.info("[testcheckBoxGroupSelectAll0001] selectedColor value :" + JSON.parse(strJson).$attrs.selectedColor);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcheckBoxGroupSelectAll0002
     * @tc.desic         acecheckBoxGroupSelectAllEtsTest0002
     */
    it('testcheckBoxGroupSelectAll0002', Level.LEVEL0, async () => {
      console.info('checkBoxGroupSelectAll testcheckBoxGroupSelectAll0002 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isSelect": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60203,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testcheckBoxGroupSelectAll0002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testcheckBoxGroupSelectAll0002] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('CheckboxOne');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testcheckBoxGroupSelectAll0002] obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual("#FF39A2DB");
      console.info("[testcheckBoxGroupSelectAll0002] selectedColor value :" + JSON.parse(strJson).$attrs.selectedColor);
      console.info('testcheckBoxGroupSelectAll0002 END');

    });
  })
}
