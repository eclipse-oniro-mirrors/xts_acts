'use static';
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SpaceMainNumberJsunit() {
  describe('SpaceMainNumberJsunit', () => {
    beforeAll(() => {
      console.info("SpaceMainNumberJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SpaceMainNumberJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Flex/SpaceMainNumber",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SpaceMainNumberJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SpaceMainNumberJsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SpaceMainNumberJsunit page error:" + err);
      }
      console.info("SpaceMainNumberJsunit beforeEach end");
    });


    
    /**
     * @tc.number   space1Test_static_0010
     * @tc.name     space1Test_static_0010
     * @tc.desc     space1Test_static_0010
     * @tc.level    Level.LEVEL0
     */
it('space1Test_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('space1Test_static_0010 START');
      let strJson = inspector.getInspectorByKey('flex_main_number_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[space1Test_static_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('space')).assertEqual("10.00px");
      console.info('[space1Test_static_0010] END');
      done()
    });


    
    /**
     * @tc.number   space1Test_static_0020
     * @tc.name     space1Test_static_0020
     * @tc.desc     space1Test_static_0020
     * @tc.level    Level.LEVEL0
     */
it('space1Test_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('space1Test_static_0020 START');
      let strJson = inspector.getInspectorByKey('flex_main_number_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[space1Test_static_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('space')).assertEqual("0.00vp");
      console.info('[space1Test_static_0020] END');
      done()
    });


    
    /**
     * @tc.number   space1Test_static_0030
     * @tc.name     space1Test_static_0030
     * @tc.desc     space1Test_static_0030
     * @tc.level    Level.LEVEL0
     */
it('space1Test_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('space1Test_static_0030 START');
      let strJson = inspector.getInspectorByKey('flex_main_number_3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[space1Test_static_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('space')).assertEqual("0.00px");
      console.info('[space1Test_static_0030] END');
      done()
    });


    
    /**
     * @tc.number   space1Test_static_0040
     * @tc.name     space1Test_static_0040
     * @tc.desc     space1Test_static_0040
     * @tc.level    Level.LEVEL0
     */
it('space1Test_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('space1Test_static_0040 START');
      let strJson = inspector.getInspectorByKey('flex_main_number_4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[space1Test_static_0040] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('space')).assertEqual("0.00px");
      console.info('[space1Test_static_0040] END');
      done()
    });


    
    /**
     * @tc.number   space1Test_static_0050
     * @tc.name     space1Test_static_0050
     * @tc.desc     space1Test_static_0050
     * @tc.level    Level.LEVEL0
     */
it('space1Test_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('space1Test_static_0050 START');
      let strJson = inspector.getInspectorByKey('flex_main_number_5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[space1Test_static_0050] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('space')).assertEqual("3276789.00px");
      console.info('[space1Test_static_0050] END');
      done()
    });

  })
}

