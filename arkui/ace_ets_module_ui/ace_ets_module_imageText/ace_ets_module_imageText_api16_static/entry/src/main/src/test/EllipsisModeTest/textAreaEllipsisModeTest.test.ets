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



export default function textAreaEllipsisModeTest() {
  describe('textAreaEllipsisModeTest', () => {
    beforeAll(() => {
      console.info("textAreaEllipsisModeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EllipsisModeTest/textAreaEllipsisModeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaEllipsisModeTest state success " + JSON.stringify(pages));
        if (!("textAreaEllipsisModeTest" == pages.name)) {
          console.info("get textAreaEllipsisModeTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaEllipsisModeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaEllipsisModeTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("textAreaEllipsisModeTest after each called");
    });

    
    

    /**
     * @tc.number   textAreaEllipsisModeTest_static_0001
     * @tc.name     textAreaEllipsisModeTest_static_0001
     * @tc.desc     textAreaEllipsisModeTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textAreaEllipsisModeTest_static_0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaEllipsisModeTest textAreaEllipsisModeTest0001 START');
        await CommonFunc.sleep(1000);
        let area1 = inspector.getInspectorByKey('area1');
        let obj = JSON.parseJsonElement(area1);
        console.log('textAreaEllipsisModeTest0001---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.END");
        console.info("[textAreaEllipsisModeTest0001] end");
    });
	
	
    

    /**
     * @tc.number   textAreaEllipsisModeTest_static_0002
     * @tc.name     textAreaEllipsisModeTest_static_0002
     * @tc.desc     textAreaEllipsisModeTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('textAreaEllipsisModeTest_static_0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaEllipsisModeTest textAreaEllipsisModeTest0002 START');
        await CommonFunc.sleep(1000);
        let area2 = inspector.getInspectorByKey('area2');
        let obj = JSON.parseJsonElement(area2);
        console.log('textAreaEllipsisModeTest0002---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.START");
        console.info("[textAreaEllipsisModeTest0002] end");
    });
	
	
    

    /**
     * @tc.number   textAreaEllipsisModeTest_static_0003
     * @tc.name     textAreaEllipsisModeTest_static_0003
     * @tc.desc     textAreaEllipsisModeTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('textAreaEllipsisModeTest_static_0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaEllipsisModeTest textAreaEllipsisModeTest0003 START');
        await CommonFunc.sleep(1000);
        let area3 = inspector.getInspectorByKey('area3');
        let obj = JSON.parseJsonElement(area3);
        console.log('textAreaEllipsisModeTest0003---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.CENTER");
        console.info("[textAreaEllipsisModeTest0003] end");
    });
	
	
    

    /**
     * @tc.number   textAreaEllipsisModeTest_static_0004
     * @tc.name     textAreaEllipsisModeTest_static_0004
     * @tc.desc     textAreaEllipsisModeTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('textAreaEllipsisModeTest_static_0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaEllipsisModeTest textAreaEllipsisModeTest0004 START');
        await CommonFunc.sleep(1000);
        let area4 = inspector.getInspectorByKey('area4');
        let obj = JSON.parseJsonElement(area4);
        console.log('textAreaEllipsisModeTest0004---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.END");
        console.info("[textAreaEllipsisModeTest0004] end");
    });
	
	
    

    /**
     * @tc.number   textAreaEllipsisModeTest_static_0005
     * @tc.name     textAreaEllipsisModeTest_static_0005
     * @tc.desc     textAreaEllipsisModeTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('textAreaEllipsisModeTest_static_0005', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaEllipsisModeTest textAreaEllipsisModeTest0005 START');
        await CommonFunc.sleep(1000);
        let area5 = inspector.getInspectorByKey('area5');
        let obj = JSON.parseJsonElement(area5);
        console.log('textAreaEllipsisModeTest0005---' + obj.getElement('$attrs').getString('ellipsisMode'))
        expect(obj.getElement('$attrs').getString('ellipsisMode')).assertEqual("EllipsisMode.END");
        console.info("[textAreaEllipsisModeTest0005] end");
    });
  })
}
