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

export default function grid_colSpanJsunit() {
  describe('grid_colSpanTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/grid_col',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid_col state success " + JSON.stringify(pages));
        if (!("grid_col" == pages.name)) {
          console.info("get grid_col state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push grid_col page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid_col page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("grid_colSpan after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgrid_colSpan0001
     * @tc.desic        acegrid_colSpanEtsTest0001
     */
    it('testgrid_colSpan0001', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_colSpan0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('gridContainer');
      console.info("[testgrid_colSpan0001] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridCol');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testgrid_colSpan0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgrid_col_refactor_name002
     * @tc.desc         acegrid_gridColRefactorName0002
     */
    it('testgrid_col_refactor_name002', 0, async function (done) {
      console.info('testgrid_col_refactor_name002 START');
      await Utils.sleep(2000);
      let options = {
        uri: 'pages/grid_col_muli',
      }
      try {
            await router.push(options);
            await Utils.sleep(2000);
            let strJson = getInspectorByKey('2');
            let obj = JSON.parse(strJson);
            expect(obj.$type).assertEqual('GridCol');
            console.info("[testgrid_col_refactor_name002] component height strJson:" + JSON.stringify(obj.$attrs));
            expect(obj.$attrs.gridColOffset).assertEqual("3");
      } catch (err) {
          console.error("push grid_col page error: " + err);
      }
      done();
    });

  })
}
