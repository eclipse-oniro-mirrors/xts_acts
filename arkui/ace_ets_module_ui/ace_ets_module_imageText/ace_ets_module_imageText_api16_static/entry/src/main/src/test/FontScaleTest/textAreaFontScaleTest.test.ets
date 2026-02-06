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

export default function textAreaFontScaleTest() {
  describe('textAreaFontScaleTest', () => {
    beforeAll(() => {
      console.info("textAreaFontScaleTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontScaleTest/textAreaFontScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaFontScaleTest state success " + JSON.stringify(pages));
        if (!("textAreaFontScaleTest" == pages.name)) {
          console.info("get textAreaFontScaleTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaFontScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaFontScaleTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("textAreaFontScaleTest after each called");
    });

    
    

    /**
     * @tc.number   textAreaFontScaleTest_static_0001
     * @tc.name     textAreaFontScaleTest_static_0001
     * @tc.desc     textAreaFontScaleTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0001 START');
        await CommonFunc.sleep(1000);
        let area1 = inspector.getInspectorByKey('area1');
        let obj = JSON.parseJsonElement(area1);
        console.log('textAreaFontScaleTest0001---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0001---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0001] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0002
     * @tc.name     textAreaFontScaleTest_static_0002
     * @tc.desc     textAreaFontScaleTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0002 START');
        await CommonFunc.sleep(1000);
        let area2 = inspector.getInspectorByKey('area2');
        let obj = JSON.parseJsonElement(area2);
        console.log('textAreaFontScaleTest0002---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0002---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
        console.info("[textAreaFontScaleTest0002] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0003
     * @tc.name     textAreaFontScaleTest_static_0003
     * @tc.desc     textAreaFontScaleTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0003 START');
        await CommonFunc.sleep(1000);
        let area3 = inspector.getInspectorByKey('area3');
        let obj = JSON.parseJsonElement(area3);
        console.log('textAreaFontScaleTest0003---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0003---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
        console.info("[textAreaFontScaleTest0003] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0004
     * @tc.name     textAreaFontScaleTest_static_0004
     * @tc.desc     textAreaFontScaleTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0004 START');
        await CommonFunc.sleep(1000);
        let area4 = inspector.getInspectorByKey('area4');
        let obj = JSON.parseJsonElement(area4);
        console.log('textAreaFontScaleTest0004---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0004---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
        console.info("[textAreaFontScaleTest0004] end");
    });
	
	
    

    /**
     * @tc.number   textAreaFontScaleTest_static_0005
     * @tc.name     textAreaFontScaleTest_static_0005
     * @tc.desc     textAreaFontScaleTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0005', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0005 START');
        await CommonFunc.sleep(1000);
        let area5 = inspector.getInspectorByKey('area5');
        let obj = JSON.parseJsonElement(area5);
        console.log('textAreaFontScaleTest0005---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0005---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
        console.info("[textAreaFontScaleTest0005] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0006
     * @tc.name     textAreaFontScaleTest_static_0006
     * @tc.desc     textAreaFontScaleTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0006', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0006 START');
        await CommonFunc.sleep(1000);
        let area6 = inspector.getInspectorByKey('area6');
        let obj = JSON.parseJsonElement(area6);
        console.log('textAreaFontScaleTest0006---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0006---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0006] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0007
     * @tc.name     textAreaFontScaleTest_static_0007
     * @tc.desc     textAreaFontScaleTest_static_0007
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0007', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0007 START');
        await CommonFunc.sleep(1000);
        let area7 = inspector.getInspectorByKey('area7');
        let obj = JSON.parseJsonElement(area7);
        console.log('textAreaFontScaleTest0007---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0007---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0007] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0008
     * @tc.name     textAreaFontScaleTest_static_0008
     * @tc.desc     textAreaFontScaleTest_static_0008
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0008', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0008 START');
        await CommonFunc.sleep(1000);
        let area8 = inspector.getInspectorByKey('area8');
        let obj = JSON.parseJsonElement(area8);
        console.log('textAreaFontScaleTest0008---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0008---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.500000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.600000");
        console.info("[textAreaFontScaleTest0008] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0009
     * @tc.name     textAreaFontScaleTest_static_0009
     * @tc.desc     textAreaFontScaleTest_static_0009
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0009', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0009 START');
        await CommonFunc.sleep(1000);
        let area9 = inspector.getInspectorByKey('area9');
        let obj = JSON.parseJsonElement(area9);
        console.log('textAreaFontScaleTest0009---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0009---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
        console.info("[textAreaFontScaleTest0009] end");
    });



    

    /**
     * @tc.number   textAreaFontScaleTest_static_0010
     * @tc.name     textAreaFontScaleTest_static_0010
     * @tc.desc     textAreaFontScaleTest_static_0010
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0010', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0010 START');
        await CommonFunc.sleep(1000);
        let area10 = inspector.getInspectorByKey('area10');
        let obj = JSON.parseJsonElement(area10);
        console.log('textAreaFontScaleTest0010---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0010---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0010] end");
    });


    

    /**
     * @tc.number   textAreaFontScaleTest_static_0011
     * @tc.name     textAreaFontScaleTest_static_0011
     * @tc.desc     textAreaFontScaleTest_static_0011
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0011', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0011 START');
        await CommonFunc.sleep(1000);
        let area11 = inspector.getInspectorByKey('area11');
        let obj = JSON.parseJsonElement(area11);
        console.log('textAreaFontScaleTest0011---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0011---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0011] end");
    });



    

    /**
     * @tc.number   textAreaFontScaleTest_static_0012
     * @tc.name     textAreaFontScaleTest_static_0012
     * @tc.desc     textAreaFontScaleTest_static_0012
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0012', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0012 START');
        await CommonFunc.sleep(1000);
        let area12 = inspector.getInspectorByKey('area12');
        let obj = JSON.parseJsonElement(area12);
        console.log('textAreaFontScaleTest0012---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0012---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0012] end");
    });



    

    /**
     * @tc.number   textAreaFontScaleTest_static_0013
     * @tc.name     textAreaFontScaleTest_static_0013
     * @tc.desc     textAreaFontScaleTest_static_0013
     * @tc.level    Level.LEVEL1
     */
it('textAreaFontScaleTest_static_0013', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0013 START');
        await CommonFunc.sleep(1000);
        let area13 = inspector.getInspectorByKey('area13');
        let obj = JSON.parseJsonElement(area13);
        console.log('textAreaFontScaleTest0013---' + obj.getElement('$attrs').getString('maxFontScale'))
		    console.log('textAreaFontScaleTest0013---' + obj.getElement('$attrs').getString('minFontScale'))
        expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
		    expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0013] end");
    });

  })
}
