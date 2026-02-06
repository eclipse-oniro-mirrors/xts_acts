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

export default function searchFontScaleTest() {
  describe('searchFontScaleTest', () => {
    beforeAll(() => {
      console.info("searchFontScaleTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontScaleTest/searchFontScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchFontScaleTest state success " + JSON.stringify(pages));
        if (!("searchFontScaleTest" == pages.name)) {
          console.info("get searchFontScaleTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push searchFontScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchFontScaleTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("searchFontScaleTest after each called");
    });

    
    

    /**
     * @tc.number   searchFontScaleTest_static_0001
     * @tc.name     searchFontScaleTest_static_0001
     * @tc.desc     searchFontScaleTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0001', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0001 START');
        await CommonFunc.sleep(1000);
        let search1 = inspector.getInspectorByKey('search1');
        let obj = JSON.parseJsonElement(search1);
        console.log('searchFontScaleTest0001---' + obj.getElement('$attrs').getString('maxFontScale'))
		console.log('searchFontScaleTest0001---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0001] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0002
     * @tc.name     searchFontScaleTest_static_0002
     * @tc.desc     searchFontScaleTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0002', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0002 START');
        await CommonFunc.sleep(1000);
        let search2 = inspector.getInspectorByKey('search2');
        let obj = JSON.parseJsonElement(search2);
        console.log('searchFontScaleTest0002---' + obj.getElement('$attrs').getString('maxFontScale'))
		console.log('searchFontScaleTest0002---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
        console.info("[searchFontScaleTest0002] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0003
     * @tc.name     searchFontScaleTest_static_0003
     * @tc.desc     searchFontScaleTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0003', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0003 START');
        await CommonFunc.sleep(1000);
        let search3 = inspector.getInspectorByKey('search3');
        let obj = JSON.parseJsonElement(search3);
        console.log('searchFontScaleTest0003---' + obj.getElement('$attrs').getString('maxFontScale'))
		console.log('searchFontScaleTest0003---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
        console.info("[searchFontScaleTest0003] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0004
     * @tc.name     searchFontScaleTest_static_0004
     * @tc.desc     searchFontScaleTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0004', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0004 START');
        await CommonFunc.sleep(1000);
        let search4 = inspector.getInspectorByKey('search4');
        let obj = JSON.parseJsonElement(search4);
        console.log('searchFontScaleTest0004---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0004---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0004] end");
    });
	
	
    

    /**
     * @tc.number   searchFontScaleTest_static_0005
     * @tc.name     searchFontScaleTest_static_0005
     * @tc.desc     searchFontScaleTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0005', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0005 START');
        await CommonFunc.sleep(1000);
        let search5 = inspector.getInspectorByKey('search5');
        let obj = JSON.parseJsonElement(search5);
        console.log('searchFontScaleTest0005---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0005---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
        console.info("[searchFontScaleTest0005] end");
    });

	
    

    /**
     * @tc.number   searchFontScaleTest_static_0006
     * @tc.name     searchFontScaleTest_static_0006
     * @tc.desc     searchFontScaleTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0006', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0006 START');
        await CommonFunc.sleep(1000);
        let search6 = inspector.getInspectorByKey('search6');
        let obj = JSON.parseJsonElement(search6);
        console.log('searchFontScaleTest0006---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0006---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0006] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0007
     * @tc.name     searchFontScaleTest_static_0007
     * @tc.desc     searchFontScaleTest_static_0007
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0007', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0007 START');
        await CommonFunc.sleep(1000);
        let search7 = inspector.getInspectorByKey('search7');
        let obj = JSON.parseJsonElement(search7);
        console.log('searchFontScaleTest0007---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0007---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0007] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0008
     * @tc.name     searchFontScaleTest_static_0008
     * @tc.desc     searchFontScaleTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0008', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0008 START');
        await CommonFunc.sleep(1000);
        let search8 = inspector.getInspectorByKey('search8');
        let obj = JSON.parseJsonElement(search8);
        console.log('searchFontScaleTest0008---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0008---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.600000");
        console.info("[searchFontScaleTest0008] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0009
     * @tc.name     searchFontScaleTest_static_0009
     * @tc.desc     searchFontScaleTest_static_0009
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0009', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0009 START');
        await CommonFunc.sleep(1000);
        let search9 = inspector.getInspectorByKey('search9');
        let obj = JSON.parseJsonElement(search9);
        console.log('searchFontScaleTest0009---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0009---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
        console.info("[searchFontScaleTest0009] end");
    });



    

    /**
     * @tc.number   searchFontScaleTest_static_0010
     * @tc.name     searchFontScaleTest_static_0010
     * @tc.desc     searchFontScaleTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0010', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0010 START');
        await CommonFunc.sleep(1000);
        let search10 = inspector.getInspectorByKey('search10');
        let obj = JSON.parseJsonElement(search10);
        console.log('searchFontScaleTest0010---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0010---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0010] end");
    });


    

    /**
     * @tc.number   searchFontScaleTest_static_0011
     * @tc.name     searchFontScaleTest_static_0011
     * @tc.desc     searchFontScaleTest_static_0011
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0011', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0011 START');
        await CommonFunc.sleep(1000);
        let search11 = inspector.getInspectorByKey('search11');
        let obj = JSON.parseJsonElement(search11);
        console.log('searchFontScaleTest0011---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0011---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0011] end");
    });



    

    /**
     * @tc.number   searchFontScaleTest_static_0012
     * @tc.name     searchFontScaleTest_static_0012
     * @tc.desc     searchFontScaleTest_static_0012
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0012', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0012 START');
        await CommonFunc.sleep(1000);
        let search12 = inspector.getInspectorByKey('search12');
        let obj = JSON.parseJsonElement(search12);
        console.log('searchFontScaleTest0012---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0012---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0012] end");
    });



    

    /**
     * @tc.number   searchFontScaleTest_static_0013
     * @tc.name     searchFontScaleTest_static_0013
     * @tc.desc     searchFontScaleTest_static_0013
     * @tc.level    Level.LEVEL0
     */
it('searchFontScaleTest_static_0013', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('searchFontScaleTest searchFontScaleTest0013 START');
        await CommonFunc.sleep(1000);
        let search13 = inspector.getInspectorByKey('search13');
        let obj = JSON.parseJsonElement(search13);
        console.log('searchFontScaleTest0013---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('searchFontScaleTest0013---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[searchFontScaleTest0013] end");
    });
  })
}
