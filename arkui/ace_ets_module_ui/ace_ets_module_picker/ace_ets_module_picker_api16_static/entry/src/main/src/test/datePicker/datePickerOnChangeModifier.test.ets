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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
// import { px2vp } from '@ohos.arkui.component'
// const uiContext = new UIContext();

// function getRectCenterVp(rect: string) {
//   let regexp: RegExp = new RegExp('\\[', 'g');
//   let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
//   let uiContext = AppStorage.get<UIContext>('uiContext');
//   return [
//     uiContext!.px2vp(Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
//     uiContext!.px2vp(Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
//   ]
// }

export default function datePickerOnChangeModifierTest() {
  describe('datePickerOnChangeModifierTest', () => {
    beforeAll(() => {
      console.info("datePickerOnChangeModifierTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("datePickerOnChangeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/datePicker/datePickerOnChangeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get datePickerOnChangeModifierTest state pages:" + JSON.stringify(pages));
        if (!("datePickerOnChangeModifier" == pages.name)) {
          console.info("get datePickerOnChangeModifierTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push datePickerOnChangeModifierTest page error:" + err);
      }
      console.info("datePickerOnChangeModifierTest beforeEach end");
    });


    
    


/**
     * @tc.number   DatePicker_OnChange_Modifier_static_001
     * @tc.name     DatePicker_OnChange_Modifier_static_001
     * @tc.desc     DatePicker_OnChange_Modifier_static_001
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_OnChange_Modifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('DatePicker_OnChange_Modifier_static_001 START');
      let driver = Driver.create();
      let switchButton = await driver.findComponent(ON.id('LunarBtn'));
      await (switchButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      let switchButton1 = await driver.findComponent(ON.id('LunarBtn'));
  await Utils.sleep(1000);
      await (switchButton1?.click() as Promise<void>);
      await Utils.sleep(1000);
      let datePicker = Utils.getComponentRect('DatePicker');
      let top = datePicker.top
      let bottom = datePicker.bottom
      let right = datePicker.right
      let middle = (bottom-top) / 2 + top
      let left =datePicker.left
      await driver.swipe(Math.round((right-left)/2+left) as Int, Math.round(middle) as Int, Math.round((right-left)/2+left) as Int, Math.round(0) as Int);
      await Utils.sleep(5000);
      let strJsonNew:string = inspector.getInspectorByKey('onChangeOff');
      console.info("DatePicker_OnChange_Modifier_static_001 component  is: " + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('DatePicker_OnChange_Modifier_static_001 END');
      done();
    });

    
    


/**
     * @tc.number   DatePicker_OnChange_Modifier_static_002
     * @tc.name     DatePicker_OnChange_Modifier_static_002
     * @tc.desc     DatePicker_OnChange_Modifier_static_002
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_OnChange_Modifier_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('DatePicker_OnChange_Modifier_static_002 START');
      let driver = Driver.create();
      let switchButton = await driver.findComponent(ON.id('LunarBtn'));
  await Utils.sleep(1000);
      await (switchButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      let datePicker = Utils.getComponentRect('DatePicker');
      let top = datePicker.top
      let bottom = datePicker.bottom
      let right = datePicker.right
      let middle = (bottom-top) / 2 + top
      let left =datePicker.left
      await driver.swipe(Math.round((right-left)/2+left) as Int, Math.round(middle) as Int, Math.round((right-left)/2+left) as Int, Math.round(0) as Int);
      await Utils.sleep(5000);
      let strJsonNew:string = inspector.getInspectorByKey('onDateChangeOff');
      console.info("DatePicker_OnChange_Modifier_static_002 component  is: " + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('DatePicker_OnChange_Modifier_static_002 END');
      done();
    });
  })
}

