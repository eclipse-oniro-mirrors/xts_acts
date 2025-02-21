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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function grid_rowOnBreakpointChangeJsunit() {
  describe('grid_rowOnBreakpointChangeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/grid_row',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid_row state success " + JSON.stringify(pages));
        if (!("grid_row" == pages.name)) {
          console.info("get grid_row state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push grid_row page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid_row page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("grid_rowOnBreakpointChange after each called");
    });

    /*
     * @tc.number    SUB_ACE_BASIC_ETS_API_001
     * @tc.name      testgrid_rowOnBreakpointChange001
     * @tc.desic     acegrid_rowOnBreakpointChangeEtsTest001
     */
    it('testgrid_rowOnBreakpointChange001', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridRow');
      expect(obj.$attrs.width).assertEqual("100vp");
      console.info("[testgrid_rowOnBreakpointChange001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number    SUB_ACE_BASIC_ETS_API_002
     * @tc.name      testgrid_rowOnBreakpointChange002
     * @tc.desic     acegrid_rowOnBreakpointChangeEtsTest002
     */
    it('testgrid_rowOnBreakpointChange002', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridRow');
      expect(obj.$attrs.height).assertEqual("100vp");
      console.info("[testgrid_rowOnBreakpointChange002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number    SUB_ACE_BASIC_ETS_API_003
     * @tc.name      testgrid_rowOnBreakpointChange003
     * @tc.desic     acegrid_rowOnBreakpointChangeEtsTest003
     */
    it('testgrid_rowOnBreakpointChange003', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange003] component backgroundColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridRow');
      expect(obj.$attrs.backgroundColor).assertEqual("0xFF0000");
      console.info("[testgrid_rowOnBreakpointChange003] backgroundColor value :" + obj.$attrs.backgroundColor);
      done();
    });
  })
}
