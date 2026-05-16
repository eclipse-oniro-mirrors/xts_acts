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
export default function AntialiasTest() {
  describe('AntialiasTest', () => {
    beforeAll(async (done: Function) => {
      console.info("AntialiasTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/Antialias",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AntialiasTest state pages: " + JSON.stringify(pages));
        if (!("Antialias" == pages.name)) {
          console.info("get AntialiasTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AntialiasTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AntialiasTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(async () => {
    })

    /**
     * @tc.name   AntialiasTest_0100
     * @tc.number SUB_ARKUI_API_CANVAS_AntialiasTest_0100
     * @tc.desc   Test CanvasRenderingContext2D antialias property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AntialiasTest_0100', Level.LEVEL0, async () => {
      console.info('[AntialiasTest_0100] START');

      let strJson = getInspectorByKey('Antialias_canvas_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(AppStorage.get('Antialias_true_value')).assertEqual(true);
      AppStorage.delete('Antialias_true_value');

      console.info('[AntialiasTest_0100] END');
    })

    /**
     * @tc.name   AntialiasTest_0200
     * @tc.number SUB_ARKUI_API_CANVAS_AntialiasTest_0200
     * @tc.desc   Test CanvasRenderingContext2D antialias property with false value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AntialiasTest_0200', Level.LEVEL0, async () => {
      console.info('[AntialiasTest_0200] START');

      let strJson = getInspectorByKey('Antialias_canvas_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(AppStorage.get('Antialias_false_value')).assertEqual(false);
      AppStorage.delete('Antialias_false_value');

      console.info('[AntialiasTest_0200] END');
    })

    /**
     * @tc.name   AntialiasTest_0300
     * @tc.number SUB_ARKUI_API_CANVAS_AntialiasTest_0300
     * @tc.desc   Test CanvasRenderingContext2D antialias property with undefined value (default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AntialiasTest_0300', Level.LEVEL0, async () => {
      console.info('[AntialiasTest_0300] START');

      let strJson = getInspectorByKey('Antialias_canvas_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(AppStorage.get('Antialias_undefined_value')).assertEqual(undefined);
      AppStorage.delete('Antialias_undefined_value');

      console.info('[AntialiasTest_0300] END');
    })
  })
}
