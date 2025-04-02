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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils'

export default function textPickerDefaultPickerItemHeightJsunit() {
  describe('textPickerDefaultPickerItemHeightTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/textPicker',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textPicker state success " + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textPicker state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textPicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPicker page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textPickerDefaultPickerItemHeight after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtextPickerDefaultPickerItemHeight0001
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0001
     */
    it('testtextPickerDefaultPickerItemHeight0001', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("112.00vp");
      console.info("[testtextPickerDefaultPickerItemHeight0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtextPickerDefaultPickerItemHeight0002
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0002
     */
    it('testtextPickerDefaultPickerItemHeight0002', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      let numberValue = vp2px(parseFloat(JSON.parse(strJson).$attrs.height)) - parseFloat(JSON.parse(strJson).$attrs.defaultPickerItemHeight) * 5
      expect(Math.abs(numberValue) <= 1).assertTrue();
      console.info("[testtextPickerDefaultPickerItemHeight0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtextPickerDefaultPickerItemHeight0003
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0003
     */
    it('testtextPickerDefaultPickerItemHeight0003', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0003] fontSize value :" + JSON.parse(strJson)
        .$attrs
        .fontSize);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtextPickerDefaultPickerItemHeight0004
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0004
     */
    it('testtextPickerDefaultPickerItemHeight0004', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextPickerDefaultPickerItemHeight0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtextPickerDefaultPickerItemHeight0005
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0005
     */
    it('testtextPickerDefaultPickerItemHeight0005', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center");
      console.info("[testtextPickerDefaultPickerItemHeight0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtextPickerDefaultPickerItemHeight0006
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0006
     */
    it('testtextPickerDefaultPickerItemHeight0006', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0006] fontColor value :" + JSON.parse(strJson)
        .$attrs
        .fontColor);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testtextPickerDefaultPickerItemHeight0007
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0007
     */
    it('testtextPickerDefaultPickerItemHeight0007', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0007] lineHeight value :" + JSON.parse(strJson)
        .$attrs
        .lineHeight);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtextPickerDefaultPickerItemHeight0009
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0009
     */
    it('testtextPickerDefaultPickerItemHeight0009', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("0.00vp");
      console.info("[testtextPickerDefaultPickerItemHeight0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtextPickerDefaultPickerItemHeight0010
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0010
     */
    it('testtextPickerDefaultPickerItemHeight0010', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextPicker');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0010] textAlign value :" + JSON.parse(strJson)
        .$attrs
        .textAlign);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testtextPickerDefaultPickerItemHeight0011
     * @tc.desic         acetextPickerDefaultPickerItemHeightEtsTest0011
     */
    it('testtextPickerDefaultPickerItemHeight0011', 0, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0011 START');
      await Utils.sleep(2000);
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
