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

export default function textInputEllipsisModeTest() {
  describe('textInputEllipsisModeTest', () => {
    beforeAll(() => {
      console.info("textInputEllipsisModeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EllipsisModeTest/textInputEllipsisModeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputEllipsisModeTest state success " + JSON.stringify(pages));
        if (!("textInputEllipsisModeTest" == pages.name)) {
          console.info("get textInputEllipsisModeTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textInputEllipsisModeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputEllipsisModeTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("textInputEllipsisModeTest after each called");
    });

    
    

    /**
     * @tc.number   textInputEllipsisModeTest_static_0001
     * @tc.name     textInputEllipsisModeTest_static_0001
     * @tc.desc     textInputEllipsisModeTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('textInputEllipsisModeTest_static_0001', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputEllipsisModeTest textInputEllipsisModeTest0001 START');
        await CommonFunc.sleep(1000);
        let input1 = inspector.getInspectorByKey('input1');
        let obj = JSON.parseJsonElement(input1);
        console.log('textInputEllipsisModeTest0001---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.END");
        console.info("[textInputEllipsisModeTest0001] end");
    });
	
	
    

    /**
     * @tc.number   textInputEllipsisModeTest_static_0002
     * @tc.name     textInputEllipsisModeTest_static_0002
     * @tc.desc     textInputEllipsisModeTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('textInputEllipsisModeTest_static_0002', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputEllipsisModeTest textInputEllipsisModeTest0002 START');
        await CommonFunc.sleep(1000);
        let input2 = inspector.getInspectorByKey('input2');
        let obj = JSON.parseJsonElement(input2);
        console.log('textInputEllipsisModeTest0002---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.START");
        console.info("[textInputEllipsisModeTest0002] end");
    });
	
	
    

    /**
     * @tc.number   textInputEllipsisModeTest_static_0003
     * @tc.name     textInputEllipsisModeTest_static_0003
     * @tc.desc     textInputEllipsisModeTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('textInputEllipsisModeTest_static_0003', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputEllipsisModeTest textInputEllipsisModeTest0003 START');
        await CommonFunc.sleep(1000);
        let input3 = inspector.getInspectorByKey('input3');
        let obj = JSON.parseJsonElement(input3);
        console.log('textInputEllipsisModeTest0003---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.CENTER");
        console.info("[textInputEllipsisModeTest0003] end");
    });
	
	
    

    /**
     * @tc.number   textInputEllipsisModeTest_static_0004
     * @tc.name     textInputEllipsisModeTest_static_0004
     * @tc.desc     textInputEllipsisModeTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('textInputEllipsisModeTest_static_0004', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputEllipsisModeTest textInputEllipsisModeTest0004 START');
        await CommonFunc.sleep(1000);
        let input4 = inspector.getInspectorByKey('input4');
        let obj = JSON.parseJsonElement(input4);
        console.log('textInputEllipsisModeTest0004---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.END");
        console.info("[textInputEllipsisModeTest0004] end");
    });
	
	
    

    /**
     * @tc.number   textInputEllipsisModeTest_static_0005
     * @tc.name     textInputEllipsisModeTest_static_0005
     * @tc.desc     textInputEllipsisModeTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('textInputEllipsisModeTest_static_0005', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputEllipsisModeTest textInputEllipsisModeTest0005 START');
        await CommonFunc.sleep(1000);
        let input5 = inspector.getInspectorByKey('input5');
        let obj = JSON.parseJsonElement(input5);
        console.log('textInputEllipsisModeTest0005---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.END");
        console.info("[textInputEllipsisModeTest0005] end");
    });
	
	
	
  })
}
