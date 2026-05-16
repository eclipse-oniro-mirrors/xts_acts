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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { ResourceColor } from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { describe, beforeEach, afterEach, it, expect, Level,beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textClockJsunit() {
  describe('appInfoTest_four_11', () => {


    beforeAll(() => {
      console.info("appInfoTest_four_11 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("appInfoTest_four_11 beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textClock',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get appInfoTest_four_11 state pages:" + JSON.stringify(pages));
        if (!("textClock" == pages.name)) {
          console.info("get appInfoTest_four_11 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push appInfoTest_four_11 page error:" + err);
      }
      console.info("appInfoTest_four_11 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("text after each called");
    });

    
    /**
     * @tc.number   textClockTest_static_01
     * @tc.name     textClockTest_static_01
     * @tc.desc     textClockTest_static_01
     * @tc.level    Level.LEVEL2
     */
    it('textClockTest_static_01', Level.LEVEL2, async (done: ()=>void) => {
      console.info('textClockTest_static_01 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textClock');
      let obj = JSON.parseJsonElement(strJson);
      // console.info("textClockTest_static_01 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('30.00fp');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   textClockTest_static_02
     * @tc.name     textClockTest_static_02
     * @tc.desc     textClockTest_static_02
     * @tc.level    Level.LEVEL2
     */
    it('textClockTest_static_02', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[textClockTest_static_02] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>("fontSize", 30)
      } catch (err: Error) {
        console.log("[textClockTest_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('textClock');
      console.info("[textClockTest_static_02] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize')).assertEqual('30.00fp');
      done();
    });

    
    /**
     * @tc.number   textClockTest_static_03
     * @tc.name     textClockTest_static_03
     * @tc.desc     textClockTest_static_03
     * @tc.level    Level.LEVEL2
     */
    it('textClockTest_static_03', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[textClockTest_static_03] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('textClock');
      console.info("[textClockTest_static_03] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textClockTest_static_03] fontColor:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
      done();
    });

    
    /**
     * @tc.number   textClockTest_static_04
     * @tc.name     textClockTest_static_04
     * @tc.desc     textClockTest_static_04
     * @tc.level    Level.LEVEL2
     */
    it('textClockTest_static_04', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[textClockTest_static_04] START');
      try {
        AppStorage.setOrCreate<ResourceColor>("fontColor", '#FF000990')
      } catch (err:Error) {
        console.log("[textClockTest_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('textClock');
      console.info("[textClockTest_static_04] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textClockTest_static_04] fontColor:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF000990');
      done();
    });

    
    /**
     * @tc.number   textClockTest_static_05
     * @tc.name     textClockTest_static_05
     * @tc.desc     textClockTest_static_05
     * @tc.level    Level.LEVEL2
     */
    it('textClockTest_static_05', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[textClockTest_static_05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textClock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textClockTest_static_05] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('format')).assertEqual('hhmmss');
      console.info('textClockTest_static_05 END');
      done();
    });

    
    /**
     * @tc.number   textClockTest_static_06
     * @tc.name     textClockTest_static_06
     * @tc.desc     textClockTest_static_06
     * @tc.level    Level.LEVEL2
     */
    it('textClockTest_static_06', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[textClockTest_static_06] START');
      try {
        AppStorage.setOrCreate<string>("format", '20')
      } catch (err:Error) {
        console.log("[textClockTest_static_06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textClock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textClockTest_static_06] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('format')).assertEqual('20');
      console.info('textClockTest_static_06 END');
      done();
    });
  })
}
