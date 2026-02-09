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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';

export default function progressTest() {
  describe('ActsProgressTest', () => {

    beforeEach(async (done: Function) => {
      console.info("ActsProgressTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/Progress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ActsProgressTest state success " + JSON.stringify(pages));
        if (!("Progress" == pages.name)) {
          console.info("get ActsProgressTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ActsProgressTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActsProgressTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ActsProgressTest after each called");
    });


    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0100
     * @tc.number ArkUX_Stage_Progress_updateColor_0100
     * @tc.desc   Set the updateColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0100 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0100 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Progress_updateColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0200
     * @tc.number ArkUX_Stage_Progress_updateColor_0200
     * @tc.desc   Set the updateColor property parameter to '#fffd0000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0200 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0200 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Progress_updateColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0300
     * @tc.number ArkUX_Stage_Progress_updateColor_0300
     * @tc.desc   Set the updateColor property parameter to 'rgb(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0300 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0300 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Progress_updateColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0300', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0400
     * @tc.number ArkUX_Stage_Progress_updateColor_0400
     * @tc.desc   Set the updateColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0400 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0400 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Progress_updateColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0400', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0500
     * @tc.number ArkUX_Stage_Progress_updateColor_0500
     * @tc.desc   Set the updateColor property parameter to $r("app.color.Progress_updateColor")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0500 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0500 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Progress_updateColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0600
     * @tc.number ArkUX_Stage_Progress_updateColor_0600
     * @tc.desc   Set the updateColor property parameter to 0xff006cde
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0600 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0600 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FF006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0700
     * @tc.number ArkUX_Stage_Progress_updateColor_0700
     * @tc.desc   Set the updateColor property parameter to "#33006cde"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0700 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0700 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#33006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0700', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0800
     * @tc.number ArkUX_Stage_Progress_updateColor_0800
     * @tc.desc   Set the updateColor property parameter to "rgba(0,108,222,0.8)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0800 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0800 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#CC006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0800', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_0900
     * @tc.number ArkUX_Stage_Progress_updateColor_0900
     * @tc.desc   Set the updateColor property parameter to $r("app.color.Progress_updateColor_transparency")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_0900', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_0900 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_0900 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#33006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0900', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1000
     * @tc.number ArkUX_Stage_Progress_updateColor_1000
     * @tc.desc   Set the updateColor property parameter to an outlier ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1000 START');
      setTimeout(async () => {
        try {
          let strJson_default = getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default: ESObject = JSON.parse(strJson_default);
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1000 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual(obj_default.$attrs.updateColor);
          console.info('ArkUX_Stage_Progress_updateColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1000', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1100
     * @tc.number ArkUX_Stage_Progress_updateColor_1100
     * @tc.desc   Set the updateColor property parameter to an outlier null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1100 START');
      setTimeout(async () => {
        try {
          let strJson_default = getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default: ESObject = JSON.parse(strJson_default);
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1100 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual(obj_default.$attrs.updateColor);
          console.info('ArkUX_Stage_Progress_updateColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1200
     * @tc.number ArkUX_Stage_Progress_updateColor_1200
     * @tc.desc   Set the updateColor property parameter to an outlier undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1200 START');
      setTimeout(async () => {
        try {
          let strJson_default = getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default: ESObject = JSON.parse(strJson_default);
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1200 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual(obj_default.$attrs.updateColor);
          console.info('ArkUX_Stage_Progress_updateColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1300
     * @tc.number ArkUX_Stage_Progress_updateColor_1300
     * @tc.desc   Set the updateColor property parameter to an outlier 'bgr(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1300 START');
      setTimeout(async () => {
        try {
          let strJson_default = getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default: ESObject = JSON.parse(strJson_default);
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1300 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual(obj_default.$attrs.updateColor);
          console.info('ArkUX_Stage_Progress_updateColor_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1300', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1400
     * @tc.number ArkUX_Stage_Progress_updateColor_1400
     * @tc.desc   Set the updateColor property parameter to "rgba(0,108,222,70)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1400 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1400 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Progress_updateColor_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1400', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1500
     * @tc.number ArkUX_Stage_Progress_updateColor_1500
     * @tc.desc   Set the updateColor property parameter to "rgba(0,108,222,70)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1500 START');
      setTimeout(async () => {
        try {
          let strJson_default = getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default: ESObject = JSON.parse(strJson_default);
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1500 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual(obj_default.$attrs.updateColor);
          console.info('ArkUX_Stage_Progress_updateColor_1500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.name   ArkUX_Stage_Progress_updateColor_1600
     * @tc.number ArkUX_Stage_Progress_updateColor_1600
     * @tc.desc   Set the updateColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateColor_1600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateColor_1600 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateColor_1600 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.$attrs.updateColor));
          expect(obj.$attrs.updateColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Progress_updateColor_1600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_0100
     * @tc.number ArkUX_Stage_Progress_updateProgress_0100
     * @tc.desc   Set the updateProgress property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_0100 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_0100 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_0200
     * @tc.number ArkUX_Stage_Progress_updateProgress_0200
     * @tc.desc   Set the updateProgress property parameter to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_0200 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_0200 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(5);
          console.info('ArkUX_Stage_Progress_updateProgress_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_0500
     * @tc.number ArkUX_Stage_Progress_updateProgress_0500
     * @tc.desc   Set the updateProgress property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_0500 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_0500 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_0600
     * @tc.number ArkUX_Stage_Progress_updateProgress_0600
     * @tc.desc   Set the updateProgress property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_0600 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_0600 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_0700
     * @tc.number ArkUX_Stage_Progress_updateProgress_0700
     * @tc.desc   Set the updateProgress property parameter to -2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_0700 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_0700 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0700', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_0900
     * @tc.number ArkUX_Stage_Progress_updateProgress_0900
     * @tc.desc   Set the updateProgress property parameter to normal twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_0900', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_0900 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_0900 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(1);
          console.info('ArkUX_Stage_Progress_updateProgress_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0900', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_1000
     * @tc.number ArkUX_Stage_Progress_updateProgress_1000
     * @tc.desc   Set the updateProgress property parameter to normal first and then abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_1000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_1000 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_1000 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_1000', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.name   ArkUX_Stage_Progress_updateProgress_1100
     * @tc.number ArkUX_Stage_Progress_updateProgress_1100
     * @tc.desc   Set the updateProgress property parameter to first exception and then normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Progress_updateProgress_1100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Progress_updateProgress_1100 START');
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Progress_updateProgress_1100 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.$attrs.updateProgress));
          expect(obj.$attrs.updateProgress).assertEqual(5);
          console.info('ArkUX_Stage_Progress_updateProgress_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_1100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });
  })
}