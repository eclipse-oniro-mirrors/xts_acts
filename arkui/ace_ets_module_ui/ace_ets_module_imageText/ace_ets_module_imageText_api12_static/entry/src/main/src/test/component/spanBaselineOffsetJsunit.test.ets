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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function spanBaselineOffsetJsunit() {
  describe('spanBaselineOffsetJsunit', () => {
    beforeAll(() => {
      console.info("APIClipMaskShape beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("spanBaselineOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/spanBaselineOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get spanBaselineOffset state pages: " + JSON.stringify(pages));
        if (!("spanBaselineOffset" == pages.name)) {
          console.info("get spanBaselineOffset state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push spanBaselineOffset page error: " + err);
      }
    })
    
    /**
     * @tc.number   SpanBaselineOffsetJsunit_static_0101
     * @tc.name     SpanBaselineOffsetJsunit_static_0101
     * @tc.desc     SpanBaselineOffsetJsunit_static_0101
     * @tc.level    Level.LEVEL0
     */
    it('SpanBaselineOffsetJsunit_static_0101',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SpanBaselineOffsetJsunit_0101] START');
      let strJson = inspector.getInspectorByKey('SpanBaselineOffsetKey001');
      console.info("[SpanBaselineOffsetJsunit_0101] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('baselineOffset')).assertEqual('10.00vp');
      console.info('[SpanBaselineOffsetJsunit_0101] END**********************************');
      done();
    });
    
    /**
     * @tc.number   SpanBaselineOffsetJsunit_static_0102
     * @tc.name     SpanBaselineOffsetJsunit_static_0102
     * @tc.desc     SpanBaselineOffsetJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
    it('SpanBaselineOffsetJsunit_static_0102',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SpanBaselineOffsetJsunit_0102] START');
      let strJson = inspector.getInspectorByKey('SpanBaselineOffsetKey002');
      console.info("[SpanBaselineOffsetJsunit_0102] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('baselineOffset')).assertEqual(5);
      console.info('[SpanBaselineOffsetJsunit_0102] END**********************************');
      done();
    });
  });
}
