'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../../../ets/MainAbility/common/Utils';
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

export default function ProgressPrivacySensitiveTest() {
  describe('ProgressPrivacySensitiveTest', () => {
    beforeAll(() => {
      console.info("ProgressPrivacySensitiveTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress/ProgressPrivacySensitive',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ProgressPrivacySensitiveTest state pages:' + JSON.stringify(pages));
        if (!('GaugePrivacySensitive' == pages.name)) {
          console.info('get ProgressPrivacySensitiveTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push ProgressPrivacySensitiveTest page error:' + err);
      }
      console.info('ProgressPrivacySensitiveTest beforeEach end');
    });
    afterEach(() => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:'MainAbility/pages/index/index'});
      await Utils.sleep(2500);
    })
    /**
     * @tc.number   ProgressPrivacySensitiveTest_static_001
     * @tc.name     ProgressPrivacySensitiveTest_static_001
     * @tc.desc     ProgressPrivacySensitiveTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ProgressPrivacySensitiveTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_001 START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_001 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('true');
      console.info('[ProgressPrivacySensitiveTest_001] END');
      done();
    });
    
    /**
     * @tc.number   ProgressPrivacySensitiveTest_static_002
     * @tc.name     ProgressPrivacySensitiveTest_static_002
     * @tc.desc     ProgressPrivacySensitiveTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('ProgressPrivacySensitiveTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_002 START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_002 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_002] END');
      done();
    });

    /**
     * @tc.number   ProgressPrivacySensitiveTest_static_003
     * @tc.name     ProgressPrivacySensitiveTest_static_003
     * @tc.desc     ProgressPrivacySensitiveTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('ProgressPrivacySensitiveTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_003 START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_003 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_003] END');
      done();
    });

    /**
     * @tc.number   ProgressPrivacySensitiveTest_static_004
     * @tc.name     ProgressPrivacySensitiveTest_static_004
     * @tc.desc     ProgressPrivacySensitiveTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('ProgressPrivacySensitiveTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_004 START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('nullFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_004 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_004] END');
      done();
    });
  })
}
