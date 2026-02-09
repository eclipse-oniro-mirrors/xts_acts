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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function refreshJsunit() {
  describe('refreshTest', () => {
    beforeAll(async (done: Function) => {
      console.info("refreshTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/refresh',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refresh state success " + JSON.stringify(pages));
        if (!("refresh" == pages.name)) {
          console.info("get refresh state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push refresh page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   refreshTest_001
     * @tc.number testRefresh_001
     * @tc.desc   Set pullToRefresh values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('refreshTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('refresh refreshTest_001 START');
      let strJson = getInspectorByKey('refreshKey1');
      console.info("[refreshTest_001] obj " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[refreshTest_001] pullToRefresh " + JSON.stringify(JSON.parse(strJson).$attrs.pullToRefresh));

      expect(JSON.parse(strJson).$attrs.pullToRefresh).assertEqual(true);
      console.info('refresh refreshTest_001 END');
      done();
    });

    /**
     * @tc.name   refreshTest_002
     * @tc.number testRefresh_002
     * @tc.desc   Set refreshOffset values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('refreshTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('refresh refreshTest_002 START');
      let strJson = getInspectorByKey('refreshKey1');
      console.info("[refreshTest_002] obj " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[refreshTest_002] refreshOffset " + JSON.stringify(JSON.parse(strJson).$attrs.refreshOffset));

      expect(JSON.parse(strJson).$attrs.refreshOffset).assertEqual("64.00vp");
      console.info('refresh refreshTest_002 END');
      done();
    });

    /**
     * @tc.name   refreshTest_003
     * @tc.number testRefresh_003
     * @tc.desc   Set pullDownRatio values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('refreshTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('refresh refreshTest_003 START');
      let strJson = getInspectorByKey('refreshKey1');
      console.info("[refreshTest_003] obj " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[refreshTest_003] pullDownRatio " + JSON.stringify(JSON.parse(strJson).$attrs.pullDownRatio));

      expect(JSON.parse(strJson).$attrs.pullDownRatio).assertEqual(1);
      console.info('refresh refreshTest_003 END');
      done();
    });
  })
}
