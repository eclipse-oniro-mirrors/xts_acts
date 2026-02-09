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
import { Text, InputType, Color, TextAlign, } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, Level,beforeAll } from "../../../../hypium/index";
import {  Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textInputJsunit3() {
  describe('appInfoTest_four_12', () => {

    beforeAll(() => {
      console.info("appInfoTest_four_12 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("appInfoTest_four_12 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInput3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router

        let pages:router.RouterState = routerInstance.getState();
        console.info("get appInfoTest_four_12 state pages:" + JSON.stringify(pages));
        if (!("textInput3" == pages.name)) {
          routerInstance.clear();
          console.info("get appInfoTest_four_12 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push appInfoTest_four_12 page error:" + err);
      }
      console.info("appInfoTest_four_12 beforeEach end");
    });



    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInput after each called");
    });

    /**
     * @tc.number   textInputTest_static_01
     * @tc.name     textInputTest_static_01
     * @tc.desc     textInputTest_static_01
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_01', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextInput');

      console.info("[textInputTest_static_01] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('textInputTest_static_01 END');
      done();
    });

    /**
     * @tc.number   textInputTest_static_02
     * @tc.name     textInputTest_static_02
     * @tc.desc     textInputTest_static_02
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_02', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_02] START');
      try {
        AppStorage.setOrCreate<number>("fontSize", 16)
      } catch (err:Error) {
        console.log("[textInputTest_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextInput');

      console.info("[textInputTest_static_02] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      done();
    });

    /**
     * @tc.number   textInputTest_static_03
     * @tc.name     textInputTest_static_03
     * @tc.desc     textInputTest_static_03
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_03', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_03] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('TextInput');
      console.info("[textInputTest_static_03] component strJson:" + strJson);

      console.info("[textInputTest_static_03] fontColor:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FF000000');
      done();
    });

    /**
     * @tc.number   textInputTest_static_04
     * @tc.name     textInputTest_static_04
     * @tc.desc     textInputTest_static_04
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_04', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_04] START');
      try {
        AppStorage.setOrCreate<Color>("fontColor", Color.Red)
      } catch (err:Error) {
        console.log("[textInputTest_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextInput');

      console.info("[textInputTest_static_04] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
      done();
    });

    /**
     * @tc.number   textInputTest_static_05
     * @tc.name     textInputTest_static_05
     * @tc.desc     textInputTest_static_05
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_05', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextInput');

      console.info("[textInputTest_static_05] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('inputType')).assertEqual(undefined);
      done();
    });

    /**
     * @tc.number   textInputTest_static_06
     * @tc.name     textInputTest_static_06
     * @tc.desc     textInputTest_static_06
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_06', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_06] START');
      try {
        AppStorage.setOrCreate<InputType>("inputType", InputType.Email)
      } catch (err:Error) {
        console.log("[textInputTest_static_06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextInput');

      console.info("[textInputTest_static_06] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('inputType')).assertEqual(undefined);
      done();
    });

    /**
     * @tc.number   textInputTest_static_07
     * @tc.name     textInputTest_static_07
     * @tc.desc     textInputTest_static_07
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_07', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_07] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('TextInput');
      console.info("[textInputTest_static_07] component strJson:" + strJson);

      console.info("[textInputTest_static_07] textAlign:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      done();
    });

    /**
     * @tc.number   textInputTest_static_08
     * @tc.name     textInputTest_static_08
     * @tc.desc     textInputTest_static_08
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_08', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_08] START');
      try {
        AppStorage.setOrCreate<TextAlign>("textAlign", TextAlign.Start)
      } catch (err:Error) {
        console.log("[textInputTest_static_08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextInput');

      console.info("[textInputTest_static_08] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      done();
    });

    
    /**
     * @tc.number   textInputTest_static_09
     * @tc.name     textInputTest_static_09
     * @tc.desc     textInputTest_static_09
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_09', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_09] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText2'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index0');
      done();
    });

    
    /**
     * @tc.number   textInputTest_static_10
     * @tc.name     textInputTest_static_10
     * @tc.desc     textInputTest_static_10
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_10', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textInputTest_static_10] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>("text2", '123456789')
      } catch (err:Error) {
        console.log("[textInputTest_static_10] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText2'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index9');
      done();
    });

    
    /**
     * @tc.number   textInputTest_static_11
     * @tc.name     textInputTest_static_11
     * @tc.desc     textInputTest_static_11
     * @tc.level    Level.LEVEL1
     */
    it('textInputTest_static_11', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textAreaTest_static_13] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>("text2", '1234567890abc')
      } catch (err:Error) {
        console.log("[textInputTest_static_11] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText2'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
