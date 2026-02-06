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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';

export default function grid_colSpanJsunit() {
  describe('grid_colSpanTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridCol/grid_col',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid_col state success " + JSON.stringify(pages));
        if (!("grid_col" == pages.name)) {
          console.info("get grid_col state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push grid_col page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid_col page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("grid_colSpan after each called");
    });

    /**
     * @tc.name   testgrid_colSpan0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   acegrid_colSpanEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgrid_colSpan0001',  Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_colSpan0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('gridContainer');
      console.info("[testgrid_colSpan0001] component height strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridCol');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testgrid_colSpan0001] width value :" + JSON.parse(strJson).$attrs.width);

    });
  })
}
