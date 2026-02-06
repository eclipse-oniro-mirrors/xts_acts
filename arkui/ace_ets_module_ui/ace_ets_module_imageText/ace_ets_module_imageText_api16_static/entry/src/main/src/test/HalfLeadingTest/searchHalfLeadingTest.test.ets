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
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function searchHalfLeadingTest() {
  describe('searchHalfLeadingTest', () => {
    beforeAll(() => {
      console.info("searchHalfLeadingTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HalfLeadingTest/searchHalfLeadingTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchHalfLeadingTest state success " + JSON.stringify(pages));
        if (!("searchHalfLeadingTest" == pages.name)) {
          console.info("get searchHalfLeadingTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push searchHalfLeadingTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchHalfLeadingTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("searchHalfLeadingTest after each called");
    });

    
    

    /**
     * @tc.number   searchHalfLeadingTest_static_0001
     * @tc.name     searchHalfLeadingTest_static_0001
     * @tc.desc     searchHalfLeadingTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('searchHalfLeadingTest_static_0001', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchHalfLeadingTest searchHalfLeadingTest0001 START');
        await CommonFunc.sleep(1000);
        let search1 = inspector.getInspectorByKey('search1');
        let obj = JSON.parseJsonElement(search1);
        console.log('searchHalfLeadingTest0001---' + obj.getElement('$attrs').getBoolean('halfLeading'))
        expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(true);
        console.info("[searchHalfLeadingTest0001] end");
    });
	
	
    

    /**
     * @tc.number   searchHalfLeadingTest_static_0002
     * @tc.name     searchHalfLeadingTest_static_0002
     * @tc.desc     searchHalfLeadingTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('searchHalfLeadingTest_static_0002', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchHalfLeadingTest searchHalfLeadingTest0002 START');
        await CommonFunc.sleep(1000);
        let search2 = inspector.getInspectorByKey('search2');
        let obj = JSON.parseJsonElement(search2);
        console.log('searchHalfLeadingTest0002---' + obj.getElement('$attrs').getBoolean('halfLeading'))
        expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
        console.info("[searchHalfLeadingTest0002] end");
    });
	
	
    

    /**
     * @tc.number   searchHalfLeadingTest_static_0003
     * @tc.name     searchHalfLeadingTest_static_0003
     * @tc.desc     searchHalfLeadingTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('searchHalfLeadingTest_static_0003', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchHalfLeadingTest searchHalfLeadingTest0003 START');
        await CommonFunc.sleep(1000);
        let search3 = inspector.getInspectorByKey('search3');
        let obj = JSON.parseJsonElement(search3);
        console.log('searchHalfLeadingTest0003---' + obj.getElement('$attrs').getBoolean('halfLeading'))
        expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
        console.info("[searchHalfLeadingTest0003] end");
    });
	
	
    

    /**
     * @tc.number   searchHalfLeadingTest_static_0004
     * @tc.name     searchHalfLeadingTest_static_0004
     * @tc.desc     searchHalfLeadingTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('searchHalfLeadingTest_static_0004', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchHalfLeadingTest searchHalfLeadingTest0004 START');
        await CommonFunc.sleep(1000);
        let search4 = inspector.getInspectorByKey('search4');
        let obj = JSON.parseJsonElement(search4);
        console.log('searchHalfLeadingTest0004---' + obj.getElement('$attrs').getBoolean('halfLeading'))
        expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
        console.info("[searchHalfLeadingTest0004] end");
    });
	
  })
}
