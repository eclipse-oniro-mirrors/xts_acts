/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils'

export default function commonBackgroundBlurStyleJsunit() {
  describe('commonBackgroundBlurStyleTest', () => {
    beforeEach(async () => {
      console.info('flex beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/common3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get common state success ' + JSON.stringify(pages));
        if (!('common3' == pages.name)) {
          console.info('get common state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push common page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push common page error: ' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('commonBackgroundBlurStyle after each called');
    });

    /**
     * @tc.name   testcommonBackgroundBlurStyle001
     * @tc.number testcommonBackgroundBlurStyle001
     * @tc.desc   acecommonBackgroundBlurStyleEtsTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonBackgroundBlurStyle001', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('borderImageText');
      console.info('[testcommonBackgroundBlurStyle001] component borderImage strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      let jsonObject: Record<string, Object> = JSON.parse(JSON.parse(strJson).$attrs.borderImage);
      expect(jsonObject.width).assertEqual('10.00px');

    });

    /**
     * @tc.name   testcommonBackgroundBlurStyle002
     * @tc.number testcommonBackgroundBlurStyle002
     * @tc.desc   acecommonBackgroundBlurStyleEtsTest002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonBackgroundBlurStyle002', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabIndexText');
      console.info('[testcommonBackgroundBlurStyle002] component tabIndex strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.tabIndex).assertEqual(1);
      console.info('[testcommonBackgroundBlurStyle002] tabIndex value :' + JSON.parse(strJson).$attrs.textAlign);

    });

    /**
     * @tc.name   testcommonBackgroundBlurStyle003
     * @tc.number testcommonBackgroundBlurStyle003
     * @tc.desc   acecommonBackgroundBlurStyleEtsTest003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonBackgroundBlurStyle003', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sepiaText');
      console.info('[testcommonBackgroundBlurStyle003] component sepia strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.sepia).assertEqual(1);
      console.info('[testcommonBackgroundBlurStyle003] sepia value :' + JSON.parse(strJson).$attrs.sepia);

    });

    /**
     * @tc.name   testcommonBackgroundBlurStyle004
     * @tc.number testcommonBackgroundBlurStyle004
     * @tc.desc   acecommonBackgroundBlurStyleEtsTest004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonBackgroundBlurStyle004', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignRulesText');
      console.info('[testcommonBackgroundBlurStyle004] component alignRules strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.alignRules).assertEqual(undefined);
      console.info('[testcommonBackgroundBlurStyle004] alignRules value :' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .alignRules));

    });

    /**
     * @tc.name   testcommonBackgroundBlurStyle005
     * @tc.number testcommonBackgroundBlurStyle005
     * @tc.desc   acecommonBackgroundBlurStyleEtsTest005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonBackgroundBlurStyle005', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info('[testcommonBackgroundBlurStyle005] component backgroundBlurStyle strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      // let testL = obj.$attrs.backgroundBlurStyle;
      expect(JSON.parse(strJson).$attrs.backgroundBlurStyle instanceof Object).assertTrue();
      console.info('[testcommonBackgroundBlurStyle005] backgroundBlurStyle value :' + JSON.parse(strJson)
        .$attrs
        .backgroundBlurStyle);

    });

    /**
     * @tc.name   testcommonHoverEffectHighlight0001
     * @tc.number testcommonHoverEffectHighlight0001
     * @tc.desc   acecommonHoverEffectHighlightEtsTest0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonHoverEffectHighlight0001', Level.LEVEL2, async () => {
      console.info('commonHoverEffectHighlight testcommonHoverEffectHighlight0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('hoverEffectText');
      console.info('[testcommonHoverEffectHighlight0001] component hoverEffect strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(JSON.parse(strJson).$attrs.hoverEffect).assertEqual('HoverEffect.Highlight');
      console.info('[testcommonHoverEffectHighlight0001] hoverEffect value :' + JSON.parse(strJson).$attrs.hoverEffect);

    });

    /**
     * @tc.name   testcommonHoverEffectScale0001
     * @tc.number testcommonHoverEffectScale0001
     * @tc.desc   acecommonHoverEffectScaleEtsTest0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommonHoverEffectScale0001', Level.LEVEL2, async () => {
      console.info('commonHoverEffectScale testcommonHoverEffectScale0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('hoverEffectScaleText');
      console.info('[testcommonHoverEffectScale0001] component hoverEffect strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(JSON.parse(strJson).$attrs.hoverEffect).assertEqual('HoverEffect.Scale');
      console.info('[testcommonHoverEffectScale0001] hoverEffect value :' + JSON.parse(strJson).$attrs.hoverEffect);

    });

  })
}
