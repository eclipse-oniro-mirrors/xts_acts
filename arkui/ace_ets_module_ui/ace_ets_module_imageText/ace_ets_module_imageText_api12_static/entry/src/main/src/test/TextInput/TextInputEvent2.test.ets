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

export default function TextInputEvent2() {
  describe('TextInputEvent2', () => {
    beforeAll(() => {
      console.info("TextInputEvent2 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputEvent2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputEvent2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputEvent2 state pages:" + JSON.stringify(pages));
        if (!("TextInputEvent2" == pages.name)) {
          console.info("get TextInputEvent2 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputEvent2 page error:" + err);
      }
      console.info("TextInputEvent2 beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputEvent2 after each called");
    });

    

    /**
     * @tc.number   TextInputEvent2_static_001
     * @tc.name     TextInputEvent2_static_001
     * @tc.desc     TextInputEvent2_static_001
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event')) as Promise<Component>);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text')
      let strJson2 = inspector.getInspectorByKey('TextInputEvent2Text2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent2_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('0123');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[TextInputEvent2_001] END');
      done();

    });

    /**
     * @tc.number   TextInputEvent2_static_002
     * @tc.name     TextInputEvent2_static_002
     * @tc.desc     TextInputEvent2_static_002
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event2')) as Promise<Component>);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text')
      let strJson2 = inspector.getInspectorByKey('TextInputEvent2Text2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent2_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('01');
      console.info('[TextInputEvent2_002] END');
      done();

    });

    /**
     * @tc.number   TextInputEvent2_static_003
     * @tc.name     TextInputEvent2_static_003
     * @tc.desc     TextInputEvent2_static_003
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event3')) as Promise<Component>);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text3')
      let strJson2 = inspector.getInspectorByKey('TextInputEvent2Text4');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent2_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('01');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[TextInputEvent2_003] END');
      done();

    });

    /**
     * @tc.number   TextInputEvent2_static_004
     * @tc.name     TextInputEvent2_static_004
     * @tc.desc     TextInputEvent2_static_004
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_004] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event4')) as Promise<Component>);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text3')
      let strJson2 = inspector.getInspectorByKey('TextInputEvent2Text4');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent2_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[TextInputEvent2_004] END');
      done();

    });

    /**
     * @tc.number   TextInputEvent2_static_005
     * @tc.name     TextInputEvent2_static_005
     * @tc.desc     TextInputEvent2_static_005
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_005] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event5')) as Promise<Component>);
      let button = await (driver.findComponent(ON.id('TextInput2EventBt')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text5')
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputEvent2_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillInsert');
      console.info('[TextInputEvent2_005] END');
      done();

    });

    /**
     * @tc.number   TextInputEvent2_static_006
     * @tc.name     TextInputEvent2_static_006
     * @tc.desc     TextInputEvent2_static_006
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_006] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event5')) as Promise<Component>);
      let button = await (driver.findComponent(ON.id('TextInput2EventBt2')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text5')
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputEvent2_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillInsert');
      console.info('[TextInputEvent2_006] END');
      done();

    });

    /**
     * @tc.number   TextInputEvent2_static_007
     * @tc.name     TextInputEvent2_static_007
     * @tc.desc     TextInputEvent2_static_007
     * @tc.level   Level.LEVEL0
     */
    it('TextInputEvent2_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent2_007] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('TextInput2Event6')) as Promise<Component>);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEvent2Text5')
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputEvent2_007] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillInsert');
      console.info('[TextInputEvent2_007] END');
      done();

    });

  })
}
