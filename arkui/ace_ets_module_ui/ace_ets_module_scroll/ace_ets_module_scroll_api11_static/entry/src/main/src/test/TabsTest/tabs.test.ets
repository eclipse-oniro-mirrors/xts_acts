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

import { Color, SelectedMode, $r } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils'
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabsBarPositionJsunit() {
  describe('tabsBarPositionTest2', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabs2',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabs state success " + JSON.stringify(pages));
        if (!("tabs2" == pages.name)) {
          console.info("get tabs state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push tabs page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("tabsBarPosition after each called");
    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0001
     * @tc.name     testtabsBarPosition_static_0001
     * @tc.desc     testtabsBarPosition_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0001', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtabsBarPosition_static_0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0002
     * @tc.name     testtabsBarPosition_static_0002
     * @tc.desc     testtabsBarPosition_static_0002
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0002', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testtabsBarPosition_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0003
     * @tc.name     testtabsBarPosition_static_0003
     * @tc.desc     testtabsBarPosition_static_0003
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0003', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testtabsBarPosition_static_0003] fontSize value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontSize'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0004
     * @tc.name     testtabsBarPosition_static_0004
     * @tc.desc     testtabsBarPosition_static_0004
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0004', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity')).assertEqual(1);
      console.info("[testtabsBarPosition_static_0004] opacity value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('opacity'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0005
     * @tc.name     testtabsBarPosition_static_0005
     * @tc.desc     testtabsBarPosition_static_0005
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0005', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testtabsBarPosition_static_0005] align value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('align'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0006
     * @tc.name     testtabsBarPosition_static_0006
     * @tc.desc     testtabsBarPosition_static_0006
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0006', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testtabsBarPosition_static_0006] fontColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0007
     * @tc.name     testtabsBarPosition_static_0007
     * @tc.desc     testtabsBarPosition_static_0007
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0007', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition_static_0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testtabsBarPosition_static_0007] lineHeight value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('lineHeight'));

    });


    
    /**
     * @tc.number   testtabsBarPosition_static_0009
     * @tc.name     testtabsBarPosition_static_0009
     * @tc.desc     testtabsBarPosition_static_0009
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition_static_0009', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition_static_0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtabsBarPosition_static_0009] padding value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('padding'));

    });


    
    /**
     * @tc.number   testtabsBarPosition0010
     * @tc.name     testtabsBarPosition0010
     * @tc.desc     testtabsBarPosition0010
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition0010', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'))
        .assertEqual("TextAlign.Center");
      console.info("[testtabsBarPosition0010] textAlign value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textAlign'));

    });


    
    /**
     * @tc.number   testtabsBarPosition0011
     * @tc.name     testtabsBarPosition0011
     * @tc.desc     testtabsBarPosition0011
     * @tc.level    Level.LEVEL1
     */
it('testtabsBarPosition0011', Level.LEVEL1, async () => {
      console.info('tabsBarPosition testtabsBarPosition0011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionTabs');
      console.info("[testtabsBarPosition0011] component barPosition strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      console.info("[testtabsBarPosition0011] barPosition value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barPosition'));

    });
  })
}
