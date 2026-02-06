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

export default function textInputFontScaleTest() {
  describe('textInputFontScaleTest', () => {
    beforeAll(() => {
      console.info("textInputFontScaleTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontScaleTest/textInputFontScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputFontScaleTest state success " + JSON.stringify(pages));
        if (!("textInputFontScaleTest" == pages.name)) {
          console.info("get textInputFontScaleTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textInputFontScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputFontScaleTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("textInputFontScaleTest after each called");
    });

    
    

    /**
     * @tc.number   textInputFontScaleTest_static_0001
     * @tc.name     textInputFontScaleTest_static_0001
     * @tc.desc     textInputFontScaleTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0001 START');
        await CommonFunc.sleep(1000);
        let input1 = inspector.getInspectorByKey('input1');
        let obj = JSON.parseJsonElement(input1);
        console.log('textInputFontScaleTest0001---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0001---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0001] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0002
     * @tc.name     textInputFontScaleTest_static_0002
     * @tc.desc     textInputFontScaleTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0002 START');
        await CommonFunc.sleep(1000);
        let input2 = inspector.getInspectorByKey('input2');
        let obj = JSON.parseJsonElement(input2);
        console.log('textInputFontScaleTest0002---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0002---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
        console.info("[textInputFontScaleTest0002] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0003
     * @tc.name     textInputFontScaleTest_static_0003
     * @tc.desc     textInputFontScaleTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0003 START');
        await CommonFunc.sleep(1000);
        let input3 = inspector.getInspectorByKey('input3');
        let obj = JSON.parseJsonElement(input3);
        console.log('textInputFontScaleTest0003---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0003---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
        console.info("[textInputFontScaleTest0003] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0004
     * @tc.name     textInputFontScaleTest_static_0004
     * @tc.desc     textInputFontScaleTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0004 START');
        await CommonFunc.sleep(1000);
        let input4 = inspector.getInspectorByKey('input4');
        let obj = JSON.parseJsonElement(input4);
        console.log('textInputFontScaleTest0004---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0004---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[textInputFontScaleTest0004] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0005
     * @tc.name     textInputFontScaleTest_static_0005
     * @tc.desc     textInputFontScaleTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0005', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0005 START');
        await CommonFunc.sleep(1000);
        let input5 = inspector.getInspectorByKey('input5');
        let obj = JSON.parseJsonElement(input5);
        console.log('textInputFontScaleTest0005---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0005---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
        console.info("[textInputFontScaleTest0005] end");
    });
	
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0006
     * @tc.name     textInputFontScaleTest_static_0006
     * @tc.desc     textInputFontScaleTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0006', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0006 START');
        await CommonFunc.sleep(1000);
        let input6 = inspector.getInspectorByKey('input6');
        let obj = JSON.parseJsonElement(input6);
        console.log('textInputFontScaleTest0006---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0006---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0006] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0007
     * @tc.name     textInputFontScaleTest_static_0007
     * @tc.desc     textInputFontScaleTest_static_0007
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0007', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0007 START');
        await CommonFunc.sleep(1000);
        let input7 = inspector.getInspectorByKey('input7');
        let obj = JSON.parseJsonElement(input7);
        console.log('textInputFontScaleTest0007---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0007---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0007] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0008
     * @tc.name     textInputFontScaleTest_static_0008
     * @tc.desc     textInputFontScaleTest_static_0008
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0008', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0008 START');
        await CommonFunc.sleep(1000);
        let input8 = inspector.getInspectorByKey('input8');
        let obj = JSON.parseJsonElement(input8);
        console.log('textInputFontScaleTest0008---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0008---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.500000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.600000");
        console.info("[textInputFontScaleTest0008] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0009
     * @tc.name     textInputFontScaleTest_static_0009
     * @tc.desc     textInputFontScaleTest_static_0009
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0009', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0009 START');
        await CommonFunc.sleep(1000);
        let input9 = inspector.getInspectorByKey('input9');
        let obj = JSON.parseJsonElement(input9);
        console.log('textInputFontScaleTest0009---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0009---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
        console.info("[textInputFontScaleTest0009] end");
    });
	
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0010
     * @tc.name     textInputFontScaleTest_static_0010
     * @tc.desc     textInputFontScaleTest_static_0010
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0010', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0010 START');
        await CommonFunc.sleep(1000);
        let input10 = inspector.getInspectorByKey('input10');
        let obj = JSON.parseJsonElement(input10);
        console.log('textInputFontScaleTest0010---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0010---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0010] end");
    });
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0011
     * @tc.name     textInputFontScaleTest_static_0011
     * @tc.desc     textInputFontScaleTest_static_0011
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0011', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0011 START');
        await CommonFunc.sleep(1000);
        let input11 = inspector.getInspectorByKey('input11');
        let obj = JSON.parseJsonElement(input11);
        console.log('textInputFontScaleTest0011---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0011---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0011] end");
    });
	
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0012
     * @tc.name     textInputFontScaleTest_static_0012
     * @tc.desc     textInputFontScaleTest_static_0012
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0012', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0012 START');
        await CommonFunc.sleep(1000);
        let input12 = inspector.getInspectorByKey('input12');
        let obj = JSON.parseJsonElement(input12);
        console.log('textInputFontScaleTest0012---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0012---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0012] end");
    });
	
	
	
    

    /**
     * @tc.number   textInputFontScaleTest_static_0013
     * @tc.name     textInputFontScaleTest_static_0013
     * @tc.desc     textInputFontScaleTest_static_0013
     * @tc.level    Level.LEVEL1
     */
it('textInputFontScaleTest_static_0013', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0013 START');
        await CommonFunc.sleep(1000);
        let input13 = inspector.getInspectorByKey('input13');
        let obj = JSON.parseJsonElement(input13);
        console.log('textInputFontScaleTest0013---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textInputFontScaleTest0013---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0013] end");
    });


  })
}
