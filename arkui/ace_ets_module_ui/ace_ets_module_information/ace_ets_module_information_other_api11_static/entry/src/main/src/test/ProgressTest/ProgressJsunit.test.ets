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

function sleep(time: int) {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function progressJsunit() {
  describe('progressTest', () => {
    beforeAll(() => {
      console.info("progressTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.other.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressA',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Progress state success " + JSON.stringify(pages));
        if (!("Progress" == pages.name)) {
          console.info("get Progress state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push Progress page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Progress after each called");
    });

    
    /**
     * @tc.number   testGetProgressAttr_static_010
     * @tc.name     testGetProgressAttr_static_010
     * @tc.desc     testGetProgressAttr_static_010
     * @tc.level    Level.LEVEL0
     */
it('testGetProgressAttr_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr START');
      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      let objConstructor = JSON.parseJsonElement(obj.getElement('$attrs').getString('constructor'));
      console.log("progress constructor is " + objConstructor);
      expect(obj.getElement('$attrs').getString('value')).assertEqual(3.000000.toFixed(6));
      expect(obj.getString('$type')).assertEqual('Progress');
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF0000FF");
      expect(obj.getElement('$attrs').getString('width')).assertEqual("50.00vp");
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      expect(objConstructor.getString('total')).assertEqual(40.000000.toFixed(6));
      expect(objConstructor.getString('type')).assertEqual("ProgressStyle.Linear");
      console.info('testGetProgressAttr END');
      done();
    });

    
    /**
     * @tc.number   testGetProgressAttr_static_020
     * @tc.name     testGetProgressAttr_static_020
     * @tc.desc     testGetProgressAttr_static_020
     * @tc.level    Level.LEVEL0
     */
it('testGetProgressAttr_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr2 START');
      let strJson = inspector.getInspectorByKey('progress2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      let objConstructor = JSON.parseJsonElement(obj.getElement('$attrs').getString('constructor'));
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getString('type')).assertEqual("ProgressStyle.Eclipse");
      console.info('testGetProgressAttr2 END');
      done();
    });

    
    /**
     * @tc.number   testGetProgressAttr_static_030
     * @tc.name     testGetProgressAttr_static_030
     * @tc.desc     testGetProgressAttr_static_030
     * @tc.level    Level.LEVEL0
     */
it('testGetProgressAttr_static_030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr3 START');
      let strJson = inspector.getInspectorByKey('progress3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      let objConstructor = JSON.parseJsonElement(obj.getElement('$attrs').getString('constructor'));
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getString('type')).assertEqual("ProgressStyle.Ring");
      console.info('testGetProgressAttr3 END');
      done();
    });

    
    /**
     * @tc.number   testGetProgressAttr_static_040
     * @tc.name     testGetProgressAttr_static_040
     * @tc.desc     testGetProgressAttr_static_040
     * @tc.level    Level.LEVEL0
     */
it('testGetProgressAttr_static_040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr4 START');
      let strJson = inspector.getInspectorByKey('progress4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      let objConstructor = JSON.parseJsonElement(obj.getElement('$attrs').getString('constructor'));
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getString('type')).assertEqual("ProgressStyle.ScaleRing");
      console.info('testGetProgressAttr4 END');
      done();
    });

    
    /**
     * @tc.number   testGetProgressAttr_static_050
     * @tc.name     testGetProgressAttr_static_050
     * @tc.desc     testGetProgressAttr_static_050
     * @tc.level    Level.LEVEL0
     */
it('testGetProgressAttr_static_050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr5 START');
      let strJson = inspector.getInspectorByKey('progress5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      let objConstructor = JSON.parseJsonElement(obj.getElement('$attrs').getString('constructor'));
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getString('type')).assertEqual("ProgressStyle.Capsule");
      console.info('testGetProgressAttr5 END');
      done();
    });
  })
}
