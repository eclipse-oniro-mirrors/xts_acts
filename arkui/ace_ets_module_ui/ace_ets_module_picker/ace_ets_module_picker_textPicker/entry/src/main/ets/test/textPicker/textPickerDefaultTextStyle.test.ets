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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerDefaultTextStyleTest() {
  describe('TextPickerDefaultTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textPickerDefaultTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerTextStyle state success ' + JSON.stringify(pages));
        if (!('textPickerDefaultTextStyle' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerTextStyle page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerTextStyle page error ' + JSON.stringify(err));
      }
      done()
    });
    /**
     * @tc.name   TextPickerDefaultTextStyleTest_0100
     * @tc.number TextPickerDefaultTextStyleTest_0100
     * @tc.desc   To test the minFontSize < maxFontSize, overflow = TextOverflow.Ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDefaultTextStyleTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerDefaultTextStyleTest_0100 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Normal1'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerDefaultTextStyleTest_0100]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickerDefaultTextStyleTest_0100 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickerDefaultTextStyleTest_0100 obj Normal1 $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('18.00fp');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('28.00fp');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDefaultTextStyleTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextPickerDefaultTextStyleTest_0200
     * @tc.number TextPickerDefaultTextStyleTest_0200
     * @tc.desc   To test the minFontSize = maxFontSize, overflow = TextOverflow.Ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDefaultTextStyleTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerDefaultTextStyleTest_0200 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Normal2'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerDefaultTextStyleTest_0200]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickerDefaultTextStyleTest_0200 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickerDefaultTextStyleTest_0200 obj Normal2 $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('18.00fp');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('18.00fp');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDefaultTextStyleTest_0200] END');
      done();
    });

    /**
     * @tc.name   TextPickerDefaultTextStyleTest_0300
     * @tc.number TextPickerDefaultTextStyleTest_0300
     * @tc.desc   To test the minFontSize > maxFontSize, overflow = TextOverflow.Ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDefaultTextStyleTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerDefaultTextStyleTest_0300 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Normal3'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerDefaultTextStyleTest_0300]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickerDefaultTextStyleTest_0300 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickerDefaultTextStyleTest_0300 obj Normal3 $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('28.00fp');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('18.00fp');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDefaultTextStyleTest_0300] END');
      done();
    });

    /**
     * @tc.name   TextPickerDefaultTextStyleTest_0400
     * @tc.number TextPickerDefaultTextStyleTest_0400
     * @tc.desc   To test the minFontSize,maxFontSize, overflow = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDefaultTextStyleTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerDefaultTextStyleTest_0400 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Undefined'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerDefaultTextStyleTest_0400]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickerDefaultTextStyleTest_0400 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickerDefaultTextStyleTest_0400 obj Undefined $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('0.00px');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('0.00px');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Clip');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDefaultTextStyleTest_0400] END');
      done();
    });

    /**
     * @tc.name   TextPickerDefaultTextStyleTest_0500
     * @tc.number TextPickerDefaultTextStyleTest_0500
     * @tc.desc   To test the minFontSize,maxFontSize, overflow = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDefaultTextStyleTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerDefaultTextStyleTest_0500 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Null'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerDefaultTextStyleTest_0500]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickerDefaultTextStyleTest_0500 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickerDefaultTextStyleTest_0500 obj Null $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('0.00px');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('0.00px');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Clip');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDefaultTextStyleTest_0500] END');
      done();
    });

    /**
     * @tc.name   TextPickerDefaultTextStyleTest_0600
     * @tc.number TextPickerDefaultTextStyleTest_0600
     * @tc.desc   To test the minFontSize = -10,maxFontSize = -20, overflow = TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDefaultTextStyleTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerDefaultTextStyleTest_0600 start');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Negative'));
      await btn.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerDefaultTextStyleTest_0600]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickerDefaultTextStyleTest_0600 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickerDefaultTextStyleTest_0600 obj Negative $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('0.00px');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('0.00px');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Clip');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDefaultTextStyleTest_0600] END');
      done();
    });
  })
}
