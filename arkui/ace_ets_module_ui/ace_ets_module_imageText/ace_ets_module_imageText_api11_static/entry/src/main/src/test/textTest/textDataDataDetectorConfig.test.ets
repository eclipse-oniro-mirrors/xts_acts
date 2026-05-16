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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from "../../../ets/MainAbility/common/Common";
import {  Driver, ON } from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textDataDataDetectorConfig() {
  describe('textDataDataDetectorConfig', () => {
    beforeAll(() => {
      console.info("textDataDataDetectorConfig beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textDataDataDetectorConfig beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textDataDataDetectorConfig',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textDataDataDetectorConfig state pages:" + JSON.stringify(pages));
        if (!("textDataDataDetectorConfig" == pages.name)) {
          console.info("get textDataDataDetectorConfig pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textDataDataDetectorConfig page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textDataDataDetectorConfig page error:" + err);
      }
      console.info("textDataDataDetectorConfig beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textDataDataDetectorConfig after each called");
    });

    
    /**
     * @tc.number   textDataDataDetectorConfig_static_0001
     * @tc.name     textDataDataDetectorConfig_static_0001
     * @tc.desc     textDataDataDetectorConfig_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('textDataDataDetectorConfig_static_0001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textDataDataDetectorConfig_static_0001] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.PHONE_NUMBER'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('dataDetectorConfigText');
      let Obj2 = JSON.parseJsonElement(text1);
      expect(Obj2.getElement('$attrs').getString('content')).assertEqual('222');

      console.info('[textDataDataDetectorConfig_static_0001] END');
      done();
    });

    
    /**
     * @tc.number   textDataDataDetectorConfig_static_0002
     * @tc.name     textDataDataDetectorConfig_static_0002
     * @tc.desc     textDataDataDetectorConfig_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('textDataDataDetectorConfig_static_0002', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textDataDataDetectorConfig_static_0002] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.URL'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('dataDetectorConfigText');
      let Obj2 = JSON.parseJsonElement(text1);
      expect(Obj2.getElement('$attrs').getString('content')).assertEqual('222');
      console.info('[textDataDataDetectorConfig_static_0002] END');
      done();
    });


    
    /**
     * @tc.number   textDataDataDetectorConfig_static_0003
     * @tc.name     textDataDataDetectorConfig_static_0003
     * @tc.desc     textDataDataDetectorConfig_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('textDataDataDetectorConfig_static_0003', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textDataDataDetectorConfig_static_0003] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.EMAIL'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('dataDetectorConfigText');
      let Obj2 = JSON.parseJsonElement(text1);
      expect(Obj2.getElement('$attrs').getString('content')).assertEqual('222');

      console.info('[textDataDataDetectorConfig_static_0003] END');
      done();
    });


    
    /**
     * @tc.number   textDataDataDetectorConfig_static_0004
     * @tc.name     textDataDataDetectorConfig_static_0004
     * @tc.desc     textDataDataDetectorConfig_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('textDataDataDetectorConfig_static_0004', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[textDataDataDetectorConfig_static_0004] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.ADDRESS'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('dataDetectorConfigText');
      let Obj2 = JSON.parseJsonElement(text1);
      expect(Obj2.getElement('$attrs').getString('content')).assertEqual('222');
      console.info('[textDataDataDetectorConfig_static_0004] END');
      done();
    });
  })
}
