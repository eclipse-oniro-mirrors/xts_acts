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

export default function ChipApi1() {
  describe('ChipApi1', () => {
    beforeAll(() => {
      console.info("ChipApi1 beforeAll start");


      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("ChipApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/ChipApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipApi1 state pages:" + "");
        if (!("ChipApi1" == pages.name)) {
          console.info("get ChipApi1 pages.name:" + "");
          //let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push ChipApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipApi1 page error:" + err);
      }
      console.info("ChipApi1 beforeEach end");
      // done();
    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   ChipApi1_static_0100
     * @tc.name     ChipApi1_static_0100
     * @tc.desc     ChipApi1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ChipApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ChipApi1_static_0100 START');
      await CommonFunc.sleep(1000);


      inspector.sendEventByKey('ChipApi1_btn1', 10, "")
      await CommonFunc.sleep(3000);
      console.info('Activated click after')

      let text = inspector.getInspectorByKey('ChipApi1_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content'))
        .assertEqual('#FFFF0000');
      await CommonFunc.sleep(1000);

      console.info('ChipApi1_static_0100 END');
      done();
    });

  })
}