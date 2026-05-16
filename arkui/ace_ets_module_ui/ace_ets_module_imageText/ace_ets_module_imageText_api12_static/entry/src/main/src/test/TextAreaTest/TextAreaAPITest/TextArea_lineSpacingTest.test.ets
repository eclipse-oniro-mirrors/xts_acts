'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextArea_lineSpacingTest() {
  describe('TextArea_lineSpacingTest', () => {
    beforeAll(() => {
      console.info("TextArea_lineSpacingTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextArea_lineSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaAPI/lineSpacing",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextArea_lineSpacingTest state pages:" + JSON.stringify(pages));
        if (!("lineSpacing" == pages.name)) {
          console.info("get TextArea_lineSpacingTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextArea_lineSpacingTest page error:" + err);
      }
      console.info("TextArea_lineSpacingTest beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextArea_lineSpacingTest after each called");
    });

    
    /**
     * @tc.number   TextArea_lineSpacingTest_static_001
     * @tc.name     TextArea_lineSpacingTest_static_001
     * @tc.desc     TextArea_lineSpacingTest_static_001
     * @tc.level   Level.LEVEL0
     */
    it('TextArea_lineSpacingTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextArea_lineSpacingTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await (driver.findComponent(ON.id('btn')) as Promise<Component>);
      await btn.click();
      await CommonFunc.sleep(1000);
      let LengthMetricsValue = inspector.getInspectorByKey('LengthMetricsValue');
      console.info('LengthMetricsValue-----' + JSON.parseJsonElement(LengthMetricsValue).getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(LengthMetricsValue).getElement('$attrs').getString('content')).assertEqual('20vp');
      console.info('[TextArea_lineSpacingTest_001] END');
      done();
    });

  })
}
