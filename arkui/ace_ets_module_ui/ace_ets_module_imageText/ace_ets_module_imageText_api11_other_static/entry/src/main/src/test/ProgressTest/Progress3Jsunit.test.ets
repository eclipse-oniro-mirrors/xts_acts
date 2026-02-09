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
  PointerMatrix
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
import events_emitter from '@ohos.events.emitter';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function progressJsunit() {
  describe('progressTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/progress3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progress state pages:" + JSON.stringify(pages));
        if (!("progress3" == pages.name)) {
          console.info("get progress pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push progress page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push progress page error " + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("progress after each called");
    });

    afterAll(async () => {
      AppStorage.setOrCreate<number>('value', 20);
    })

    
/**
     * @tc.number   testProgress_static_100
     * @tc.name     testProgress_static_100
     * @tc.desc     testProgress_static_100
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_100 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      try {
        AppStorage.setOrCreate<number>('value', 100);
      } catch (err) {
        console.log("testProgress_static_100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('value')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("100.000000");
      console.info('testProgress_static_100 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_200
     * @tc.name     testProgress_static_200
     * @tc.desc     testProgress_static_200
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testProgress_static_200] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("200.00vp");
      console.info('testProgress_static_200 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_300
     * @tc.name     testProgress_static_300
     * @tc.desc     testProgress_static_300
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_300 START');
      let strJson1 = inspector.getInspectorByKey('EPValue');
      console.info("testProgress_static_300 component objEP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value', 100);
      } catch (err) {
        console.log("testProgress_static_300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');

      console.info("testProgress_static_300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("100.000000");
      console.info('testProgress_static_300 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_400
     * @tc.name     testProgress_static_400
     * @tc.desc     testProgress_static_400
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testProgress_static_400] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("200.00vp");
      console.info('testProgress_static_400 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_500
     * @tc.name     testProgress_static_500
     * @tc.desc     testProgress_static_500
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_500 START');
      let strJson1 = inspector.getInspectorByKey('CPValue');
      console.info("testProgress_static_500 component objCP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value', 100);
      } catch (err) {
        console.log("testProgress_static_500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');

      console.info("testProgress_static_500 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("100.000000");
      console.info('testProgress_static_500 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_600
     * @tc.name     testProgress_static_600
     * @tc.desc     testProgress_static_600
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testProgress_static_600] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('CPValue');
      console.info("testProgress_static_600 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("100.00vp");
      console.info('testProgress_static_600 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_700
     * @tc.name     testProgress_static_700
     * @tc.desc     testProgress_static_700
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_700 START');
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_700 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value', 0);
      } catch (err) {
        console.log("testProgress_static_700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');

      console.info("testProgress_static_700 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("0.000000");
      console.info('testProgress_static_700 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_800
     * @tc.name     testProgress_static_800
     * @tc.desc     testProgress_static_800
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_800 START');
      let strJson1 = inspector.getInspectorByKey('EPValue');
      console.info("testProgress_static_800 component objEP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value', 0);
      } catch (err) {
        console.log("testProgress_static_800 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');

      console.info("testProgress_static_800 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("0.000000");
      console.info('testProgress_static_800 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_900
     * @tc.name     testProgress_static_900
     * @tc.desc     testProgress_static_900
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_900 START');
      let strJson1 = inspector.getInspectorByKey('CPValue');
      console.info("testProgress_static_900 component objCP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value', 0);
      } catch (err) {
        console.log("testProgress_static_900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');

      console.info("testProgress_static_900 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("0.000000");
      console.info('testProgress_static_900 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_1000
     * @tc.name     testProgress_static_1000
     * @tc.desc     testProgress_static_1000
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_1000 START');
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_1000 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value', -5);
      } catch (err) {
        console.log("testProgress_static_1000 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');

      console.info("testProgress_static_1000 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      // 非法入参默认初始值
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("0.000000");
      console.info('testProgress_static_1000 END');
      done();
    });

    
/**
     * @tc.number   testProgress_static_1100
     * @tc.name     testProgress_static_1100
     * @tc.desc     testProgress_static_1100
     * @tc.level    Level.LEVEL1
     */
it('testProgress_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_static_1100 START');
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_static_1100 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('value'));
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('value',121212121);
      } catch (err) {
        console.log("testProgress_static_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');

      console.info("testProgress_static_1100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      // 非法入参默认初始值
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("100.000000");
      console.info('testProgress_static_1100 END');
      done();
    });
  })
}