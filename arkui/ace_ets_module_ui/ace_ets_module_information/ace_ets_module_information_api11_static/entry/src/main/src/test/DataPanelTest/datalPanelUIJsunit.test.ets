'use static';
/**
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
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode } from '@ohos.UiTest';
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
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { DataPanelType } from '@ohos.arkui.component'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';
const waitUiReadyMs = 1000;

export default function  datalPanelUIJsunit() {
  describe('datalPanelUIJsunit', () => {
    beforeAll(() => {
      console.info("datalPanelUIJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      console.info("datalPanelUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DatalPanelUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get datalPanelUIJsunit state pages:" + JSON.stringify(pages));
        if (!("DatalPanelUI" == pages.name)) {
          console.info("get datalPanelUIJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
          console.error("push datalPanelUIJsunit page error:" + err);
	        expect().assertFail();
      }
    });

    /**
     * @tc.number   datalPanelUIJsunit_static_0100
     * @tc.name     datalPanelUIJsunit_static_0100
     * @tc.desc     datalPanelUIJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
       console.info('datalPanelUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the datelPanel component and test attribute
       let strJson = inspector.getInspectorByKey('dp1');
       let obj = JSON.parseJsonElement(strJson);
       console.info("datalPanelUIJsunit_0100'] component obj is: " + strJson);
       let valus = obj.getElement('$attrs').getElement('values');
       let expectV = '[25,1]';
  console.info("datalPanelUIJsunit_0100'] String(valus) is: " , JSON.stringifyJsonElement(valus),expectV);
       expect(JSON.stringifyJsonElement(valus) == expectV).assertTrue();
       expect(obj.getElement('$attrs').getString('max')).assertEqual('26.000000');
       expect(obj.getElement('$attrs').getString('type')).assertEqual('DataPanelType.Line');
       done();
    });

   /**
     * @tc.number   datalPanelUIJsunit_static_0200
     * @tc.name     datalPanelUIJsunit_static_0200
     * @tc.desc     datalPanelUIJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of DataPanel dynamically
  AppStorage.setOrCreate<DataPanelType>('dataPanelType',DataPanelType.Line)

     await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('DataPanelType.Line');
      done();
    });

    /**
     * @tc.number   datalPanelUIJsunit_static_0300
     * @tc.name     datalPanelUIJsunit_static_0300
     * @tc.desc     datalPanelUIJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the attribute illegal value of DataPanel dynamically
      // const message:MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      // message.notify({name:'dataPanelType', value:3})
  AppStorage.setOrCreate<DataPanelType>('dataPanelType',DataPanelType.Circle)
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_0300'] component obj is: " + JSON.stringify(obj));
      // check the default value
      expect(obj.getElement('$attrs').getString('type')).assertEqual('DataPanelType.Circle');
      done();
    });

    /**
     * @tc.number   datalPanelUIJsunit_static_0400
     * @tc.name     datalPanelUIJsunit_static_0400
     * @tc.desc     datalPanelUIJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0400 START');
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<Array<number>>('values',[10,10,10,10,10,10,10,10,10])
      await CommonFunc.sleep(200);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_0400'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('values')));
      let valus = obj.getElement('$attrs').getElement('values');
      let expectV = '[10,10,10,10,10,10,10,10,10]';
      expect(JSON.stringifyJsonElement(valus) == expectV).assertTrue();
      done();
    });

    /**
     * @tc.number   datalPanelUIJsunit_static_0500
     * @tc.name     datalPanelUIJsunit_static_0500
     * @tc.desc     datalPanelUIJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // modify the values ten attribute value of DataPanel dynamically
  AppStorage.setOrCreate<Array<number>>('values',[-50,33,1,22,33,33,333,21,31,10])
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_0500'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('values')));
      let valus= obj.getElement('$attrs').getElement('values');
      let expectV = '[0,33,1,22,33,33,333,21,31]';
      expect(JSON.stringifyJsonElement(valus) == expectV).assertTrue();
      expect(obj.getElement('$attrs').getString('max')).assertEqual('507.000000');
      done();
    });

    /**
     * @tc.number   datalPanelUIJsunit_static_0600
     * @tc.name     datalPanelUIJsunit_static_0600
     * @tc.desc     datalPanelUIJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // modify the max attribute value of DataPanel dynamically
  AppStorage.setOrCreate<number>('maxValue',27)

      await CommonFunc.sleep(2000);
      // check the max value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_0600'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('max')).assertEqual('27.000000');
      done();
    });

    /**
     * @tc.number   datalPanelUIJsunit_static_0700
     * @tc.name     datalPanelUIJsunit_static_0700
     * @tc.desc     datalPanelUIJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // fix value num
  AppStorage.setOrCreate<Array<number>>('values',[-3,10,10,10,10,10,10,10,10,90])
      await CommonFunc.sleep(2000);
      // modify the max attribute value of DataPanel dynamically
  AppStorage.setOrCreate<number>('maxValue',-30)
      await CommonFunc.sleep(2000);
      // check the max value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('max')).assertEqual('80.000000');
      done();
    });

     /**
     * @tc.number   datalPanelUIJsunit_static_0800
     * @tc.name     datalPanelUIJsunit_static_0800
     * @tc.desc     datalPanelUIJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('datalPanelUIJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_0800 START');
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<Array<number>>('values',[10,10,10,10,10,10,10,10,10])
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>('maxValue',0)
      await CommonFunc.sleep(2000);
      // check the max value of changed attribute
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_0800'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('max')));
      expect(obj.getElement('$attrs').getString('max')).assertEqual('90.000000');
      done();
    }); 
  })
}