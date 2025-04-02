/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerTextStyleAnimationTest() {
  describe('TextPickerTextStyleAnimationTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/TextStyleAnimation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextStyleAnimation state success ' + JSON.stringify(pages));
        if (!('TextStyleAnimation' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextStyleAnimation page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextStyleAnimation page error ' + JSON.stringify(err));
      }
      done()
    });

    /* *
    * @tc.number: TextStyleAnimationTest_0100
    * @tc.name  : TextStyleAnimationTest_0100
    * @tc.desc  : To test the disableTextStyleAnimation is true
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('TextStyleAnimationTest_0100', 0, async (done: Function) => {
      console.info('TextStyleAnimationTest_0100 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_TRUE'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_0100]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextStyleAnimationTest_0100 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextStyleAnimationTest_0100 obj TRUE $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.$attrs.disableTextStyleAnimation));
      expect(obj.$attrs.disableTextStyleAnimation).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_0100] END');
      done();
    });

    /* *
    * @tc.number: TextStyleAnimationTest_0200
    * @tc.name  : TextStyleAnimationTest_0200
    * @tc.desc  : To test the disableTextStyleAnimation is false
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('TextStyleAnimationTest_0200', 0, async (done: Function) => {
      console.info('TextStyleAnimationTest_0200 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_FALSE'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_0200]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextStyleAnimationTest_0200 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextStyleAnimationTest_0200 obj FALSE $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.$attrs.disableTextStyleAnimation));
      expect(obj.$attrs.disableTextStyleAnimation).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_0200] END');
      done();
    });

    /* *
    * @tc.number: TextStyleAnimationTest_0300
    * @tc.name  : TextStyleAnimationTest_0300
    * @tc.desc  : To test the disableTextStyleAnimation is undefined
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('TextStyleAnimationTest_0300', 0, async (done: Function) => {
      console.info('TextStyleAnimationTest_0300 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_UNDEFINED'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_0300]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextStyleAnimationTest_0300 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextStyleAnimationTest_0300 obj UNDEFINED $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.$attrs.disableTextStyleAnimation));
      expect(obj.$attrs.disableTextStyleAnimation).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_0300] END');
      done();
    });

    /* *
    * @tc.number: TextStyleAnimationTest_0400
    * @tc.name  : TextStyleAnimationTest_0400
    * @tc.desc  : To test the disableTextStyleAnimation is null
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('TextStyleAnimationTest_0400', 0, async (done: Function) => {
      console.info('TextStyleAnimationTest_0400 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_NULL'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_0400]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextStyleAnimationTest_0400 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextStyleAnimationTest_0400 obj NULL $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.$attrs.disableTextStyleAnimation));
      expect(obj.$attrs.disableTextStyleAnimation).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_0400] END');
      done();
    });
  })
}
