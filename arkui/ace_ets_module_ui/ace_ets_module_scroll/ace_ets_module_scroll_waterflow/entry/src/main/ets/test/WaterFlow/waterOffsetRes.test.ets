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

export default function waterOffsetRes() {
  describe('waterOffsetRes', () => {
    beforeEach(async (done: Function) => {
      console.info("waterOffsetRes beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterOffsetRes",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterOffsetRes state pages:" + JSON.stringify(pages));
        if (!("waterOffsetRes" == pages.name)) {
          console.info("get waterOffsetRes pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterOffsetRes page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterOffsetRes page error:" + err);
      }
      console.info("waterOffsetRes beforeEach end");
      done();
    });

    /**
     * @tc.name   waterOffsetRes_0100
     * @tc.number waterOffsetRes_0100
     * @tc.desc   Set content area offset through Resource type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('waterOffsetRes_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[waterOffsetRes_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('water_contentOffset_res');
      console.info("[waterOffsetRes_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[waterOffsetRes_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[waterOffsetRes_0100] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      console.info("[waterOffsetRes_0100] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("WaterFlow");
      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("20.000000");
      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("20.000000");
      console.info('[waterOffsetRes_0100] END');
      done();
    });
  })
}