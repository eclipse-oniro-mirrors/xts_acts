'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function stackAlignContentJsunits() {
  describe('stackAlignContentTest1', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/stack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stack state success " + JSON.stringify(pages));
        if (!("stack" == pages.name)) {
          console.info("get stack state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push stack page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stackAlignContent after each called");
    });

    
    
    
    /**
     * @tc.number   teststackAlignContent_static_00011
     * @tc.name     teststackAlignContent_static_00011
     * @tc.desc     teststackAlignContent_static_00011
     * @tc.level    Level.LEVEL0
     */
it('teststackAlignContent_static_00011', Level.LEVEL0, async () => {
      console.info('stackAlignContent teststackAlignContent0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Stack');
      console.info("[teststackAlignContent0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00%");
      console.info("[teststackAlignContent0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   teststackAlignContent_static_00021
     * @tc.name     teststackAlignContent_static_00021
     * @tc.desc     teststackAlignContent_static_00021
     * @tc.level    Level.LEVEL0
     */
it('teststackAlignContent_static_00021', Level.LEVEL0, async () => {
      console.info('stackAlignContent teststackAlignContent0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Stack');
      console.info("[teststackAlignContent0002] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("150.00vp");
      console.info("[teststackAlignContent0002] width value :" + obj.getElement('$attrs').getString('width'));

    });
  })
}
