/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function textPickerDialogOnScrollStopTest(){
  describe('textPickerDialogOnScrollStopTest',  () =>{
    beforeEach(async (done:Function) =>{
      console.info('textPickerDialogOnScrollStopTest beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogOnScrollStop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerDialogOnScrollStopTest state pages: ' + JSON.stringify(pages));
        if (!('textPickerDialogOnScrollStop' == pages.name)) {
          console.info('get textPickerDialogOnScrollStopTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push textPickerDialogOnScrollStopTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerDialogOnScrollStopTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   textPickerDialogOnScrollStopTest_0200
     * @tc.number textPickerDialogOnScrollStopTest_0200
     * @tc.desc   To test the onScollStop interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textPickerDialogOnScrollStopTest_0200', Level.LEVEL3, async (done:Function) =>{
      console.info('textPickerDialogOnScrollStopTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('myTextPicker1'));
      await btn1.click()
      let btn2 = await driver.findComponent(ON.text('确定'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text1');
      console.info('[textPickerDialogOnScrollStopTest_0200] textPickerDialogOnScrollStopTest JSON.parse(strJson) is: ' + JSON.stringify(strJson));
      console.info('[textPickerDialogOnScrollStopTest_0200] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[textPickerDialogOnScrollStopTest_0200] title: ' + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('stop');
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogOnScrollStopTest_0200] END');
      done();
    });
  })
}

