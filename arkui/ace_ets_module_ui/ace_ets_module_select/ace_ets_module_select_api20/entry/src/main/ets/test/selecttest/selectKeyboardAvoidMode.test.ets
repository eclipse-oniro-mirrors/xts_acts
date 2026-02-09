/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { BY, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON, } from '@ohos.UiTest';
import { Want } from '@kit.AbilityKit';

export default function selectKeyboardAvoidMode() {
  describe('selectKeyboardAvoidMode', () => {
    beforeEach(async (done: Function) => {
      console.info('selectKeyboardAvoidMode beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/selectKeyboardAvoidMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectKeyboardAvoidMode state pages:' + JSON.stringify(pages));
        if (!('selectKeyboardAvoidMode' == pages.name)) {
          console.info('get selectKeyboardAvoidMode pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push selectKeyboardAvoidMode page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push selectKeyboardAvoidMode page error:' + err);
      }
      console.info('selectKeyboardAvoidMode beforeEach end');
      done();
    });

   /**
    * @tc.name   selectKeyboardAvoidMode_001
    * @tc.number selectKeyboardAvoidMode_001
    * @tc.desc   To test the selectKeyboardAvoidMode undefined
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('selectKeyboardAvoidMode_001', Level.LEVEL0, async (done: Function) => {
     await Utils.sleep(1000);
     console.log('selectKeyboardAvoidMode_001 START')
     let driver: Driver = Driver.create();
     let btn1 = await driver.findComponent(ON.id('select01'));
     let hideBtn = await driver.findComponent(ON.id('hideBtn'));
     await btn1.click();
     await Utils.sleep(5000);
     let str = await driver.findComponent(ON.text('ddd'));
     expect(str == null ).assertTrue();
     await Utils.sleep(1000);
     await btn1.click();
     await Utils.sleep(1000);
     await hideBtn.click();
     console.log('selectKeyboardAvoidMode_001 END')
     done();
   });

   /**
    * @tc.name   selectKeyboardAvoidMode_002
    * @tc.number selectKeyboardAvoidMode_002
    * @tc.desc   To test the selectKeyboardAvoidMode NONE
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('selectKeyboardAvoidMode_002', Level.LEVEL0, async (done: Function) => {
     await Utils.sleep(1000);
     console.log('selectKeyboardAvoidMode_002 START')
     let driver: Driver = Driver.create();
     let btn2 = await driver.findComponent(ON.id('select02'));
     let hideBtn = await driver.findComponent(ON.id('hideBtn'));
     await btn2.click();
     await Utils.sleep(5000);
     let str1 = await driver.findComponent(ON.text('ddd'));
     expect(str1 == null ).assertTrue();
     await Utils.sleep(1000);
     await btn2.click();
     await Utils.sleep(1000);
     await hideBtn.click();
     console.log('selectKeyboardAvoidMode_002 END')
     done();
   });

   /**
    * @tc.name   selectKeyboardAvoidMode_003
    * @tc.number selectKeyboardAvoidMode_003
    * @tc.desc   To test the selectKeyboardAvoidMode TRANSLATE_AND_RESIZE
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('selectKeyboardAvoidMode_003', Level.LEVEL0, async (done: Function) => {
     await Utils.sleep(1000);
     console.log('selectKeyboardAvoidMode_003 START')
     let driver: Driver = Driver.create();
     let btn3 = await driver.findComponent(ON.id('select03'));
     let hideBtn = await driver.findComponent(ON.id('hideBtn'));
     await btn3.click();
     await Utils.sleep(5000);
     let str1 = await driver.findComponent(ON.text('ddd'));
     expect(str1 !== null ).assertTrue();
     await Utils.sleep(1000);
     await btn3.click();
     await Utils.sleep(1000);
     await hideBtn.click();
     console.log('selectKeyboardAvoidMode_003 END')
     done();
   });
})
}