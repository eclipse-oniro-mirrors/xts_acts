/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function Path2DLineToMoveToNullUndefinedTest() {
  describe('Path2DLineToMoveToNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("Path2DLineToMoveToNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/path2D/Path2DLineToMoveToNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Path2DLineToMoveToNullUndefined state pages: " + JSON.stringify(pages));
        if (!("Path2DLineToMoveToNullUndefined" == pages.name)) {
          console.info("get Path2DLineToMoveToNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Path2DLineToMoveToNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Path2DLineToMoveToNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   Path2D_lineTo_test_null_undefined
     * @tc.number SUB_ACE_PATH2D_LINETO_NULL_UNDEFINED_0100
     * @tc.desc   Test the lineTo method of Path2D with null/undefined parameters
     * @tc.type   FunctionTest
     * @tc.size   MediumTest
     * @tc.level  0
     */
    it('Path2D_lineTo_test_null_undefined', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_lineto_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });

    /**
     * @tc.name   Path2D_moveTo_test_null_undefined
     * @tc.number SUB_ACE_PATH2D_MOVETO_NULL_UNDEFINED_0100
     * @tc.desc   Test the moveTo method of Path2D with null/undefined parameters
     * @tc.type   FunctionTest
     * @tc.size   MediumTest
     * @tc.level  0
     */
    it('Path2D_moveTo_test_null_undefined', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_moveto_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });
  });
}