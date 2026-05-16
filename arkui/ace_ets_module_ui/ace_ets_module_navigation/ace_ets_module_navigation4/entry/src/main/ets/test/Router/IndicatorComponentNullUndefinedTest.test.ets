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
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function IndicatorComponentNullUndefinedTest() {
  describe('IndicatorComponentNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IndicatorComponentNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Router/IndicatorComponentNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndicatorComponentNullUndefined state pages: " + JSON.stringify(pages));
        if (!("IndicatorComponentNullUndefined" == pages.name)) {
          console.info("get IndicatorComponentNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IndicatorComponentNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndicatorComponentNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   IndicatorComponentNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_IndicatorComponentNullUndefinedTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndicatorComponentNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[IndicatorComponentNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('IndicatorComponentNull');
      let strJson2 = getInspectorByKey('IndicatorComponentUndefined');

      expect(JSON.parse(strJson1).$type).assertEqual('IndicatorComponent');
      expect(JSON.parse(strJson2).$type).assertEqual('IndicatorComponent');
      
      console.info('[IndicatorComponentNullUndefinedTest_0100] END');
      done();
    });
  })
}

