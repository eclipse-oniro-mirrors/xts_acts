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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: int) {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function datapanelJsunit() {


  describe('dataPanelTest', () => {
    beforeAll(() => {
      console.info("dataPanelTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanel',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("DataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("DataPanel after each called");
    });

    
    /**
     * @tc.number   testDataPanelGetInspectorByKey_static_010
     * @tc.name     testDataPanelGetInspectorByKey_static_010
     * @tc.desc     testDataPanelGetInspectorByKey_static_010
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelGetInspectorByKey_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('DataPanel');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("cd DataPanel type " + JSON.stringify(obj.getString('$type')));
      console.log("cd DataPanel values" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('values')));
      console.log("cd  DataPanel max" + JSON.stringify(obj.getElement('$attrs').getString('max')));
      console.log("panel closeEffect" + JSON.stringify(obj.getElement('$attrs').getString('closeEffect')));
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual("false");
      expect(obj.getString('$type')).assertEqual("DataPanel");
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('values'))).assertEqual('[20,40,20]')
      expect(obj.getElement('$attrs').getString('max')).assertEqual(100.000000.toFixed(6));
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   testDataPanelGetInspectorByKey_static_020
     * @tc.name     testDataPanelGetInspectorByKey_static_020
     * @tc.desc     testDataPanelGetInspectorByKey_static_020
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelGetInspectorByKey_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('DataPanel2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("cd DataPanel dataPanelType" + JSON.stringify(obj.getElement('$attrs')));
      console.log("cd DataPanel Type" + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual("DataPanelType.Circle");
      console.log("panel closeEffect" + JSON.stringify(obj.getElement('$attrs').getString('closeEffect')));
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual("true");
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   testDataPanelGetInspectorByKey_static_030
     * @tc.name     testDataPanelGetInspectorByKey_static_030
     * @tc.desc     testDataPanelGetInspectorByKey_static_030
     * @tc.level    Level.LEVEL0
     */
it('testDataPanelGetInspectorByKey_static_030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanelGetInspectorByKey_static_030 START');
      let strJson = inspector.getInspectorByKey('DataPanel3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testDataPanelGetInspectorByKey_static_030 component obj is: " + strJson);
      console.log("testDataPanelGetInspectorByKey_static_030 type " + JSON.stringify(obj.getString('$type')));
      console.log("testDataPanelGetInspectorByKey_static_030 closeEffect" + obj.getElement('$attrs').getString('closeEffect'));
      console.log("testDataPanelGetInspectorByKey_static_030 max" + JSON.stringify(obj.getElement('$attrs').getString('max')));
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual('false');
      expect(obj.getString('$type')).assertEqual("DataPanel");
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('values'))).assertEqual('[20,40,20]');
      expect(obj.getElement('$attrs').getString('max')).assertEqual(100.000000.toFixed(6));
      console.info('testDataPanelGetInspectorByKey_static_030 END');
      done();
    });
  })
}
