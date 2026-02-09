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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
// import { sendEventByKey } from '@internal.full.global'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ChipGroupApi1() {
  describe('ChipGroupApi1', () => {
    beforeAll(() => {
      console.info("ChipGroupApi1 beforeAll start");


      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("ChipGroupApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/ChipGroupApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipGroupApi1 state pages:" + "");
        if (!("ChipGroupApi1" == pages.name)) {
          console.info("get ChipGroupApi1 pages.name:" + "");
          //let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push ChipGroupApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupApi1 page error:" + err);
      }
      console.info("ChipGroupApi1 beforeEach end");
      // done();
    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   ChipGroupApi1_static_0100
     * @tc.name     ChipGroupApi1_static_0100
     * @tc.desc     ChipGroupApi1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ChipGroupApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ChipGroupApi1_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("ChipGroupApi1_btn1"));
      console.info('ChipGroupApi1_static_0100 findComponent');
      await (btn1?.click() as Promise<void>)
      console.info('ChipGroupApi1_static_0100 START');
      console.info('ChipGroupApi1_static_0100 CLICK SUCCESS');
      await CommonFunc.sleep(1000);

      // sendEventByKey('ChipGroupApi1_btn1', 10, "")
      console.info('ChipGroupApi1_static_0100 CLICK SUCCESS');

      let text1 = inspector.getInspectorByKey('ChipGroupApi1_text1');
      console.info('ChipGroupApi1_static_0100 getInspectorByKey1 SUCCESS');
      expect(JSON.stringify(JSON.parseJsonElement(text1).getElement("$attrs").getString('content')))
        .assertEqual('"SymbolGlyph"');
      await CommonFunc.sleep(1000);

      console.info('ChipGroupApi1_static_0100 END');
      done();
    });

  })
}