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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';


export default function datapanelJsunit() {
  describe('dataPanelTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPanel',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
       await UtilsTest.msSleep(1000);
        let pages = routerInstance.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("dataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   testDataPanelStatic01
     * @tc.name     testDataPanelStatic01
     * @tc.desc     testDataPanelStatic01
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelStatic01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelStatic01 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parseJsonElement(strJson)" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("6.000000")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("2.000000")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("1.000000")
      console.info('testDataPanelStatic01 END');
      done();
    });

    
    
    /**
     * @tc.number   testDataPanelStatic02
     * @tc.name     testDataPanelStatic02
     * @tc.desc     testDataPanelStatic02
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelStatic02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelStatic02 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parseJsonElement(strJson)" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth')).assertEqual("25.00vp")
      console.info('testDataPanelStatic02 END');
      done();
    });

    
    
    /**
     * @tc.number   testDataPanelStatic03
     * @tc.name     testDataPanelStatic03
     * @tc.desc     testDataPanelStatic03
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelStatic03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelStatic03 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parseJsonElement(strJson)" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackBackgroundColor')).assertEqual("#08182431")
      console.info('testDataPanelStatic03 END');
      done();
    });

    
    
    /**
     * @tc.number   testDataPanelStatic04
     * @tc.name     testDataPanelStatic04
     * @tc.desc     testDataPanelStatic04
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelStatic04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelStatic04 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parseJsonElement(strJson)" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('valueColors')))
        .assertEqual('[[{"color":"#FF123456","offset":"0.000000"},{"color":"#FF123456","offset":"1.000000"}],[{"color":"#FF654321","offset":"0.000000"},{"color":"#FF654321","offset":"1.000000"}]]')
      console.info('testDataPanelStatic04 END');
      done();
    });

    
    
    /**
     * @tc.number   testDataPanelStatic05
     * @tc.name     testDataPanelStatic05
     * @tc.desc     testDataPanelStatic05
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelStatic05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelStatic05 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parseJsonElement(strJson)" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('closeEffect')).assertEqual("true")
      console.info('testDataPanelStatic05 END');
      done();
    });

    
    
    /**
     * @tc.number   testDataPanelStatic06
     * @tc.name     testDataPanelStatic06
     * @tc.desc     testDataPanelStatic06
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelStatic06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelStatic06 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('DataPanelKey1'); //测试组件的key名称
      console.info("testDataPanelStatic06 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp'); //
      console.info('testDataPanelStatic06 END');
      done();
    });

  })
}