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

export default function textPickerOnChangeModifierTest() {
  describe('textPickerOnChangeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('textPickerOnChangeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textPickerOnChangeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerOnChangeModifier state pages:' + JSON.stringify(pages));
        if (!('textPickerOnChangeModifier' == pages.name)) {
          console.info('get textPickerOnChangeModifier pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push textPickerOnChangeModifier page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerOnChangeModifier page error:' + err);
      }
      console.info('textPickerOnChangeModifier beforeEach end');
      done();
    });
  
    /* *
    * @tc.number: TextPicker_OnChange_Modifier_001
    * @tc.name  : TextPicker_OnChange_Modifier_001
    * @tc.desc  : To test the OnChange
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('TextPicker_OnChange_Modifier_001', 0, async (done: Function) => {
        console.info('TextPicker_OnChange_Modifier_001 START');
        let driver = Driver.create();
        let switchButton = await driver.findComponent(ON.id('LunarBtn'));
        await switchButton.click();
        await Utils.sleep(1000);
        let datePicker = Utils.getComponentRect('TextPicker');
        let top = datePicker.top
        let bottom = datePicker.bottom
        let right = datePicker.right
        let middle = (bottom-top) / 2 + top
        let left =datePicker.left
        await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
        await Utils.sleep(5000);
        let strJsonNew:string = getInspectorByKey('onChangeOff');
        console.info("TextPicker_OnChange_Modifier_001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('true');
        console.info('TextPicker_OnChange_Modifier_001 END');
        done();
      });
  
      /* *
      * @tc.number: TextPicker_OnChange_Modifier_002
      * @tc.name  : TextPicker_OnChange_Modifier_002
      * @tc.desc  : To test the OnChange
      * @tc.level : Level 3
      * @tc.type
      * @tc.size
      */
      it('TextPicker_OnChange_Modifier_002', 0, async (done: Function) => {
        console.info('TextPicker_OnChange_Modifier_002 START');
        let driver = Driver.create();
        let switchButton = await driver.findComponent(ON.id('LunarBtn'));
        await switchButton.click();
        await Utils.sleep(1000);
        let datePicker = Utils.getComponentRect('TextPicker');
        let top = datePicker.top
        let bottom = datePicker.bottom
        let right = datePicker.right
        let middle = (bottom-top) / 2 + top
        let left =datePicker.left
        await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
        await Utils.sleep(5000);
        let strJsonNew:string = getInspectorByKey('onScrollStopOff');
        console.info("TextPicker_OnChange_Modifier_002 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('true');
        console.info('TextPicker_OnChange_Modifier_002 END');
        done();
      });
  })
}

