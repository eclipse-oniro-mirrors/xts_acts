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
export default function StepperItemApiNullUndefinedTest() {
  describe('StepperItemApiNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StepperItemApiNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Router/StepperItemApiNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StepperItemApiNullUndefined state pages: " + JSON.stringify(pages));
        if (!("StepperItemApiNullUndefined" == pages.name)) {
          console.info("get StepperItemApiNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StepperItemApiNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StepperItemApiNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   StepperItemApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_StepperItemApiNullUndefinedTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StepperItemApiNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[StepperItemApiNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('StepperItemApiNull');
      let strJson2 = getInspectorByKey('StepperItemApiUndefined');

      expect(JSON.parse(strJson1).$type).assertEqual('StepperItem');
      expect(JSON.parse(strJson2).$type).assertEqual('StepperItem');

      expect(TransitionType.All).assertEqual('All');
      expect(TransitionType.Insert).assertEqual('Insert');
      expect(TitleHeight.MainOnly).assertEqual('MainOnly');
      expect(TitleHeight.MainWithSub).assertEqual('MainWithSub');
      expect(VisibilityChangeReason.APP_STATE).assertEqual(2);
      
      console.info('[StepperItemApiNullUndefinedTest_0100] END');
      done();
    });
  })
}

