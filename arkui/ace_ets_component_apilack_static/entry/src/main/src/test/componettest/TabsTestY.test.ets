'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Color, $r } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
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

export default function tabsBarPositionJsunits() {
  describe('tabsBarPositionTest1', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/tabs',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabs state success " + JSON.stringify(pages));
        if (!("tabs" == pages.name)) {
          console.info("get tabs state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push tabs page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("tabsBarPosition after each called");
    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00011
     * @tc.name     testtabsBarPosition_static_00011
     * @tc.desc     testtabsBarPosition_static_00011
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00011', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtabsBarPosition0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00021
     * @tc.name     testtabsBarPosition_static_00021
     * @tc.desc     testtabsBarPosition_static_00021
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00021', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testtabsBarPosition0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00031
     * @tc.name     testtabsBarPosition_static_00031
     * @tc.desc     testtabsBarPosition_static_00031
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00031', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testtabsBarPosition0003] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00041
     * @tc.name     testtabsBarPosition_static_00041
     * @tc.desc     testtabsBarPosition_static_00041
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00041', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testtabsBarPosition0004] opacity value :" + obj.getElement('$attrs').getDouble('opacity'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00051
     * @tc.name     testtabsBarPosition_static_00051
     * @tc.desc     testtabsBarPosition_static_00051
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00051', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testtabsBarPosition0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00061
     * @tc.name     testtabsBarPosition_static_00061
     * @tc.desc     testtabsBarPosition_static_00061
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00061', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testtabsBarPosition0006] fontColor value :" + obj.getElement('$attrs').getString('fontColor'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00071
     * @tc.name     testtabsBarPosition_static_00071
     * @tc.desc     testtabsBarPosition_static_00071
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00071', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testtabsBarPosition0007] lineHeight value :" + obj.getElement('$attrs').getString('lineHeight'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00091
     * @tc.name     testtabsBarPosition_static_00091
     * @tc.desc     testtabsBarPosition_static_00091
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00091', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtabsBarPosition0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00101
     * @tc.name     testtabsBarPosition_static_00101
     * @tc.desc     testtabsBarPosition_static_00101
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00101', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Left");
      console.info("[testtabsBarPosition0010] textAlign value :" + obj.getElement('$attrs').getString('textAlign'));

    });

    
    
    
    /**
     * @tc.number   testtabsBarPosition_static_00111
     * @tc.name     testtabsBarPosition_static_00111
     * @tc.desc     testtabsBarPosition_static_00111
     * @tc.level    Level.LEVEL0
     */
it('testtabsBarPosition_static_00111', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionTabs');
      console.info("[testtabsBarPosition0011] component barPosition strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Tabs');
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual("BarPosition.Start");
      console.info("[testtabsBarPosition0011] barPosition value :" + obj.getElement('$attrs').getString('barPosition'));

    });
  })
}
