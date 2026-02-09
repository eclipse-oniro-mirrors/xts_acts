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

import { describe, beforeEach, it, expect, Level, beforeAll, afterEach } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function symbolGlyphFontScaleTest() {
  describe('symbolGlyphFontScaleTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("symbolGlyphFontScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontScaleTest/symbolGlyphFontScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get symbolGlyphFontScaleTest state success " + JSON.stringify(pages));
        if (!("symbolGlyphFontScaleTest" == pages.name)) {
          console.info("get symbolGlyphFontScaleTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push symbolGlyphFontScaleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphFontScaleTest after each called");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0001
     * @tc.name     symbolGlyphFontScaleTest_static_0001
     * @tc.desc     symbolGlyphFontScaleTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0001', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0001 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph1 = inspector.getInspectorByKey('symbolGlyph1');
      let obj = JSON.parseJsonElement(symbolGlyph1);
      console.log('symbolGlyphFontScaleTest0001---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0001---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
      console.info("[symbolGlyphFontScaleTest0001] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0002
     * @tc.name     symbolGlyphFontScaleTest_static_0002
     * @tc.desc     symbolGlyphFontScaleTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0002', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0002 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph2 = inspector.getInspectorByKey('symbolGlyph2');
      let obj = JSON.parseJsonElement(symbolGlyph2);
      console.log('symbolGlyphFontScaleTest0002---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0002---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.000000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
      console.info("[symbolGlyphFontScaleTest0002] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0003
     * @tc.name     symbolGlyphFontScaleTest_static_0003
     * @tc.desc     symbolGlyphFontScaleTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0003', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0003 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph3 = inspector.getInspectorByKey('symbolGlyph3');
      let obj = JSON.parseJsonElement(symbolGlyph3);
      console.log('symbolGlyphFontScaleTest0003---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0003---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.500000");
      console.info("[symbolGlyphFontScaleTest0003] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0004
     * @tc.name     symbolGlyphFontScaleTest_static_0004
     * @tc.desc     symbolGlyphFontScaleTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0004', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0004 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph4 = inspector.getInspectorByKey('symbolGlyph4');
      let obj = JSON.parseJsonElement(symbolGlyph4);
      console.log('symbolGlyphFontScaleTest0004---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0004---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.000000");
      console.info("[symbolGlyphFontScaleTest0004] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0005
     * @tc.name     symbolGlyphFontScaleTest_static_0005
     * @tc.desc     symbolGlyphFontScaleTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0005', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0005 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph5 = inspector.getInspectorByKey('symbolGlyph5');
      let obj = JSON.parseJsonElement(symbolGlyph5);
      console.log('symbolGlyphFontScaleTest0005---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0005---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
      console.info("[symbolGlyphFontScaleTest0005] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0006
     * @tc.name     symbolGlyphFontScaleTest_static_0006
     * @tc.desc     symbolGlyphFontScaleTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0006', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0006 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph6 = inspector.getInspectorByKey('symbolGlyph6');
      let obj = JSON.parseJsonElement(symbolGlyph6);
      console.log('symbolGlyphFontScaleTest0006---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0006---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
      console.info("[symbolGlyphFontScaleTest0006] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0007
     * @tc.name     symbolGlyphFontScaleTest_static_0007
     * @tc.desc     symbolGlyphFontScaleTest_static_0007
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0007', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0007 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph7 = inspector.getInspectorByKey('symbolGlyph7');
      let obj = JSON.parseJsonElement(symbolGlyph7);
      console.log('symbolGlyphFontScaleTest0007---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0007---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
      console.info("[symbolGlyphFontScaleTest0007] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0008
     * @tc.name     symbolGlyphFontScaleTest_static_0008
     * @tc.desc     symbolGlyphFontScaleTest_static_0008
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0008', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0008 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph8 = inspector.getInspectorByKey('symbolGlyph8');
      let obj = JSON.parseJsonElement(symbolGlyph8);
      console.log('symbolGlyphFontScaleTest0008---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0008---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.500000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.600000");
      console.info("[symbolGlyphFontScaleTest0008] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0009
     * @tc.name     symbolGlyphFontScaleTest_static_0009
     * @tc.desc     symbolGlyphFontScaleTest_static_0009
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0009', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0009 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph9 = inspector.getInspectorByKey('symbolGlyph9');
      let obj = JSON.parseJsonElement(symbolGlyph9);
      console.log('symbolGlyphFontScaleTest0009---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0009---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("2.000000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("1.000000");
      console.info("[symbolGlyphFontScaleTest0009] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0010
     * @tc.name     symbolGlyphFontScaleTest_static_0010
     * @tc.desc     symbolGlyphFontScaleTest_static_0010
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0010', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0010 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph10 = inspector.getInspectorByKey('symbolGlyph10');
      let obj = JSON.parseJsonElement(symbolGlyph10);
      console.log('symbolGlyphFontScaleTest0010---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0010---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
      console.info("[symbolGlyphFontScaleTest0010] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0011
     * @tc.name     symbolGlyphFontScaleTest_static_0011
     * @tc.desc     symbolGlyphFontScaleTest_static_0011
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0011', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0011 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph11 = inspector.getInspectorByKey('symbolGlyph11');
      let obj = JSON.parseJsonElement(symbolGlyph11);
      console.log('symbolGlyphFontScaleTest0011---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0011---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
      console.info("[symbolGlyphFontScaleTest0011] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0012
     * @tc.name     symbolGlyphFontScaleTest_static_0012
     * @tc.desc     symbolGlyphFontScaleTest_static_0012
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0012', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0012 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph12 = inspector.getInspectorByKey('symbolGlyph12');
      let obj = JSON.parseJsonElement(symbolGlyph12);
      console.log('symbolGlyphFontScaleTest0012---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0012---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
      console.info("[symbolGlyphFontScaleTest0012] end");
    });


    
    /**
     * @tc.number   symbolGlyphFontScaleTest_static_0013
     * @tc.name     symbolGlyphFontScaleTest_static_0013
     * @tc.desc     symbolGlyphFontScaleTest_static_0013
     * @tc.level    Level.LEVEL1
     */
it('symbolGlyphFontScaleTest_static_0013', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0013 START');
      await CommonFunc.sleep(1000);
      let symbolGlyph13 = inspector.getInspectorByKey('symbolGlyph13');
      let obj = JSON.parseJsonElement(symbolGlyph13);
      console.log('symbolGlyphFontScaleTest0013---' + obj.getElement('$attrs').getString('maxFontScale'))
      console.log('symbolGlyphFontScaleTest0013---' + obj.getElement('$attrs').getString('minFontScale'))
      expect(obj.getElement('$attrs').getString('maxFontScale')).assertEqual("3.200000");
      expect(obj.getElement('$attrs').getString('minFontScale')).assertEqual("0.850000");
      console.info("[symbolGlyphFontScaleTest0013] end");
    });
  })
}
