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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,

  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function searchTest() {
  describe('searchTest', (): void => {
    beforeAll(() => {
      console.info("searchTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("searchTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchTest state pages:" + "");
        if (!("searchTest" == pages.name)) {
          console.info("get  Context pages.name:" + '');
          routerInstance.pushUrl({
            url: "MainAbility/pages/Search/searchTest"
          })
          await CommonFunc.sleep(2000);
          //console.info("push searchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchTest page error:" + err);
      }
      console.info("searchTest foreEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("searchTest after each called");
    });

    

    
/**
     * @tc.number   searchTest_static_001
     * @tc.name     searchTest_static_001
     * @tc.desc     searchTest_static_001
     * @tc.level    Level.LEVEL3
     */
    it('searchTest_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[searchTest_001] START');

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let text: Component | null = await driver.findComponent(ON.id('searchTest1'));
      text?.inputText('123')
      await CommonFunc.sleep(1000);


        let strJson = inspector.getInspectorByKey('searchTestText3');
        let strJson2 = inspector.getInspectorByKey('searchTestText1');
        await CommonFunc.sleep(200);
        let obj = JSON.parseJsonElement(strJson);
        let obj2 = JSON.parseJsonElement(strJson2);
        console.info("[searchTest_001] component obj is: " + JSON.stringify(obj));
        console.info("[searchTest_001] component obj2 is: " + JSON.stringify(obj2));
        await CommonFunc.sleep(1000);
        expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('true');

      console.info('[searchTest_001] END');
      done();
    });



    
/**
     * @tc.number   searchTest_static_002
     * @tc.name     searchTest_static_002
     * @tc.desc     searchTest_static_002
     * @tc.level    Level.LEVEL3
     */
    it('searchTest_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[searchTest_002] START');

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let text: Component | null = await driver.findComponent(ON.id('searchTest1'));
      let button: Component | null = await driver.findComponent(ON.id('searchTestBt'));
      await CommonFunc.sleep(1000);
      await (text?.click() as Promise<void>);
      console.log("================================== text.click")
      await (button?.click()as Promise<void>);
      console.log("================================== button.click")
      await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('searchTestText3');
        let strJson2 = inspector.getInspectorByKey('searchTestText1');
        await CommonFunc.sleep(2000);
        let obj = JSON.parseJsonElement(strJson);
        let obj2 = JSON.parseJsonElement(strJson2);
        console.info("[searchTest_002] component obj2 is: " + JSON.stringify(obj2));
        await CommonFunc.sleep(1000);
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('false');

      console.info('[searchTest_002] END');
      done();
    })

    

    
/**
     * @tc.number   searchTest_static_003
     * @tc.name     searchTest_static_003
     * @tc.desc     searchTest_static_003
     * @tc.level    Level.LEVEL3
     */
    it('searchTest_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[searchTest_003] START');

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('searchTestBt2'));
      let text: Component | null = await driver.findComponent(ON.id('searchTest1'));
      let text2: Component | null = await driver.findComponent(ON.id('searchTest2'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      text?.longClick();
      await CommonFunc.sleep(2000);
      let text1 = await driver.findComponent(ON.text('全选'));
      await CommonFunc.sleep(1000);
      await (text1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      text?.dragTo(text2!);
      await CommonFunc.sleep(4000);



      let strJson2 = inspector.getInspectorByKey('searchTestText2');
      await CommonFunc.sleep(2000);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[searchTest_002] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[searchTest_002] component obj2 content is: " + obj2.getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('false');

      console.info('[searchTest_003] END');
      done();
    });
  })
}
