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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getIndicator() {
  describe('getIndicator', () => {
    beforeEach(async (done: Function) => {
      console.info("getIndicator beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IndicatorComponent/getIndicator",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getIndicator state pages:" + JSON.stringify(pages));
        if (!("getIndicator" == pages.name)) {
          console.info("get getIndicator pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getIndicator page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getIndicator page error:" + err);
      }
      console.info("getIndicator beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getIndicator after each called");
    });

    /**
     * @tc.number    getIndicator_001
     * @tc.name      getIndicator_0100
     * @tc.desc      Independent navigation point indicator component.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('getIndicator_0100', 0, async (done: Function) => {
      console.info('[getIndicator_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = getInspectorByKey('IndicatorComponent_1');
      console.info("[getIndicator_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getIndicator_0100]: type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[getIndicator_0100]: initialIndex: " + JSON.stringify(JSON.parse(strJson).$attrs.initialIndex));
      console.info("[getIndicator_0100]: count: " + JSON.stringify(JSON.parse(strJson).$attrs.count));
      console.info("[getIndicator_0100]: vertical: " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
      console.info("[getIndicator_0100]: loop: " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("[getIndicator_0100]: content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$type).assertEqual("IndicatorComponent");
      expect(JSON.parse(strJson).$attrs.initialIndex).assertEqual(0);
      expect(JSON.parse(strJson).$attrs.count).assertEqual(6);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("true");
      expect(JSON.parse(strJson).$attrs.loop).assertEqual("false");
      console.info('[getIndicator_0100] END');
      done();
    });
  })
}