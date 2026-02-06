/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridOffsetRes() {
  describe('gridOffsetRes', () => {
    beforeEach(async (done: Function) => {
      console.info("gridOffsetRes beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/gridOffsetRes",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridOffsetRes state pages:" + JSON.stringify(pages));
        if (!("gridOffsetRes" == pages.name)) {
          console.info("get gridOffsetRes pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridOffsetRes page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridOffsetRes page error:" + err);
      }
      console.info("gridOffsetRes beforeEach end");
      done();
    });

    /**
     * @tc.name   gridOffsetRes_0100
     * @tc.number gridOffsetRes_0100
     * @tc.desc   Set content area offset through Resource type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('gridOffsetRes_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[gridOffsetRes_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('grid_contentOffset_res');
      console.info("[gridOffsetRes_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[gridOffsetRes_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[gridOffsetRes_0100] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      console.info("[gridOffsetRes_0100] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("20.000000");
      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("20.000000");
      console.info('[gridOffsetRes_0100] END');
      done();
    });
  })
}