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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../../../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ACTION_CANCELED_BEFORE_DRAG_APITest() {
  describe('ACTION_CANCELED_BEFORE_DRAG_APITest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {

      console.info("ACTION_CANCELED_BEFORE_DRAG_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/OnPreDrag/OnpreDrag_API/ACTION_CANCELED_BEFORE_DRAG",
      }
      try {
        const ACTION_CANCELED_BEFORE_DRAG = AppStorage.get<Router>("router") as Router
        ACTION_CANCELED_BEFORE_DRAG.clear();
        let pages = ACTION_CANCELED_BEFORE_DRAG.getState();
        console.info("get ACTION_CANCELED_BEFORE_DRAG_APITest state pages: " + JSON.stringify(pages));
        if (!("ACTION_CANCELED_BEFORE_DRAG" == pages.name)) {
          console.info("get ACTION_CANCELED_BEFORE_DRAG_APITest state pages.name: " + JSON.stringify(pages.name));
          ACTION_CANCELED_BEFORE_DRAG.pushUrl(options);
        }
      } catch (err) {
        console.error("push ACTION_CANCELED_BEFORE_DRAG_APITest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100
     * @tc.name      ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100
     * @tc.desc      ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100
     * @tc.level:    Level 2
     */
    it('ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await (driver.findComponent(ON.id('btn')) as Promise<Component>);
      await btn.longClick();
      await CommonFunc.sleep(2000);
      let ACTION_CANCELED_BEFORE_DRAG = inspector.getInspectorByKey('ACTION_CANCELED_BEFORE_DRAG');
      console.info("[ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100] ACTION_CANCELED_BEFORE_DRAG attrs is: " +
      JSON.stringify(JSON.parseJsonElement(ACTION_CANCELED_BEFORE_DRAG).getElement('$attrs')));
      expect(JSON.parseJsonElement(ACTION_CANCELED_BEFORE_DRAG).getElement('$attrs').getString('content'))
        .assertEqual('ACTION_CANCELED_BEFORE_DRAG');
      console.info('[ACTION_CANCELED_BEFORE_DRAG_APITest_static_0100] END');
      done();
    });
  })
}