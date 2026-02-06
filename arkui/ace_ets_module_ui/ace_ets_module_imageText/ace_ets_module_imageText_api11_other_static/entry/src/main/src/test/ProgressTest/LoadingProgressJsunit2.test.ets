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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color } from '@ohos.arkui.component';

export default function loadingProgressJsunit2() {
  describe('loadingProgressTest2', () => {

    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/loadingProgress2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get loadingProgress state pages:" + JSON.stringify(pages));
        if (!("loadingProgress2" == pages.name)) {
          console.info("get loadingProgress pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push loadingProgress page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push loadingProgress page error " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("loadingProgress after each called");
    });

    
/**
     * @tc.number   testLoadingProgress_100
     * @tc.name     testLoadingProgress_100
     * @tc.desc     testLoadingProgress_100
     * @tc.level    Level.LEVEL1
     */
it('testLoadingProgress_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_100] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_100 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual("#FF000000");
      console.info('testLoadingProgress_100 END');
      done();
    });

    
/**
     * @tc.number   testLoadingProgress_200
     * @tc.name     testLoadingProgress_200
     * @tc.desc     testLoadingProgress_200
     * @tc.level    Level.LEVEL1
     */
it('testLoadingProgress_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_200] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_200 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('borderRadius') instanceof Object).assertTrue();
      console.info('testLoadingProgress_200 END');
      done();
    });

    
/**
     * @tc.number   testLoadingProgress_300
     * @tc.name     testLoadingProgress_300
     * @tc.desc     testLoadingProgress_300
     * @tc.level    Level.LEVEL1
     */
it('testLoadingProgress_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_300] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_300 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('height')).assertEqual("50.00vp");
      console.info('testLoadingProgress_300 END');
      done();
    });

    
/**
     * @tc.number   testLoadingProgress_400
     * @tc.name     testLoadingProgress_400
     * @tc.desc     testLoadingProgress_400
     * @tc.level    Level.LEVEL1
     */
it('testLoadingProgress_400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_400] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_400 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual("0.00vp");
      console.info('testLoadingProgress_400 END');
      done();
    });

    
/**
     * @tc.number   testLoadingProgress_500
     * @tc.name     testLoadingProgress_500
     * @tc.desc     testLoadingProgress_500
     * @tc.level    Level.LEVEL1
     */
it('testLoadingProgress_500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_500] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_500 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('borderStyle')).assertEqual("BorderStyle.Solid");
      console.info('testLoadingProgress_500 END');
      done();
    });

    
/**
     * @tc.number   testLoadingProgress_600
     * @tc.name     testLoadingProgress_600
     * @tc.desc     testLoadingProgress_600
     * @tc.level    Level.LEVEL1
     */
it('testLoadingProgress_600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_600] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_600 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#00000000");
      console.info('testLoadingProgress_600 END');
      done();
    });
  })
}
