/*
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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function selectOnSelectJsunit() {
  describe('selectOnSelectTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/select3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get select state success " + JSON.stringify(pages));
        if (!("select3" == pages.name)) {
          console.info("get select state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push select page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("selectOnSelect after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testselectOnSelect0001
     * @tc.desic         aceselectOnSelectEtsTest0001
     */
    it('testselectOnSelect0001', Level.LEVEL1, async () => {
      console.info('selectOnSelect testselectOnSelect0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Select');
      console.info("[testselectOnSelect0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Select');
      expect(JSON.parse(strJson).$attrs.selected).assertEqual("2");
      console.info("[testselectOnSelect0001] selected value :" + JSON.parse(strJson).$attrs.selected);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testselectOnSelect0002
     * @tc.desic         aceselectOnSelectEtsTest0002
     */
    it('testselectOnSelect0002', Level.LEVEL1, async () => {
      console.info('selectOnSelect testselectOnSelect0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Select');
      console.info("[testselectOnSelect0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Select');
      expect(JSON.parse(strJson).$attrs.value).assertEqual("TTT");
      console.info("[testselectOnSelect0002] height value :" + JSON.parse(strJson).$attrs.height);

    });
  })
}
