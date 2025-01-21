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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function blankJsunit() {
  describe('blankTest', () => {
    beforeEach(async (done: Function) => {
      console.info("blank beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/blank',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blank state pages: " + JSON.stringify(pages));
        if (!("blank" == pages.name)) {
          console.info("get blank state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
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

    it('testBlank01', 0, async (done: Function) => {
      console.info('[testBlank01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('blank');
      console.info("[testBlank01] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Blank');
      expect(JSON.parse(strJson).$attrs.color).assertEqual('#FF0000FF');
      expect(JSON.parse(strJson).$attrs.min).assertEqual('0.00vp');
      done();
    });

    it('testBlank02', 0, async (done: Function) => {
      console.info('[testBlank02] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": Color.Red,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBlank02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBlank02] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('blank');
      console.info("[testBlank02] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.color).assertEqual('#FFFF0000');
      expect(JSON.parse(strJsonNew).$type).assertEqual('Blank');
      done();
    });
  })
}
