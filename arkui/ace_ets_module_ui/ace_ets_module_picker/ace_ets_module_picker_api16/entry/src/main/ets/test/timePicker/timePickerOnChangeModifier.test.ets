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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

function getRectCenterVp(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
  return [
    px2vp(Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    px2vp(Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}

export default function timePickerOnChangeModifierTest() {
  describe('timePickerOnChangeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerOnChangeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerOnChangeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerOnChangeModifier state pages:' + JSON.stringify(pages));
        if (!('timePickerOnChangeModifier' == pages.name)) {
          console.info('get timePickerOnChangeModifier pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push timePickerOnChangeModifier page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerOnChangeModifier page error:' + err);
      }
      console.info('timePickerOnChangeModifier beforeEach end');
      done();
    });
  
    /* *
    * @tc.number: TimePicker_OnChange_Modifier_001
    * @tc.name  : TimePicker_OnChange_Modifier_001
    * @tc.desc  : To test the OnChange
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('TimePicker_OnChange_Modifier_001', 0, async (done: Function) => {
        console.info('TimePicker_OnChange_Modifier_001 START');
        let driver = Driver.create();
        let clock12Button = await driver.findComponent(ON.id('12hour'));
        await clock12Button.click();
        await Utils.sleep(1000);
        let timePicker = Utils.getComponentRect('timePicker');
        let top = timePicker.top
        let bottom = timePicker.bottom
        let right = timePicker.right
        let middle = (bottom-top) / 2 + top
        let left =timePicker.left
        await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
        await Utils.sleep(5000);
        let strJsonNew:string = getInspectorByKey('onChangeOff');
        console.info("TimePicker_OnChange_Modifier_001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('true');
        console.info('TimePicker_OnChange_Modifier_001 END');
        done();
      });
  
      /* *
      * @tc.number: TimePicker_OnChange_Modifier_002
      * @tc.name  : TimePicker_OnChange_Modifier_002
      * @tc.desc  : To test the OnChange
      * @tc.level : Level 3
      * @tc.type
      * @tc.size
      */
      it('TimePicker_OnChange_Modifier_002', 0, async (done: Function) => {
        console.info('TimePicker_OnChange_Modifier_002 START');
        let driver = Driver.create();
        let clock24Button = await driver.findComponent(ON.id('24hour'));
        await clock24Button.click();
        await Utils.sleep(1000);
        let timePicker = Utils.getComponentRect('timePicker');
        let top = timePicker.top
        let bottom = timePicker.bottom
        let right = timePicker.right
        let middle = (bottom-top) / 2 + top
        let left =timePicker.left
        await driver.swipe(Math.round((right-left)/2+left), Math.round(middle), Math.round((right-left)/2+left),
          Math.round(0));
        await Utils.sleep(5000);
        let strJsonNew:string = getInspectorByKey('onChangeOff');
        console.info("TimePicker_OnChange_Modifier_002 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('true');
        console.info('TimePicker_OnChange_Modifier_002 END');
        done();
      });
  })
}

