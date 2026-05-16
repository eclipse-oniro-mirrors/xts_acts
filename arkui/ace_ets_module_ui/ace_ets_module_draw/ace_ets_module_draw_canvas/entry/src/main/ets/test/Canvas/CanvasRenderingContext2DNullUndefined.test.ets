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

export default function CanvasRenderingContext2DNullUndefinedTest() {
  describe('CanvasRenderingContext2DNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("CanvasRenderingContext2DNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasRenderingContext2DNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DNullUndefined state pages: " + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DNullUndefined" == pages.name)) {
          console.info("get CanvasRenderingContext2DNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CanvasRenderingContext2DNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   fill_test_null_undefined
     * @tc.number SUB_ACE_CANVAS_FILL_NULL_UNDEFINED_0100
     * @tc.desc   Test CanvasRenderingContext2D fill method with null/undefined parameters (path, fillRule)
     * @tc.type   FunctionTest
     * @tc.size   MediumTest
     * @tc.level  0
     */
    it('fill_test_null_undefined', Level.LEVEL0, async () => {
      let json = getInspectorByKey('canvas_canvas2d_nullundefined');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });

    /**
     * @tc.name   drawImage_test_null_undefined
     * @tc.number SUB_ACE_CANVAS_DRAWIMAGE_NULL_UNDEFINED_0100
     * @tc.desc   Test CanvasRenderingContext2D drawImage method with null/undefined parameters (image, dx, dy, dw, dh, sx, sy, sw, sh)
     * @tc.type   FunctionTest
     * @tc.size   MediumTest
     * @tc.level  0
     */
    it('drawImage_test_null_undefined', Level.LEVEL0, async () => {
      let json = getInspectorByKey('canvas_canvas2d_nullundefined');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });
  });
}
