/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import { ArcDirection } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ArcDotIndicatorNullUndefinedTest() {
  describe('ArcDotIndicatorNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ArcDotIndicatorNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcSwiper/ArcDotIndicatorNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcDotIndicatorNullUndefined state pages:" + JSON.stringify(pages));
        if (!("ArcDotIndicatorNullUndefined" == pages.name)) {
          console.info("get ArcDotIndicatorNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcDotIndicatorNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcDotIndicatorNullUndefined page error:" + err);
      }
      console.info("ArcDotIndicatorNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   arcDotIndicatorArcDirectionNull_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_ARC_DIRECTION_NULL_0100
     * @tc.desc   Test ArcDotIndicator arcDirection method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorArcDirectionNull_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorArcDirectionNull_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_arcDirection_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorArcDirectionNull_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorArcDirectionNull_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        expect(JSON.stringify(obj.$attrs?.indicator).includes(JSON.stringify(ArcDirection.SIX_CLOCK_DIRECTION))).assertTrue();
        console.info('[arcDotIndicatorArcDirectionNull_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorArcDirectionNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[arcDotIndicatorArcDirectionNull_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorArcDirectionUndefined_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_ARC_DIRECTION_UNDEFINED_0100
     * @tc.desc   Test ArcDotIndicator arcDirection method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorArcDirectionUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorArcDirectionUndefined_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_arcDirection_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorArcDirectionUndefined_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorArcDirectionUndefined_0100] arcSwiper indicator is: "
          + JSON.stringify(obj.$attrs?.indicator));
        expect(JSON.stringify(obj.$attrs?.indicator).includes(JSON.stringify(ArcDirection.SIX_CLOCK_DIRECTION))).assertTrue();
      } catch (error) {
        console.info('[arcDotIndicatorArcDirectionUndefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorArcDirectionUndefined_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorItemColorNull_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_ITEM_COLOR_NULL_0100
     * @tc.desc   Test ArcDotIndicator itemColor method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorItemColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorItemColorNull_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_itemColor_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorItemColorNull_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorItemColorNull_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 默认值: '#A9FFFFFF'
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#A9FFFFFF')).assertTrue();
        console.info('[arcDotIndicatorItemColorNull_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorItemColorNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorItemColorNull_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorItemColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_ITEM_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcDotIndicator itemColor method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorItemColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorItemColorUndefined_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_itemColor_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorItemColorUndefined_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorItemColorUndefined_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 默认值: '#A9FFFFFF'
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#A9FFFFFF')).assertTrue();
        console.info('[arcDotIndicatorItemColorUndefined_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorItemColorUndefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorItemColorUndefined_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorSelectedItemColorNull_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_SELECTED_ITEM_COLOR_NULL_0100
     * @tc.desc   Test ArcDotIndicator selectedItemColor method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorSelectedItemColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorSelectedItemColorNull_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_selectedItemColor_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorSelectedItemColorNull_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorSelectedItemColorNull_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 默认值: '#FF5EA1FF'
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#FF5EA1FF')).assertTrue();
        console.info('[arcDotIndicatorSelectedItemColorNull_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorSelectedItemColorNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorSelectedItemColorNull_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorSelectedItemColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_SELECTED_ITEM_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcDotIndicator selectedItemColor method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorSelectedItemColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorSelectedItemColorUndefined_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_selectedItemColor_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorSelectedItemColorUndefined_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorSelectedItemColorUndefined_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 默认值: '#FF5EA1FF'
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#FF5EA1FF')).assertTrue();
        console.info('[arcDotIndicatorSelectedItemColorUndefined_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorSelectedItemColorUndefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorSelectedItemColorUndefined_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorBackgroundColorNull_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_BACKGROUND_COLOR_NULL_0100
     * @tc.desc   Test ArcDotIndicator backgroundColor method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorBackgroundColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorBackgroundColorNull_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_backgroundColor_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorBackgroundColorNull_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorBackgroundColorNull_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 默认值: '#FF404040'
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#FF404040')).assertTrue();
        console.info('[arcDotIndicatorBackgroundColorNull_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorBackgroundColorNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorBackgroundColorNull_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorBackgroundColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_BACKGROUND_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcDotIndicator backgroundColor method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorBackgroundColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorBackgroundColorUndefined_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_backgroundColor_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorBackgroundColorUndefined_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorBackgroundColorUndefined_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 默认值: '#FF404040'
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#FF404040')).assertTrue();
        console.info('[arcDotIndicatorBackgroundColorUndefined_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorBackgroundColorUndefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorBackgroundColorUndefined_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorMaskColorNull_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_MASK_COLOR_NULL_0100
     * @tc.desc   Test ArcDotIndicator maskColor method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorMaskColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorMaskColorNull_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_maskColor_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorMaskColorNull_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorMaskColorNull_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 验证组件存在#FF000000
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#FF000000')).assertTrue();
        console.info('[arcDotIndicatorMaskColorNull_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorMaskColorNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorMaskColorNull_0100] END');
    })

    /**
     * @tc.name   arcDotIndicatorMaskColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_DOT_INDICATOR_MASK_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcDotIndicator maskColor method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcDotIndicatorMaskColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcDotIndicatorMaskColorUndefined_0100] START');

      try {
        let strJson: string = getInspectorByKey('arcSwiper_maskColor_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcDotIndicatorMaskColorUndefined_0100] arcSwiper obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcDotIndicatorMaskColorUndefined_0100] arcSwiper indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        // 验证组件存在
        expect(JSON.stringify(obj.$attrs?.indicator).includes('#FF000000')).assertTrue();
        console.info('[arcDotIndicatorMaskColorUndefined_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcDotIndicatorMaskColorUndefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcDotIndicatorMaskColorUndefined_0100] END');
    })
  })
}
