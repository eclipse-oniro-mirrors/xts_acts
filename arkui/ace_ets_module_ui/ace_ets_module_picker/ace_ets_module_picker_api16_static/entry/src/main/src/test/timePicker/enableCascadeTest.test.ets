'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
// import { px2vp } from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import Utils from '../../../ets/MainAbility/common/Utils';

// function getRectCenterVp(rect: string) {
//   let regexp: RegExp = new RegExp('\\[', 'g');
//   let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
//   let uiContext = AppStorage.get<UIContext>('uiContext');
//   return [
//     uiContext!.px2vp(Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
//     uiContext!.px2vp(Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
//   ]
// }

export default function enableCascadeTest() {
  describe('TimePickerApienableCascade', () => {
    beforeAll(() => {
      console.info("TimePickerApienableCascade beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TimePickerApienableCascade beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePicker/enableCascadeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TimePickerApienableCascade state pages:" + JSON.stringify(pages));
        if (!("enableCascadeTest" == pages.name)) {
          console.info("get TimePickerApienableCascade pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push TimePickerApienableCascade page error:" + err);
      }
      console.info("TimePickerApienableCascade beforeEach end");
    }); 

    
    


/**
     * @tc.number   TimePickerApienableCascade_static_001
     * @tc.name     TimePickerApienableCascade_static_001
     * @tc.desc     TimePickerApienableCascade_static_001
     * @tc.level    Level.LEVEL1
     */
it('TimePickerApienableCascade_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('[TimePickerApienableCascade_static_001] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await (clock24Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await (clock12Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-true'));
      await (switchButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('timePicker');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TimePickerApienableCascade_static_001] attrs:' + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(true);
      console.info('[TimePickerApienableCascade_static_001] END');
      done();
    });
    
    


/**
     * @tc.number   TimePickerApienableCascade_static_002
     * @tc.name     TimePickerApienableCascade_static_002
     * @tc.desc     TimePickerApienableCascade_static_002
     * @tc.level    Level.LEVEL1
     */
it('TimePickerApienableCascade_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('[TimePickerApienableCascade_static_002] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await (clock24Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await (clock12Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-false'));
      await (switchButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('timePicker');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TimePickerApienableCascade_static_002] attrs:' + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(false);
      console.info('[TimePickerApienableCascade_static_002] END');
      done();
    });
    
    


/**
     * @tc.number   TimePickerApienableCascade_static_003
     * @tc.name     TimePickerApienableCascade_static_003
     * @tc.desc     TimePickerApienableCascade_static_003
     * @tc.level    Level.LEVEL1
     */
it('TimePickerApienableCascade_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('[TimePickerApienableCascade_static_003] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await (clock24Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await (clock12Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-null'));
      await (switchButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('timePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TimePickerApienableCascade_static_003] attrs:' + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(false);
      console.info('[TimePickerApienableCascade_static_003] END');
      done();
    });

    
    


/**
     * @tc.number   TimePickerApienableCascade_static_004
     * @tc.name     TimePickerApienableCascade_static_004
     * @tc.desc     TimePickerApienableCascade_static_004
     * @tc.level    Level.LEVEL1
     */
it('TimePickerApienableCascade_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('[TimePickerApienableCascade_static_004] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await (clock24Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await (clock12Button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-undefined'));
      await (switchButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('timePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TimePickerApienableCascade_static_004] attrs:' + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(false);
      console.info('[TimePickerApienableCascade_static_004] END');
      done();
    });
  })
}
