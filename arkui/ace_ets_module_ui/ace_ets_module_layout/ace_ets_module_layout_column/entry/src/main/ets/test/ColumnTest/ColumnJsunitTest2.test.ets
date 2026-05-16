
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils';

export default function ColumnJsunitTest2() {
  describe('ColumnJsunitTest2', async () => {
    beforeEach(async (done: Function) => {
      console.info("column beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/columnPage',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get column state pages:" + JSON.stringify(pages));
        if (!("column" == pages.name)) {
          console.info("get column state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push column page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push column page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("column after each called");
    });

    /**
     * @tc.name   testColumn01
     * @tc.number testColumn01
     * @tc.desc   test Column alignItems is Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumn01', Level.LEVEL0, async (done: Function) => {
      console.info('[testColumn01] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('alignItemsColumn');
      console.info("[testColumn01] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.alignItems).assertEqual('HorizontalAlign.Start');
      console.info('[testColumn01] END');
      done()
    });

    /**
     * @tc.name   testColumn02
     * @tc.number testColumn02
     * @tc.desc   test Column alignItems is Center
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumn02', Level.LEVEL0, async (done: Function) => {
      console.info('[testColumn02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "alignItems": HorizontalAlign.Center
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColumn02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColumn02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('alignItemsColumn');
      console.info("[testColumn02] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.info('[testColumn02] END');
      done()
    });
  })
}
