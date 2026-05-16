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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";
import events_emitter from '@ohos.events.emitter';

export default function sliderTest() {
  describe('ActsAbilityTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TimePickerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sliderTest state pages: " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get sliderTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push sliderTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sliderTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0100
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0100
     * @tc.desc   Set the blockBorderColor attribute to 0xffa500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0100 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0200
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0200
     * @tc.desc   Set the blockBorderColor attribute to "ffc709e9"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0200 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0300
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0300
     * @tc.desc   Set the blockBorderColor attribute to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0300 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFFFC0CB");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0400
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0400
     * @tc.desc   Set the blockBorderColor attribute to $r("app.color.start_block_Border_Color")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0400 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FF19D41C");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0500
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0500
     * @tc.desc   Set the blockBorderColor attribute to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0500 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done()
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0600
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0600
     * @tc.desc   Set the blockBorderColor attribute to "rgb(0,255,255)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0600 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FF00FFFF");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0700
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0700
     * @tc.desc   Set the blockBorderColor attribute to 0x00ff00 and set the backgroundColor attribute to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0700 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FF00FF00");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0700 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0800
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0800
     * @tc.desc   Set the blockBorderColor attribute to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0800 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_0900
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0900
     * @tc.desc   Set the blockBorderColor attribute to  "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0900 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_0900 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_1000
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_1000
     * @tc.desc   Set the blockBorderColor attribute to " "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1000 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_1100
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_1100
     * @tc.desc   Do not set the blockBorderColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1100 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_1200
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_1200
     * @tc.desc   Set the blockBorderColor attribute to 0xffa500a and then set the blockBorderColor attribute to "#ffc709e9"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1200 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderColor_1300
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_1300
     * @tc.desc   Set the blockBorderColor attribute to 0xffa500 and then set the blockBorderColor attribute  to "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderColor_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1300 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0100
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0100
     * @tc.desc   Set the blockBorderWidth attribute to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0100 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0200
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0200
     * @tc.desc   Set the blockBorderWidth attribute to "5px"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0200 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0300
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0300
     * @tc.desc   Set the blockBorderWidth attribute to $r("app.string.block_border_width_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0300 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("7.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0400
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0400
     * @tc.desc   Set the blockBorderWidth attribute to ' '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0400 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(parseFloat(obj.$attrs.blockBorderWidth)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0500
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0500
     * @tc.desc   Set the blockBorderWidth attribute to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0500 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0600
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0600
     * @tc.desc   Set the blockBorderWidth attribute to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0600 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0700
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0700
     * @tc.desc   Set the blockBorderWidth attribute to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0700 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0800
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0800
     * @tc.desc   Set the blockBorderWidth attribute to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0800 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })


    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_0900
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0900
     * @tc.desc   Do not set the blockBorderWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0900 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_1000
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1000
     * @tc.desc   Set the blockBorderWidth attribute to 5 and then set the blockBorderWidth attribute to 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1000 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("7.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_1100
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1100
     * @tc.desc   Set the blockBorderWidth attribute to 5 and set the blockBorderWidth attribute to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1100 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(parseFloat(obj.$attrs.blockBorderWidth)).assertEqual(0);
          expect(obj.$attrs.blockBorderWidth.substr(obj.$attrs.blockBorderWidth.length-2, 2)).assertEqual("px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_1200
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1200
     * @tc.desc   Set the blockBorderWidth attribute to "asdf%^7"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1200 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(parseFloat(obj.$attrs.blockBorderWidth)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockBorderWidth_1300
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1300
     * @tc.desc   Set the blockBorderWidth attribute to 5, and set the general property width parameter to 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1300 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0100
     * @tc.number ArkUX_Stage_Slider_stepColor_0100
     * @tc.desc   Set the stepColor attribute to  0xffa500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0100 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0200
     * @tc.number ArkUX_Stage_Slider_stepColor_0200
     * @tc.desc   Set the stepColor attribute to "#ffc709e9"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0200 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0300
     * @tc.number ArkUX_Stage_Slider_stepColor_0300
     * @tc.desc   Set the stepColor attribute to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0300 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFFFC0CB");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0400
     * @tc.number ArkUX_Stage_Slider_stepColor_0400
     * @tc.desc   Set the stepColor attribute to $r("app.color.start_Step_Color")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0400 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FF19D41C");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0500
     * @tc.number ArkUX_Stage_Slider_stepColor_0500
     * @tc.desc   Set the stepColor attribute to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0500 is" + JSON.stringify(obj.$attrs.stepColor));
          let strJsonSample = getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample: Record<string, ESObject> = JSON.parse(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_0500 is" + JSON.stringify(objSample.$attrs.backgroundColor));
          console.info("----ArkUX_Stage_Slider_stepColor_0500 is" + JSON.stringify(objSample.$attrs.opacity));
          expect(objSample.$attrs.backgroundColor).assertContain('#');
          expect(obj.$attrs.stepColor).assertContain('#');
          done()
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0600
     * @tc.number ArkUX_Stage_Slider_stepColor_0600
     * @tc.desc   Set the stepColor attribute to "rgb(0,255,255)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0600 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FF00FFFF");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0700
     * @tc.number ArkUX_Stage_Slider_stepColor_0700
     * @tc.desc   Set the stepColor attribute to 0x00ff00, and set the general property backgroundColor parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0700 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FF00FF00");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0700 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0800
     * @tc.number ArkUX_Stage_Slider_stepColor_0800
     * @tc.desc   Set the stepColor attribute to  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0800 is" + JSON.stringify(obj.$attrs.stepColor));
          let strJsonSample = getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample: Record<string, ESObject> = JSON.parse(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_0800 is" + JSON.stringify(objSample.$attrs.backgroundColor));
          console.info("----ArkUX_Stage_Slider_stepColor_0800 is" + JSON.stringify(objSample.$attrs.opacity));
          expect(objSample.$attrs.backgroundColor).assertContain('#');
          expect(obj.$attrs.stepColor).assertContain('#');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_0900
     * @tc.number ArkUX_Stage_Slider_stepColor_0900
     * @tc.desc   Set the stepColor attribute to "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0900 is" + JSON.stringify(obj.$attrs.stepColor));
          let strJsonSample = getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample: Record<string, ESObject> = JSON.parse(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_0900 is" + JSON.stringify(objSample.$attrs.backgroundColor));
          console.info("----ArkUX_Stage_Slider_stepColor_0900 is" + JSON.stringify(objSample.$attrs.opacity));
          expect(objSample.$attrs.backgroundColor).assertContain('#');
          expect(obj.$attrs.stepColor).assertContain('#');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_0900 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_1000
     * @tc.number ArkUX_Stage_Slider_stepColor_1000
     * @tc.desc   Set the stepColor attribute to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1000 is" + JSON.stringify(obj.$attrs.stepColor));
          let strJsonSample = getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample: Record<string, ESObject> = JSON.parse(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_1000 is" + JSON.stringify(objSample.$attrs.backgroundColor));
          console.info("----ArkUX_Stage_Slider_stepColor_1000 is" + JSON.stringify(objSample.$attrs.opacity));
          expect(objSample.$attrs.backgroundColor).assertContain('#');
          expect(obj.$attrs.stepColor).assertContain('#');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_1100
     * @tc.number ArkUX_Stage_Slider_stepColor_1100
     * @tc.desc   Do not set the stepColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1100 is" + JSON.stringify(obj.$attrs.stepColor));
          let strJsonSample = getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample: Record<string, ESObject> = JSON.parse(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_1100 is" + JSON.stringify(objSample.$attrs.backgroundColor));
          console.info("----ArkUX_Stage_Slider_stepColor_1100 is" + JSON.stringify(objSample.$attrs.opacity));
          expect(objSample.$attrs.backgroundColor).assertContain('#');
          expect(obj.$attrs.stepColor).assertContain('#');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })


    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_1200
     * @tc.number ArkUX_Stage_Slider_stepColor_1200
     * @tc.desc   Set the stepColor attribute to 0xffa500 and then set the stepColor attribute parameter again to "#ffc709e9"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1200 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepColor_1300
     * @tc.number ArkUX_Stage_Slider_stepColor_1300
     * @tc.desc   Set the stepColor attribute to 0xffa500 and then set the stepColor attribute parameter again to "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepColor_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1300 is" + JSON.stringify(obj.$attrs.stepColor));
          let strJsonSample = getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample: Record<string, ESObject> = JSON.parse(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_1300 is" + JSON.stringify(objSample.$attrs.backgroundColor));
          console.info("----ArkUX_Stage_Slider_stepColor_1300 is" + JSON.stringify(objSample.$attrs.opacity));
          expect(objSample.$attrs.backgroundColor).assertContain('#');
          expect(obj.$attrs.stepColor).assertContain('#');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepColor_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0100
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0100
     * @tc.desc   Set the trackBorderRadius attribute to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0100 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0200
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0200
     * @tc.desc   Set the trackBorderRadius attribute to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0200 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("10.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0300
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0300
     * @tc.desc   Set the trackBorderRadius attribute to "60px"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0300 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("60.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0400
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0400
     * @tc.desc   Set the trackBorderRadius attribute to "120%"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0400 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("120.00%");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0500
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0500
     * @tc.desc   Set the trackBorderRadius attribute to $r("app.string.trach_border_radius_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0500 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("50.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0600
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0600
     * @tc.desc   Set the trackBorderRadius attribute to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0600 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0700
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0700
     * @tc.desc   Set the trackBorderRadius attribute to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0700 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0800
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0800
     * @tc.desc   Set the trackBorderRadius attribute to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0800 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_0900
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0900
     * @tc.desc   Set the trackBorderRadius attribute to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0900 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_1000
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1000
     * @tc.desc   Do not set the trackBorderRadius
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1000 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_1100
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1100
     * @tc.desc   Set the trackBorderRadius attribute to 10 and then set the trackBorderRadius attribute parameter again to 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1100 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("40.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_1200
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1200
     * @tc.desc   Set the trackBorderRadius attribute to 10 and then set the trackBorderRadius attribute parameter again to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1200 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_1300
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1300
     * @tc.desc   Set the trackBorderRadius attribute to "asdf#$8"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1300 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_trackBorderRadius_1400
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1400
     * @tc.desc   Set the trackBorderRadius attribute to 0, and set the general property size parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1400 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0100
     * @tc.number ArkUX_Stage_Slider_blockSize_0100
     * @tc.desc   Set the blockSize attribute both to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0100  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width ;
          let height: string = obj.$attrs.blockSize.height ;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0200
     * @tc.number ArkUX_Stage_Slider_blockSize_0200
     * @tc.desc   Set the blockSize attribute both to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0200  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(5);
          expect(parseFloat(height)).assertEqual(5);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0300
     * @tc.number ArkUX_Stage_Slider_blockSize_0300
     * @tc.desc   Set the width attribute to 15 ,height attribute to 20 in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0300  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(15);
          expect(parseFloat(height)).assertEqual(20);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0400
     * @tc.number ArkUX_Stage_Slider_blockSize_0400
     * @tc.desc   Set the width attribute to 12 ,height attribute to 12 in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0400  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0500
     * @tc.number ArkUX_Stage_Slider_blockSize_0500
     * @tc.desc   Set the width attribute to "20px" ,height attribute to "20px" in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0500  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(20);
          expect(parseFloat(height)).assertEqual(20);
          expect(width.substr(width.length-2, 2)).assertEqual("px");
          expect(height.substr(height.length-2, 2)).assertEqual("px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0600
     * @tc.number ArkUX_Stage_Slider_blockSize_0600
     * @tc.desc   Set the width attribute to "120%" ,height attribute to "120%" in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0600  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(120);
          expect(parseFloat(height)).assertEqual(120);
          expect(width.substr(width.length-1, 1)).assertEqual("%");
          expect(height.substr(height.length-1, 1)).assertEqual("%");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0700
     * @tc.number ArkUX_Stage_Slider_blockSize_0700
     * @tc.desc   Set the width attribute to $r("app.string.block_size_width_test"),height attribute to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0700  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(50);
          expect(parseFloat(height)).assertEqual(50);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0800
     * @tc.number ArkUX_Stage_Slider_blockSize_0800
     * @tc.desc   Set the width attribute to " ",height attribute to " " in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0800  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_0900
     * @tc.number ArkUX_Stage_Slider_blockSize_0900
     * @tc.desc   Set the width attribute to null ,height attribute to null in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0900  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1000
     * @tc.number ArkUX_Stage_Slider_blockSize_1000
     * @tc.desc   Set the width attribute to undefined ,height attribute to undefined in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1000  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1100
     * @tc.number ArkUX_Stage_Slider_blockSize_1100
     * @tc.desc   Set the width attribute to -1 ,height attribute to -1 in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1100  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1200
     * @tc.number ArkUX_Stage_Slider_blockSize_1200
     * @tc.desc   Set the width attribute to -1 ,height attribute to 15 in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1200  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1300
     * @tc.number ArkUX_Stage_Slider_blockSize_1300
     * @tc.desc   Set the width attribute to "15" ,height attribute to "-1" in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1300  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1400
     * @tc.number ArkUX_Stage_Slider_blockSize_1400
     * @tc.desc   Do not set the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1400  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(width).assertEqual('12.00vp');
          expect(height).assertEqual('12.00vp');

          console.info("----ArkUX_Stage_Slider_blockSize_1400  isend ");

          let strJson1 = getInspectorByKey('ArkUX_Stage_Slider_blockSizeOutSet_1400');
          let obj1: Record<string, ESObject> = JSON.parse(strJson1);
          console.info("----ArkUX_Stage_Slider_blockSizeOutSet_1400  is " + JSON.stringify(obj1.$attrs.blockSize));
          let width1: string = obj1.$attrs.blockSize.width;
          let height1: string = obj1.$attrs.blockSize.height;
          expect(width1).assertContain('vp');
          expect(height1).assertContain('vp');
          done();          
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1500
     * @tc.number ArkUX_Stage_Slider_blockSize_1500
     * @tc.desc   Set the width attribute to 15 ,height attribute to 20 in the blockSize and then  set the width attribute to "20fp",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1500  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(width).assertEqual('20.00fp');
          expect(height).assertEqual('25.00fp');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1600
     * @tc.number ArkUX_Stage_Slider_blockSize_1600
     * @tc.desc   Set the width attribute to 15 ,height attribute to 20 in the blockSize and then set the width attribute to -1,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1600  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(width).assertEqual('12.00vp');
          expect(height).assertEqual('12.00vp');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1700
     * @tc.number ArkUX_Stage_Slider_blockSize_1700
     * @tc.desc   Set the width attribute to "asdf#$8" ,height attribute to "asdf#$8" in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1700  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(width).assertEqual('12.00vp');
          expect(height).assertEqual('12.00vp');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockSize_1800
     * @tc.number ArkUX_Stage_Slider_blockSize_1800
     * @tc.desc   Set the width attribute to "20lpx" ,height attribute to "20lpx" in the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockSize_1800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_1800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_1800  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(width).assertEqual('20.00lpx');
          expect(height).assertEqual('20.00lpx');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockSize_1800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0100
     * @tc.number ArkUX_Stage_Slider_stepSize_0100
     * @tc.desc   Set the stepSize attribute to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0100 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("0.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0200
     * @tc.number ArkUX_Stage_Slider_stepSize_0200
     * @tc.desc   Set the stepSize attribute to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0200 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("10.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0300
     * @tc.number ArkUX_Stage_Slider_stepSize_0300
     * @tc.desc   Set the stepSize attribute to "60px"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0300 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("60.00px");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0400
     * @tc.number ArkUX_Stage_Slider_stepSize_0400
     * @tc.desc   Set the stepSize attribute to "120%"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0400 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("120.00%");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0500
     * @tc.number ArkUX_Stage_Slider_stepSize_0500
     * @tc.desc   Set the stepSize attribute to  $r("app.string.step_size_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0500 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("50.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0600
     * @tc.number ArkUX_Stage_Slider_stepSize_0600
     * @tc.desc   Set the stepSize attribute to " "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0600 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(parseFloat(obj.$attrs.stepSize)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0700
     * @tc.number ArkUX_Stage_Slider_stepSize_0700
     * @tc.desc   Set the stepSize attribute to  null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0700 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0800
     * @tc.number ArkUX_Stage_Slider_stepSize_0800
     * @tc.desc   Set the stepSize attribute to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0800 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_0900
     * @tc.number ArkUX_Stage_Slider_stepSize_0900
     * @tc.desc   Set the stepSize attribute to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0900 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_1000
     * @tc.number ArkUX_Stage_Slider_stepSize_1000
     * @tc.desc   Do not set the blockSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1000 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_1100
     * @tc.number ArkUX_Stage_Slider_stepSize_1100
     * @tc.desc   Set the stepSize attribute to 10 and then set the stepSize attribute  to 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1100 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("40.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_1200
     * @tc.number ArkUX_Stage_Slider_stepSize_1200
     * @tc.desc   Set the stepSize attribute to 10，set the stepSize attribute parameter again to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1200 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(parseFloat(obj.$attrs.stepSize)).assertEqual(4);
          expect(obj.$attrs.stepSize.substr(obj.$attrs.stepSize.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_1300
     * @tc.number ArkUX_Stage_Slider_stepSize_1300
     * @tc.desc   Set the stepSize attribute to "asdf#$8"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1300 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(parseFloat(obj.$attrs.stepSize)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_stepSize_1400
     * @tc.number ArkUX_Stage_Slider_stepSize_1400
     * @tc.desc   Set the stepSize attribute to 10, and set the general property  size parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_stepSize_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1400 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("10.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0100
     * @tc.number ArkUX_Stage_Slider_blockStyle_0100
     * @tc.desc   Set the blockStyle attribute to sliderDefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0100 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0200
     * @tc.number ArkUX_Stage_Slider_blockStyle_0200
     * @tc.desc   Do not set the blockStyle property parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0200 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0300
     * @tc.number ArkUX_Stage_Slider_blockStyle_0300
     * @tc.desc   Set the blockStyle property attribute BlockStyleType.IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0300 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.IMAGE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0400
     * @tc.number ArkUX_Stage_Slider_blockStyle_0400
     * @tc.desc   Set the blockStyle property attribute to  BlockStyleType.Shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0400 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0500
     * @tc.number ArkUX_Stage_Slider_blockStyle_0500
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0500');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0500 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0600
     * @tc.number ArkUX_Stage_Slider_blockStyle_0600
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0600');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0600 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0600  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0700
     * @tc.number ArkUX_Stage_Slider_blockStyle_0700
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0700');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0700 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0700  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0800
     * @tc.number ArkUX_Stage_Slider_blockStyle_0800
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0800');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0800 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0800  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_0900
     * @tc.number ArkUX_Stage_Slider_blockStyle_0900
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0900');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0900 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_0900  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_1000
     * @tc.number ArkUX_Stage_Slider_blockStyle_1000
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1000 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_1000  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_1100
     * @tc.number ArkUX_Stage_Slider_blockStyle_1100
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1100 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_1200
     * @tc.number ArkUX_Stage_Slider_blockStyle_1200
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1200 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_1200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_1300
     * @tc.number ArkUX_Stage_Slider_blockStyle_1300
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1300 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_blockStyle_1400
     * @tc.number ArkUX_Stage_Slider_blockStyle_1400
     * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_blockStyle_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1400 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_blockStyle_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_Test_0100
     * @tc.number ArkUX_Stage_Slider_Test_0100
     * @tc.desc   Set the blockSizeWidth attribute parameter is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_Test_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_Test_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_Test_0100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("-->ArkUX_Stage_Slider_Test_0100 component obj is: " + JSON.stringify(obj));
          console.info("-->ArkUX_Stage_Slider_Test_0100 obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockSize is" + JSON.stringify(obj.$attrs.blockSize));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockBorderColor is" + JSON.stringify(obj.$attrs.blockBorderColor));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockBorderWidth is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          console.info("----ArkUX_Stage_Slider_Test_0100 stepColor is" + JSON.stringify(obj.$attrs.stepColor));
          console.info("----ArkUX_Stage_Slider_Test_0100 trackBorderRadius is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          console.info("----ArkUX_Stage_Slider_Test_0100 stepSize is" + JSON.stringify(obj.$attrs.stepSize));
          let width: string = obj.$attrs.blockSize.width;
          let height: string = obj.$attrs.blockSize.height;
          expect(parseFloat(width)).assertEqual(10);
          expect(parseFloat(height)).assertEqual(10);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          expect(obj.$attrs.blockBorderWidth).assertEqual("10.00vp")
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFC709E9")
          expect(obj.$attrs.stepColor).assertEqual("#FFF10202")
          expect(obj.$attrs.trackBorderRadius).assertEqual("15.00vp")
          expect(obj.$attrs.stepSize).assertEqual("10.00vp")
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_Test_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_sliderInteractionMode_1000
     * @tc.number ArkUX_Stage_Slider_sliderInteractionMode_1000
     * @tc.desc   Check the sliderInteractionMode property default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_sliderInteractionMode_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_1000 is " + JSON.stringify(obj.$attrs.sliderInteractionMode));
          expect(obj.$attrs.sliderInteractionMode).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_1000  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_sliderInteractionMode_1102
     * @tc.number ArkUX_Stage_Slider_sliderInteractionMode_1102
     * @tc.desc   Set the sliderInteractionMode property attribute to SliderInteraction.SLIDE_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_sliderInteractionMode_1102', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_1102] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1102');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_1102 is " + JSON.stringify(obj.$attrs.sliderInteractionMode));
          expect(obj.$attrs.sliderInteractionMode).assertEqual("SliderInteraction.SLIDE_ONLY");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_1102  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

        /**
         * @tc.name   ArkUX_Stage_Slider_sliderInteractionMode_1103
         * @tc.number ArkUX_Stage_Slider_sliderInteractionMode_1103
         * @tc.desc   Set the sliderInteractionMode property attribute to incorrect number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ArkUX_Stage_Slider_sliderInteractionMode_1103', Level.LEVEL1, async (done: Function) => {
          console.info('[ArkUX_Stage_Slider_sliderInteractionMode_1103] START');
          setTimeout(() => {
            try {
              let strJson = getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1103');
              let obj: Record<string, ESObject> = JSON.parse(strJson);
              console.info("----ArkUX_Stage_Slider_sliderInteractionMode_1103 is " + JSON.stringify(obj.$attrs.sliderInteractionMode));
              expect(obj.$attrs.sliderInteractionMode).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
              done();
            } catch (err) {
              console.info('ArkUX_Stage_Slider_sliderInteractionMode_1103  ERROR: ' + JSON.stringify(err));
              done();
            }
          }, 500)
        })

   

    /**
     * @tc.name   ArkUX_Stage_Slider_sliderInteractionMode_1300
     * @tc.number ArkUX_Stage_Slider_sliderInteractionMode_1300
     * @tc.desc   Set the sliderInteractionMode property attribute to some incorrect value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_sliderInteractionMode_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_1300 is " + JSON.stringify(obj.$attrs.sliderInteractionMode));
          expect(obj.$attrs.sliderInteractionMode).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_sliderInteractionMode_1400
     * @tc.number ArkUX_Stage_Slider_sliderInteractionMode_1400
     * @tc.desc   Set the sliderInteractionMode property attribute to some incorrect value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_sliderInteractionMode_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1400');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_1400 is " + JSON.stringify(obj.$attrs.sliderInteractionMode));
          expect(obj.$attrs.sliderInteractionMode).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_minResponsiveDistance_def_1100
     * @tc.number ArkUX_Stage_Slider_minResponsiveDistance_def_1100
     * @tc.desc   Check the minResponsiveDistance property attribute default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_minResponsiveDistance_def_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_def_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1000');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_def_1100 is " + JSON.stringify(obj.$attrs.minResponsiveDistance));
          expect(Number(obj.$attrs.minResponsiveDistance)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_def_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_minResponsiveDistance_1100
     * @tc.number ArkUX_Stage_Slider_minResponsiveDistance_1100
     * @tc.desc   Set the minResponsiveDistance property attribute to number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_minResponsiveDistance_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1100');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_1100 is " + JSON.stringify(obj.$attrs.minResponsiveDistance));
          expect(Number(obj.$attrs.minResponsiveDistance)).assertEqual(10);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_minResponsiveDistance_1101
     * @tc.number ArkUX_Stage_Slider_minResponsiveDistance_1101
     * @tc.desc   Set the minResponsiveDistance property attribute to number value more then (min,max) distance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_minResponsiveDistance_1101', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_1101] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1101');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_1101 is " + JSON.stringify(obj.$attrs.minResponsiveDistance));
          expect(Number(obj.$attrs.minResponsiveDistance)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_1101  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_minResponsiveDistance_1200
     * @tc.number ArkUX_Stage_Slider_minResponsiveDistance_1200
     * @tc.desc   Set the minResponsiveDistance property attribute to negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_minResponsiveDistance_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1200');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_1200 is " + JSON.stringify(obj.$attrs.minResponsiveDistance));
          expect(Number(obj.$attrs.minResponsiveDistance)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_1200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_minResponsiveDistance_1300
     * @tc.number ArkUX_Stage_Slider_minResponsiveDistance_1300
     * @tc.desc   Set the minResponsiveDistance property attribute to some incorrect value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Slider_minResponsiveDistance_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1300');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_1300 is " + JSON.stringify(obj.$attrs.minResponsiveDistance));
          expect(Number(obj.$attrs.minResponsiveDistance)).assertEqual(0);
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })
    
  })
}
