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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function rotateTest() {
  describe('rotateTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("rotateTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("rotateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/rotatePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get rotateTest state pages:" + JSON.stringify(pages));
        if (!("rotatePage" == pages.name)) {
          console.info("get rotateTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push rotateTest page error:" + err);
      }
      console.info("rotateTest beforeEach end");
    });

    afterEach(async () => {
    });


    
    
/**
     * @tc.number   rotateTest_static_0100
     * @tc.name     rotateTest_static_0100
     * @tc.desc     rotateTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('rotateTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('rotateTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('rotatePage_image');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[rotateTest_0100] strJson:" + obj.getElement('$attrs').getElement('transform').getString('matrix'));
      expect(obj.getElement('$attrs').getElement('transform').getString('matrix'))
        .assertEqual('0.707107,0.707107,0.000000,0.000000,-0.707107,0.707107,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,');

      console.info('rotateTest_0100 END');
      done();
    });
  })
}