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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "../../../../../hypium/index"
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {  Driver, ON } from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextStyle() {
  describe('TextStyle', () => {

    beforeAll(() => {
      console.info("TextStyle beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextApi/TextStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextStyle state pages:" + JSON.stringify(pages));
        if (!("TextStyle" == pages.name)) {
          console.info("get TextStyle pages.name:" + '');
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
     * @tc.number   TextStyle_static_0001
     * @tc.name     TextStyle_static_0001
     * @tc.desc     TextStyle_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0001', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0001] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('buttonStyle');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('buttonStyle')).assertEqual('ButtonStyleMode.EMPHASIZED');

      console.info('[TextStyle_static_0001] END');
      done();
    });

    
    /**
     * @tc.number   TextStyle_static_0002
     * @tc.name     TextStyle_static_0002
     * @tc.desc     TextStyle_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0002', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0002] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('searchEMAIL66666666');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('type')).assertEqual('SearchType.EMAIL');

      console.info('[TextStyle_static_0002] END');
      done();
    });

    
    /**
     * @tc.number   TextStyle_static_0003
     * @tc.name     TextStyle_static_0003
     * @tc.desc     TextStyle_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0003', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0003] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('TextAreaTypeEMAIL333333333');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('type')).assertEqual('TextAreaType.EMAIL');

      console.info('[TextStyle_static_0003] END');
      done();
    });


    
    /**
     * @tc.number   TextStyle_static_0004
     * @tc.name     TextStyle_static_0004
     * @tc.desc     TextStyle_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0004', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0004] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('TextAreaTypeNUMBER44444444');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('type')).assertEqual('TextAreaType.PHONE_NUMBER');

      console.info('[TextStyle_static_0004] END');
      done();
    });


    
    /**
     * @tc.number   TextStyle_static_0005
     * @tc.name     TextStyle_static_0005
     * @tc.desc     TextStyle_static_0005
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0005', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0005] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('TextKeyAllNUMBER8898888888');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('ellipsisMode')).assertEqual('EllipsisMode.START');

      console.info('[TextStyle_static_0005] END');
      done();
    });


    
    /**
     * @tc.number   TextStyle_static_0006
     * @tc.name     TextStyle_static_0006
     * @tc.desc     TextStyle_static_0006
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0006', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0006] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('searchType777777');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('type')).assertEqual('SearchType.PHONE_NUMBER');

      console.info('[TextStyle_static_0006] END');
      done();
    });

    
    /**
     * @tc.number   TextStyle_static_0007
     * @tc.name     TextStyle_static_0007
     * @tc.desc     TextStyle_static_0007
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0007', Level.LEVEL1, async (done: ()=>void) => {

      console.info('[TextStyle_static_0007] START');
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('searchEMAIL66666666');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('type')).assertEqual('SearchType.EMAIL');

      console.info('[TextStyle_static_0007] END');
      done();
    });


    
    /**
     * @tc.number   TextStyle_static_0008
     * @tc.name     TextStyle_static_0008
     * @tc.desc     TextStyle_static_0008
     * @tc.level    Level.LEVEL1
     */
    it('TextStyle_static_0008', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[TextStyle_static_0008] START');
      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('buttonSelect'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('selectionStart');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('10');

      let text2 = inspector.getInspectorByKey('selectionEnd');
      let Obj2  = JSON.parseJsonElement(text2);
      expect(Obj2.getElement('$attrs').getString('content')).assertEqual('30');

      console.info('[TextStyle_static_0008] END');
      done();
    });

  })
}
