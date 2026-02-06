/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';
import { display } from '@kit.ArkUI'

export default function textPickerDefaultPickerItemHeightJsunit() {
  describe('textPickerDefaultPickerItemHeightTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextPicker/textPicker',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textPicker state success " + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textPicker state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textPicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPicker page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPickerDefaultPickerItemHeight after each called");
    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testtextPickerDefaultPickerItemHeight0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0001', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      console.info("[testtextPickerDefaultPickerItemHeight0001] width value :" + JSON.parse(strJson).$attrs.width);
      let number: string = JSON.parse(strJson).$attrs.width.slice(0,-2);
      let numberValue = Number((parseFloat(number) - 112.00).toFixed(2));
      console.info("[testtextPickerDefaultPickerItemHeight0001] width value numberValue:" + numberValue);
      expect(Math.abs(numberValue) <= 0.01).assertTrue();
    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testtextPickerDefaultPickerItemHeight0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0002', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0002 START');
      await CommonFunc.sleep(2000);
      let rotation: number = display.getDefaultDisplaySync().orientation
      console.info("[testtextPickerDefaultPickerItemHeight0002] rotation:" + rotation);

      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0002] component height strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testtextPickerDefaultPickerItemHeight0002] defaultPickerItemHeight value :" + obj.$attrs.defaultPickerItemHeight);

      let strJson1 = getInspectorByKey('landscape');
      let obj1: ESObject = JSON.parse(strJson1);
      let textCount:number = parseInt(obj1.$attrs.content);
      console.info("[testtextPickerDefaultPickerItemHeight0002] text value :" + textCount)
      console.info("[testtextPickerDefaultPickerItemHeight0002] vp2px(height) value :" + vp2px(parseFloat(JSON.parse(strJson).$attrs.height)));

      expect(obj.$type).assertEqual('TextPicker');
      console.info("[testtextPickerDefaultPickerItemHeight0002] height value :" + JSON.parse(strJson).$attrs.height);
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
     * @tc.name   testtextPickerDefaultPickerItemHeight0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testtextPickerDefaultPickerItemHeight0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0003', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0003] fontSize value :" + JSON.parse(strJson)
        .$attrs
        .fontSize);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testtextPickerDefaultPickerItemHeight0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0004', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0004 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextPickerDefaultPickerItemHeight0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testtextPickerDefaultPickerItemHeight0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0005', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0005 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center");
      console.info("[testtextPickerDefaultPickerItemHeight0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testtextPickerDefaultPickerItemHeight0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0006', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0006 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0006] fontColor value :" + JSON.parse(strJson)
        .$attrs
        .fontColor);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   testtextPickerDefaultPickerItemHeight0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0007', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0007 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0007] lineHeight value :" + JSON.parse(strJson)
        .$attrs
        .lineHeight);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0009
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   testtextPickerDefaultPickerItemHeight0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0009', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight009 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("0.00vp");
      console.info("[testtextPickerDefaultPickerItemHeight0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testtextPickerDefaultPickerItemHeight0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0010', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0010 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0010] textAlign value :" + JSON.parse(strJson)
        .$attrs
        .textAlign);

    });

    /**
     * @tc.name   testtextPickerDefaultPickerItemHeight0011
     * @tc.number SUB_ACE_BASIC_ETS_API_0011
     * @tc.desc   testtextPickerDefaultPickerItemHeight0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0011', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0011 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0011] component defaultPickerItemHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.defaultPickerItemHeight).assertEqual("80.00px");
      console.info("[testtextPickerDefaultPickerItemHeight0011] defaultPickerItemHeight value :" + JSON.parse(strJson)
        .$attrs
        .defaultPickerItemHeight);

    });
  })
}
