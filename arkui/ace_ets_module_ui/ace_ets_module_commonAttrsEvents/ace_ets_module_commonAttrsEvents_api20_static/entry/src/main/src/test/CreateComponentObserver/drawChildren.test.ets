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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, beforeAll, afterEach, TestType, Size } from '../../../../hypium/index';
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BorderRadiuses } from '@ohos.arkui.component'

const SLEEP_TIME_1000 = 1000;
const SLEEP_TIME_2500 = 2500;

export default function DrawChildrenTest() {
  describe('DrawChildrenTest', () => {

    beforeAll(() => {
      console.info("DrawChildrenTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('DrawChildrenTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CreateComponentObserver/drawChildren',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DrawChildrenTest state pages:' + JSON.stringify(pages));
        if (!('drawChildren' === pages.name)) {
          console.info('get DrawChildrenTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2500);
        }
      } catch (err) {
        console.error('push DrawChildrenTest page error:' + err);
      }
      console.info('DrawChildrenTest beforeEach end');
    });

    
    
    /**
     * @tc.number   DrawChildrenTest_static_001
     * @tc.name     DrawChildrenTest_static_001
     * @tc.desc     DrawChildrenTest_static_001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DrawChildrenTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawChildrenTest_static_001 START');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('Button1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('DrawChildrenTest_static_001 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('text1尺寸ok');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('Button1'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_1000);
      strJson = inspector.getInspectorByKey('Button1');
      obj = JSON.parseJsonElement(strJson);
      console.info('DrawChildrenTest_static_001 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('text1尺寸okok');
      console.info('[DrawChildrenTest_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   DrawChildrenTest_static_002
     * @tc.name     DrawChildrenTest_static_002
     * @tc.desc     DrawChildrenTest_static_002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DrawChildrenTest_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawChildrenTest_static_002 START');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('Button2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('DrawChildrenTest_static_002 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('text2旋转ok');
      await Utils.sleep(SLEEP_TIME_1000);
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('Button2'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_1000);
      strJson = inspector.getInspectorByKey('Button2');
      obj = JSON.parseJsonElement(strJson);
      console.info('DrawChildrenTest_static_002 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('text2旋转okok');
      console.info('[DrawChildrenTest_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   DrawChildrenTest_static_003
     * @tc.name     DrawChildrenTest_static_003
     * @tc.desc     DrawChildrenTest_static_003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DrawChildrenTest_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawChildrenTest_static_003 START');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('Button3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('DrawChildrenTest_static_003 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('text1offokok');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('Button3'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_1000);
      strJson = inspector.getInspectorByKey('Button3');
      obj = JSON.parseJsonElement(strJson);
      console.info('DrawChildrenTest_static_003 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('text1offokok');
      console.info('[DrawChildrenTest_static_003] END');
      done();
    });
  })
}
