'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { TextAlign } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from "../../../../hypium/index";
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
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textAreaJsunit3() {
  describe('appInfoTest_four_10', () => {

    beforeAll(() => {
      console.info("appInfoTest_four_10 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("appInfoTest_four_10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textArea3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = routerInstance.getState();
        console.info("get appInfoTest_four_10 state pages:" + JSON.stringify(pages));
        if (!("textArea3" == pages.name)) {
          routerInstance.clear();
          console.info("get appInfoTest_four_10 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push appInfoTest_four_10 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push appInfoTest_four_10 page error:" + err);
      }
      console.info("appInfoTest_four_10 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textArea after each called");
    });

    
    /**
     * @tc.number   textAreaTest_static_01
     * @tc.name     textAreaTest_static_01
     * @tc.desc     textAreaTest_static_01
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_01', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');
      console.info("[textAreaTest_static_01] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual('30.00fp');
      console.info('textAreaTest_static_01 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_02
     * @tc.name     textAreaTest_static_02
     * @tc.desc     textAreaTest_static_02
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_02', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_02] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "fontSize": 50 as double,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 215,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_02] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_02] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual('50.00fp');
      console.info('textAreaTest_static_02 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_03
     * @tc.name     textAreaTest_static_03
     * @tc.desc     textAreaTest_static_03
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_03', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_03] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_03] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      // 适配开发侧非法入参修改
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FF182432');
      console.info('textAreaTest_static_03 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_04
     * @tc.name     textAreaTest_static_04
     * @tc.desc     textAreaTest_static_04
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_04', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_04] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "fontColor": '#FFFF0000',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 216,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_04] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_04] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
      console.info('textAreaTest_static_04 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_05
     * @tc.name     textAreaTest_static_05
     * @tc.desc     textAreaTest_static_05
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_05', Level.LEVEL1, async (done: () => void) => {
      console.info('[testArea05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_05] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'))
        .assertEqual('TextAlign.Center');
      console.info('textAreaTest_static_05 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_06
     * @tc.name     textAreaTest_static_06
     * @tc.desc     textAreaTest_static_06
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_06', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_06] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "textAlign": TextAlign.Start,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 217,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_06] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_06] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('textAreaTest_static_06 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_07
     * @tc.name     textAreaTest_static_07
     * @tc.desc     textAreaTest_static_07
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_07', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_07] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_07] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .tryGetElement('constructor')
      ));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('constructor'))
        .assertEqual(undefined);
      console.info('textAreaTest_static_07 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_08
     * @tc.name     textAreaTest_static_08
     * @tc.desc     textAreaTest_static_08
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_08', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_08] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "text": 'TextArea_1',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 218,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_08] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_08] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .tryGetElement('constructor')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('constructor'))
        .assertEqual(undefined);
      console.info('textAreaTest_static_08 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_09
     * @tc.name     textAreaTest_static_09
     * @tc.desc     textAreaTest_static_09
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_09', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_09] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_09] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('textAreaTest_static_09 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_10
     * @tc.name     textAreaTest_static_10
     * @tc.desc     textAreaTest_static_10
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_10', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_10] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "textAlign": TextAlign.Start,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 218,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_10] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_10] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textArea');

      console.info("[textAreaTest_static_10] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('textAreaTest_static_10 END');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_11
     * @tc.name     textAreaTest_static_11
     * @tc.desc     textAreaTest_static_11
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_11', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_11] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn1'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText1'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index0');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_12
     * @tc.name     textAreaTest_static_12
     * @tc.desc     textAreaTest_static_12
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_12', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_12] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "text2": '123456789'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 218,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_12] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_12] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn1'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText1'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index9');
      done();
    });

    
    /**
     * @tc.number   textAreaTest_static_13
     * @tc.name     textAreaTest_static_13
     * @tc.desc     textAreaTest_static_13
     * @tc.level    Level.LEVEL1
     */
    it('textAreaTest_static_13', Level.LEVEL1, async (done: () => void) => {
      console.info('[textAreaTest_static_13] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "text2": '1234567890abc'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 218,
          priority: emitter.EventPriority.LOW
        }
        console.info("[textAreaTest_static_13] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[textAreaTest_static_13] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn1'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText1'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
