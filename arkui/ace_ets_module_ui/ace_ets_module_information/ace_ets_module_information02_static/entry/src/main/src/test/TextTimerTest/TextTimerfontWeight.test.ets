'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';


export default function textTimerFontWeightTest() {
  describe('textTimerFontWeightTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("TextTimerFontWeightTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextTimerFontWeightTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextTimerFontWeightTest state pages:" + JSON.stringify(pages));
        if (!("TextTimerfontWeight" == pages.name)) {
          console.info("get  TextTimerFontWeightTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/TextTimer/TextTimerfontWeight',
          })
        }
      } catch (err) {
        console.error("push TextTimerFontWeightTest page error:" + err);
      }
      console.info("TextTimerFontWeightTest foreEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextTimerFontWeightTest after each called");
    });
    /**
     * @tc.name   FontWeightTest_0010
     * @tc.number FontWeightTest_0010
     * @tc.desc   test fontWeight: default
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FontWeightTest_0010] START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_resource');
      let obj = JSON.parseJsonElement(strJson);
      console.info("FontWeight_resource" + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      let strJson1 = inspector.getInspectorByKey('FontWeight_resourcea');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("FontWeight_resourcea" + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[FontWeightTest_0010] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0020
     * @tc.number FontWeightTest_0020
     * @tc.desc   test fontWeight: undefined
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FontWeightTest_0020] START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0020] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      let strJson1 = inspector.getInspectorByKey('FontWeight_undefineda');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0020] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[FontWeightTest_0020] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0030
     * @tc.number FontWeightTest_0030
     * @tc.desc   test fontWeight: 500
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FontWeightTest_0030] START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_500');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0030] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('500');
      let strJson1 = inspector.getInspectorByKey('FontWeight_500a');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0030] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('500');
      console.info('[FontWeightTest_0030] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0040
     * @tc.number FontWeightTest_0040
     * @tc.desc   test fontWeight: Lighter
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FontWeightTest_0040] START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_Lighter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0040] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      let strJson1 = inspector.getInspectorByKey('FontWeight_resourcea');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0040] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[FontWeightTest_0040] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0050
     * @tc.number FontWeightTest_0050
     * @tc.desc   test fontWeight: Normal
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontWeightTest_0050 START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_Normal');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0050] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      let strJson1 = inspector.getInspectorByKey('FontWeight_resourcea');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0050] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[FontWeightTest_0050] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0060
     * @tc.number FontWeightTest_0060
     * @tc.desc   test fontWeight: Regular
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontWeightTest_0060 START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_Regular');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0060] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Regular');
      let strJson1 = inspector.getInspectorByKey('FontWeight_resourcea');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0060] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[FontWeightTest_0060] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0070
     * @tc.number FontWeightTest_0070
     * @tc.desc   test fontWeight: Medium
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontWeightTest_0070 START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_Medium');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0070] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      let strJson1 = inspector.getInspectorByKey('FontWeight_resourcea');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0070] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[FontWeightTest_0070] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0080
     * @tc.number FontWeightTest_0080
     * @tc.desc   test fontWeight: Bold
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontWeightTest_0080 START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_Bold');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0080] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      let strJson1 = inspector.getInspectorByKey('FontWeight_Bolda');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0080] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      console.info('[FontWeightTest_0080] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0090
     * @tc.number FontWeightTest_0090
     * @tc.desc   test fontWeight: Bolder
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontWeightTest_0090 START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_Bolder');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0090] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      let strJson1 = inspector.getInspectorByKey('FontWeight_Boldera');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0090] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      console.info('[FontWeightTest_0090] END');
      done();
    });
    /**
     * @tc.name   FontWeightTest_0100
     * @tc.number FontWeightTest_0100
     * @tc.desc   test fontWeight: '30'
     * @tc.level  Level.LEVEL0
     */
    it('FontWeightTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontWeightTest_0100 START');
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('FontWeight_900');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[FontWeightTest_0100] fontWeight1: " + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('900');
      let strJson1 = inspector.getInspectorByKey('FontWeight_900a');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[FontWeightTest_0100] fontWeight2: " + obj1.getElement('$attrs').getString('fontWeight'));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual('900');
      console.info('[FontWeightTest_0100] END');
      done();
    });
  })
}
