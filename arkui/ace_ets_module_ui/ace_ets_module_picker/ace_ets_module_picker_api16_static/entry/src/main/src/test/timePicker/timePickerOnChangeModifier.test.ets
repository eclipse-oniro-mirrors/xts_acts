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
import inspector from '@ohos.arkui.inspector'
import Utils from '../../../ets/MainAbility/common/Utils';
// import { px2vp } from '@ohos.arkui.component'

// function getRectCenterVp(rect: string) {
//   let regexp: RegExp = new RegExp('\\[', 'g');
//   let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
//   let uiContext = AppStorage.get<UIContext>('uiContext');
//   return [
//     uiContext!.px2vp(Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
//     uiContext!.px2vp(Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
//   ]
// }

export default function timePickerOnChangeModifierTest() {
  describe('timePickerOnChangeModifierTest', () => {
    beforeAll(() => {
      console.info("timePickerOnChangeModifierTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("timePickerOnChangeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePicker/timePickerOnChangeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get timePickerOnChangeModifierTest state pages:" + JSON.stringify(pages));
        if (!("timePickerOnChangeModifier" == pages.name)) {
          console.info("get timePickerOnChangeModifierTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push timePickerOnChangeModifierTest page error:" + err);
      }
      console.info("timePickerOnChangeModifierTest beforeEach end");
    }); 

  
    
    


/**
     * @tc.number   TimePicker_OnChange_Modifier_static_001
     * @tc.name     TimePicker_OnChange_Modifier_static_001
     * @tc.desc     TimePicker_OnChange_Modifier_static_001
     * @tc.level    Level.LEVEL1
     */
it('TimePicker_OnChange_Modifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('TimePicker_OnChange_Modifier_static_001 START');
        let driver = Driver.create();
        let clock12Button = await driver.findComponent(ON.id('12hour'));
        await (clock12Button?.click() as Promise<void>);
        await Utils.sleep(1000);
        let timePicker = Utils.getComponentRect('timePicker');
        let top = timePicker.top
        let bottom = timePicker.bottom
        let right = timePicker.right
        let middle = (bottom-top) / 2 + top
        let left = timePicker.left
        await driver.swipe(Math.round((right-left)/2+left) as Int, Math.round(middle) as Int, Math.round((right-left)/2+left) as Int, Math.round(0) as Int);
        await Utils.sleep(5000);
        let strJsonNew:string = inspector.getInspectorByKey('onChangeOff');
        console.info("TimePicker_OnChange_Modifier_static_001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('false');
        console.info('TimePicker_OnChange_Modifier_static_001 END');
        done();
      });
  
      
      


/**
     * @tc.number   TimePicker_OnChange_Modifier_static_002
     * @tc.name     TimePicker_OnChange_Modifier_static_002
     * @tc.desc     TimePicker_OnChange_Modifier_static_002
     * @tc.level    Level.LEVEL1
     */
it('TimePicker_OnChange_Modifier_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('TimePicker_OnChange_Modifier_static_002 START');
        let driver = Driver.create();
        let clock24Button = await driver.findComponent(ON.id('24hour'));
        await (clock24Button?.click() as Promise<void>);
        await Utils.sleep(1000);
        let timePicker = Utils.getComponentRect('timePicker');
        let top = timePicker.top
        let bottom = timePicker.bottom
        let right = timePicker.right
        let middle = (bottom-top) / 2 + top
        let left =timePicker.left
        await driver.swipe(Math.round((right-left)/2+left) as Int, Math.round(middle) as Int, Math.round((right-left)/2+left) as Int,
          Math.round(0) as Int);
        await Utils.sleep(5000);
        let strJsonNew:string = inspector.getInspectorByKey('onChangeOff');
        console.info("TimePicker_OnChange_Modifier_static_002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
        console.info('TimePicker_OnChange_Modifier_static_002 END');
        done();
      });
  })
}

