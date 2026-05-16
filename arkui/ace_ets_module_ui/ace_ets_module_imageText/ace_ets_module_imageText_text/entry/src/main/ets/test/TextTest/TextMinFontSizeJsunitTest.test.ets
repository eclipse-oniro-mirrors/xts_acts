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
import Utils from '../../MainAbility/common/Utils'

export default function TextMinFontSizeJsunitTest() {
  describe('TextMinFontSizeJsunitTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/Text/TextMinFontSizeJsunitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMinFontSizeJsunitTest state success " + JSON.stringify(pages));
        if (!("TextMinFontSizeJsunitTest" == pages.name)) {
          console.info("get TextMinFontSizeJsunitTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextMinFontSizeJsunitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMinFontSizeJsunitTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextMinFontSizeJsunitTest after each called");
    });

    /**
     * @tc.name   testtextMinFontSize0001
     * @tc.number testtextMinFontSize0001
     * @tc.desc   acetextMinFontSizeEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0001', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testtextMinFontSize0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testtextMinFontSize0002
     * @tc.number testtextMinFontSize0002
     * @tc.desc   acetextMinFontSizeEtsTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0002', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testtextMinFontSize0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testtextMinFontSize0003
     * @tc.number testtextMinFontSize0003
     * @tc.desc   acetextMinFontSizeEtsTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0003', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("30.00px");
      console.info("[testtextMinFontSize0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });


    /**
     * @tc.name   testtextMinFontSize0004
     * @tc.number testtextMinFontSize0004
     * @tc.desc   acetextMinFontSizeEtsTest0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0004', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextMinFontSize0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testtextMinFontSize0005
     * @tc.number testtextMinFontSize0005
     * @tc.desc   acetextMinFontSizeEtsTest0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0005', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextMinFontSize0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /**
     * @tc.name   testtextMinFontSize0006
     * @tc.number testtextMinFontSize0006
     * @tc.desc   acetextMinFontSizeEtsTest0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0006', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextMinFontSize0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);
    });

    /**
     * @tc.name   testtextMinFontSize0007
     * @tc.number testtextMinFontSize0007
     * @tc.desc   acetextMinFontSizeEtsTest0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0007', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testtextMinFontSize0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);
    });

    /**
     * @tc.name   testtextMinFontSize0009
     * @tc.number testtextMinFontSize0009
     * @tc.desc   acetextMinFontSizeEtsTest0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0009', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextMinFontSize0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testtextMinFontSize0010
     * @tc.number testtextMinFontSize0010
     * @tc.desc   acetextMinFontSizeEtsTest0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0010', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextMinFontSize0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });
    /**
     * @tc.name   testtextMinFontSize0011
     * @tc.number testtextMinFontSize0011
     * @tc.desc   acetextMinFontSizeEtsTest0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextMinFontSize0011', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0011] component minFontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.minFontSize).assertEqual("50.00px");
      console.info("[testtextMinFontSize0011] minFontSize value :" + JSON.parse(strJson).$attrs.minFontSize);

    });
    /**
     * @tc.name   testtextCopyOptionText0001
     * @tc.number testtextCopyOptionText0001
     * @tc.desc   acetextMinFontSizeEtsTest0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextCopyOptionText0001', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextCopyOptionText0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('copyOptionText');
      console.info("[testtextCopyOptionText0001] component copyOption strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testtextCopyOptionText0001] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);

    });
  })
}
