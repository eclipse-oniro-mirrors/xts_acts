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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function getTarget1Test() {
  describe('getTarget1Test', () => {

    beforeAll(() => {
      console.info("getTarget1Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("getTarget1Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getTarget/getTarget1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getTarget1Test state pages:" + JSON.stringify(pages));
        if (!("getTarget1Test" == pages.name)) {
          console.info("get getTarget1Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push getTarget1Test page error:" + err);
      }
      console.info("getTarget1Test beforeEach end");
    });


    
    
    /**
     * @tc.number   getTarget1Test_static_0100
     * @tc.name     getTarget1Test_static_0100
     * @tc.desc     getTarget1Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getTarget1Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('getTarget1Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
 
      let strJson = inspector.getInspectorByKey('useGetTarget1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('this.observedObject === observedClass: true');

      strJson = inspector.getInspectorByKey('useGetTarget2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.nonObservedObject) === nonObservedClass: true');

      strJson = inspector.getInspectorByKey('useGetTarget3');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.numberList) === globalNumberList: true');

      strJson = inspector.getInspectorByKey('useGetTarget4');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.sampleMap) === globalSampleMap: true');

      strJson = inspector.getInspectorByKey('useGetTarget5');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.sampleSet) === globalSampleSet: true');

      strJson = inspector.getInspectorByKey('useGetTarget6');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.sampleDate) === globalSampleDate: true');

      strJson = inspector.getInspectorByKey('noUseGetTarget1');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.nonObservedObject) === nonObservedClass: true');

      strJson = inspector.getInspectorByKey('noUseGetTarget2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.numberList) === globalNumberList: false');

      strJson = inspector.getInspectorByKey('noUseGetTarget3');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.sampleMap) === globalSampleMap: false');

      strJson = inspector.getInspectorByKey('noUseGetTarget4');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.sampleSet) === globalSampleSet: false');

      strJson = inspector.getInspectorByKey('noUseGetTarget5');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget1Test_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.sampleDate) === globalSampleDate: false');

      console.info('[getTarget1Test_static_0100] END');
      done();
    });
  })
}

