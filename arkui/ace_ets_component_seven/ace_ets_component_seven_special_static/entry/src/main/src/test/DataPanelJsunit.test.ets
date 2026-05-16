'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function datapanelJsunit() {
  describe('dataPanelTest', () => {
    beforeAll(() => {
      console.info("dataPanelTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPanel',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await Utils.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("dataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push DataPanel page success " + JSON.stringify(result));
        }
      } catch (err) {
        // console.error("push DataPanel page error " + JSON.stringify(result));
      }
      await Utils.sleep(2000);
    });


    
    /**
     * @tc.number   testDataPanel01_static_01
     * @tc.name     testDataPanel01_static_01
     * @tc.desc     testDataPanel01_static_01
     * @tc.level    Level.LEVEL0
     */
it('testDataPanel01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel01_static_01 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("6.000000")
      expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("2.000000")
      expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("1.000000")
      console.info('testDataPanel01_static_01 END');
      done();
    });

    
    /**
     * @tc.number   testDataPanel02_static_02
     * @tc.name     testDataPanel02_static_02
     * @tc.desc     testDataPanel02_static_02
     * @tc.level    Level.LEVEL0
     */
it('testDataPanel02_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel02_static_02 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual("25.00vp")
      console.info('testDataPanel02_static_02 END');
      done();
    });


    
    /**
     * @tc.number   testDataPanel03_static_03
     * @tc.name     testDataPanel03_static_03
     * @tc.desc     testDataPanel03_static_03
     * @tc.level    Level.LEVEL0
     */
it('testDataPanel03_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel03_static_03 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual("#08182431")
      console.info('testDataPanel03_static_03 END');
      done();
    });


    
    /**
     * @tc.number   testDataPanel04_static_04
     * @tc.name     testDataPanel04_static_04
     * @tc.desc     testDataPanel04_static_04
     * @tc.level    Level.LEVEL0
     */
it('testDataPanel04_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel04_static_04 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.getElement('$attrs')));
      console.log("cd DataPanel obj valueColors0 = " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('valueColors')[0]));
      console.log("cd DataPanel obj valueColors1 = " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('valueColors')[1]));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('valueColors')[0]))
        .assertEqual('[{"color":"#FF123456","offset":"0.000000"},{"color":"#FF123456","offset":"1.000000"}]')
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('valueColors')[1]))
        .assertEqual('[{"color":"#FF654321","offset":"0.000000"},{"color":"#FF654321","offset":"1.000000"}]')
      console.info('testDataPanel04_static_04 END');
      done();
    });


    
    /**
     * @tc.number   testDataPanel05_static_05
     * @tc.name     testDataPanel05_static_05
     * @tc.desc     testDataPanel05_static_05
     * @tc.level    Level.LEVEL0
     */
it('testDataPanel05_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel05_static_05 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual("true")
      console.info('testDataPanel05_static_05 END');
      done();
    });
  })
}