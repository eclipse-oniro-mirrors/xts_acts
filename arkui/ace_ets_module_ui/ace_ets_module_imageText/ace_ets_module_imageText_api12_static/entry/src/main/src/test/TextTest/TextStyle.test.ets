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
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextStyle() {
  describe('TextStyle', () => {
    beforeAll(() => {
      console.info("TextStyle beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextStyle",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStyle state pages:" + JSON.stringify(pages));
        if (!("TextStyle" == pages.name)) {
          console.info("get TextStyle pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextStyle page error:" + err);
      }
      console.info("TextStyle beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyle after each called");
    });

    

    /**
     * @tc.number   TextStyle_static_001
     * @tc.name     TextStyle_static_001
     * @tc.desc     TextStyle_static_001
     * @tc.level   Level.LEVEL0
     */
    it('TextStyle_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyle_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('getStyle')) as Promise<Component>);
      await button1.click();
      console.info("TextStyle_001 click success");

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textStyle1');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyle_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('030#FF0000FF');
      console.info('[TextStyle_001] END');
      done();

    });

    /**
     * @tc.number   TextStyle_static_002
     * @tc.name     TextStyle_static_002
     * @tc.desc     TextStyle_static_002
     * @tc.level   Level.LEVEL0
     */
    it('TextStyle_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyle_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('subStyledString')) as Promise<Component>);
      await button1.click();
      console.info("TextStyle_002 click success");

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textStyle1');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyle_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '{}').assertTrue();
      console.info('[TextStyle_002] END');
      done();

    });

    /**
     * @tc.number   TextStyle_static_003
     * @tc.name     TextStyle_static_003
     * @tc.desc     TextStyle_static_003
     * @tc.level   Level.LEVEL0
     */
    it('TextStyle_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyle_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('replaceStyle')) as Promise<Component>);
      await button1.click();
      console.info("TextStyle_003 click success");

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyle_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('030#FFFFC0CB');
      console.info('[TextStyle_003] END');
      done();

    });

    /**
     * @tc.number   TextStyle_static_004
     * @tc.name     TextStyle_static_004
     * @tc.desc     TextStyle_static_004
     * @tc.level   Level.LEVEL0
     */
    it('TextStyle_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyle_004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('replaceString')) as Promise<Component>);
      await button1.click();
      console.info("TextStyle_004 click success");

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyle_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('030#FFFFC0CB');
      console.info('[TextStyle_004] END');
      done();

    });

    /**
     * @tc.number   TextStyle_static_005
     * @tc.name     TextStyle_static_005
     * @tc.desc     TextStyle_static_005
     * @tc.level   Level.LEVEL0
     */
    it('TextStyle_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyle_005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('insertString')) as Promise<Component>);
      await button1.click() ;
      console.info("TextStyle_005 click success");

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyle_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('040#FFFFC0CB');
      console.info('[TextStyle_005] END');
      done();

    });

    /**
     * @tc.number   TextStyle_static_006
     * @tc.name     TextStyle_static_006
     * @tc.desc     TextStyle_static_006
     * @tc.level   Level.LEVEL0
     */
    it('TextStyle_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyle_006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('removeString')) as Promise<Component>);
      await button1.click();
      console.info("TextStyle_006 click success");

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyle_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('030#FFFFC0CB');
      console.info('[TextStyle_006] END');
      done();

    });

  })
}
