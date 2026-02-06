/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import { display } from '@kit.ArkUI'

export default function textPickerDefaultPickerItemHeightTest() {
  describe('textPickerDefaultPickerItemHeightTest', () => {
    beforeAll(async () => {
      console.info("textPickerDefaultPickerItemHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textPickerDefaultPickerItemHeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textPickerDefaultPickerItemHeightTest state success " + JSON.stringify(pages));
        if (!("textPickerDefaultPickerItemHeight" == pages.name)) {
          console.info("get textPickerDefaultPickerItemHeightTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textPickerDefaultPickerItemHeightTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPickerDefaultPickerItemHeightTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textPickerDefaultPickerItemHeight after each called");
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0001
     * @tc.number testTextPickerDefaultPickerItemHeight0001
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0001', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      console.info("[testTextPickerDefaultPickerItemHeight0001] width value :" + JSON.parse(strJson).$attrs.width);
      let number: string = JSON.parse(strJson).$attrs.width.slice(0,-2);
      let numberValue = Number((parseFloat(number) - 112.00).toFixed(2));
      console.info("[testTextPickerDefaultPickerItemHeight0001] width value numberValue:" + numberValue);
      expect(Math.abs(numberValue) <= 0.01).assertTrue();
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0002
     * @tc.number testTextPickerDefaultPickerItemHeight0002
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0002', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0002 START');
      await Utils.sleep(2000);
      let rotation: number = display.getDefaultDisplaySync().orientation
      console.info("[testTextPickerDefaultPickerItemHeight0002] rotation:" + rotation);

      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0002] component height strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testTextPickerDefaultPickerItemHeight0002] defaultPickerItemHeight value :" + obj.$attrs.defaultPickerItemHeight);

      let strJson1 = getInspectorByKey('landscape');
      let obj1: ESObject = JSON.parse(strJson1);
      let textCount:number = parseInt(obj1.$attrs.content);
      console.info("[testTextPickerDefaultPickerItemHeight0002] text value :" + textCount)
      console.info("[testTextPickerDefaultPickerItemHeight0002] vp2px(height) value :" + vp2px(parseFloat(JSON.parse(strJson).$attrs.height)));

      expect(obj.$type).assertEqual('TextPicker');
      console.info("[testTextPickerDefaultPickerItemHeight0002] height value :" + JSON.parse(strJson).$attrs.height);
      if (rotation == 0 || rotation == 2) {
        // 0 竖屏        
        let numberValue = vp2px(parseFloat(JSON.parse(strJson).$attrs.height)) - parseFloat(JSON.parse(strJson).$attrs.defaultPickerItemHeight) * 5
        expect(Math.abs(numberValue) <= 1).assertTrue();
      } else {
        // 1 横屏
        let numberValue = vp2px(parseFloat(JSON.parse(strJson).$attrs.height)) - parseFloat(JSON.parse(strJson).$attrs.defaultPickerItemHeight) * textCount
        expect(Math.abs(numberValue) <= 1).assertTrue();
      }
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0003
     * @tc.number testTextPickerDefaultPickerItemHeight0003
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0003', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(undefined);
      console.info("[testTextPickerDefaultPickerItemHeight0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0004
     * @tc.number testTextPickerDefaultPickerItemHeight0004
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0004', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testTextPickerDefaultPickerItemHeight0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0005
     * @tc.number testTextPickerDefaultPickerItemHeight0005
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0005', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center");
      console.info("[testTextPickerDefaultPickerItemHeight0005] align value :" + JSON.parse(strJson).$attrs.align);
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0006
     * @tc.number testTextPickerDefaultPickerItemHeight0006
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0006', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual(undefined);
      console.info("[testTextPickerDefaultPickerItemHeight0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0007
     * @tc.number testTextPickerDefaultPickerItemHeight0007
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0007', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual(undefined);
      console.info("[testTextPickerDefaultPickerItemHeight0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0009
     * @tc.number testTextPickerDefaultPickerItemHeight0009
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0009', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("0.00vp");
      console.info("[testTextPickerDefaultPickerItemHeight0009] padding value :" + JSON.parse(strJson).$attrs.padding);
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0010
     * @tc.number testTextPickerDefaultPickerItemHeight0010
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0010', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual(undefined);
      console.info("[testTextPickerDefaultPickerItemHeight0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);
    });

    /**
     * @tc.name   testTextPickerDefaultPickerItemHeight0011
     * @tc.number testTextPickerDefaultPickerItemHeight0011
     * @tc.desc   textPickerDefaultPickerItemHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDefaultPickerItemHeight0011', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testTextPickerDefaultPickerItemHeight0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testTextPickerDefaultPickerItemHeight0011] component defaultPickerItemHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.defaultPickerItemHeight).assertEqual("80.00px");
      console.info("[testTextPickerDefaultPickerItemHeight0011] defaultPickerItemHeight value :" + JSON.parse(strJson).$attrs.defaultPickerItemHeight);
    });
  })
}
