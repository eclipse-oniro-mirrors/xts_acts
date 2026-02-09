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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
export default function checkBoxTest1() {
  describe('ActsCheckBoxTest1', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Checkbox/CheckBox1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBox state success " + JSON.stringify(pages));
        if (!("CheckBox1" == pages.name)) {
          console.info("get checkBox state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push checkBox page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBox page error " + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0100
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0100
     * @tc.desc   Set the unselectedColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0100');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0100 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0200
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0200
     * @tc.desc   Set the unselectedColor property parameter to '#fffd0000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0200');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0200 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0300
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0300
     * @tc.desc   Set the unselectedColor property parameter to 'rgb(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0300');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0300 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0300 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0400
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0400
     * @tc.desc   Set the unselectedColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0400');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0400 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0400 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0500
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0500
     * @tc.desc   Set the unselectedColor property parameter to $r("app.color.checkbox_Color")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0500');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0500 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0500 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0600
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0600
     * @tc.desc   Set the unselectedColor property parameter to an outlier ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0600');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0600 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0600 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0700
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0700
     * @tc.desc   Set the unselectedColor property parameter to an outlier null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0700');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0700 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0700 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0800
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0800
     * @tc.desc   Set the unselectedColor property parameter to an outlier undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0800');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0800 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0800 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_0900
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_0900
     * @tc.desc   Set the unselectedColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_0900');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0900 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_0900 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_1000
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_1000
     * @tc.desc   Set the unselectedColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_1000');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1000 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1000 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_1100
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_1100
     * @tc.desc   Set unselectedColor property parameter to outlier 'bgr(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_1100');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1100 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_unselectedColor_1200
     * @tc.number ArkUX_Stage_Checkbox_unselectedColor_1200
     * @tc.desc   Set the unselectedColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_unselectedColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_unselectedColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_unselectedColor_1200');
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_unselectedColor_1200 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_unselectedColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0100
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0100
     * @tc.desc   Set the checkMarkColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0100');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0100 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0100 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0100 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0200
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0200
     * @tc.desc   Set the checkMarkColor property parameter to '#fffd0000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0200');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0200 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0200 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0200 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0300
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0300
     * @tc.desc   Set the checkMarkColor property parameter to 'rgb(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0300');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0300 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0300 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0300 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0300 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0400
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0400
     * @tc.desc   Set the checkMarkColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0400');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0400 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0400 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0400 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0400 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0500
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0500
     * @tc.desc   Set the checkMarkColor property parameter to $r("app.color.checkbox_Color")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0500');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0500 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0500 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0500 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0500 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0600
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0600
     * @tc.desc   Set the checkMarkColor property parameter to an outlier ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0600');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0600 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0600 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0600 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0600 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0700
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0700
     * @tc.desc   Set the checkMarkColor property parameter to an outlier null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0700');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0700 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0700 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0700 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0700 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0800
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0800
     * @tc.desc   Set the checkMarkColor property parameter to an outlier undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0800');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0800 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0800 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0800 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0800 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_0900
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_0900
     * @tc.desc   Set the checkMarkColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_0900');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0900 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0900 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0900 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_0900 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_1000
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_1000
     * @tc.desc   Set the checkMarkColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_1000');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1000 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1000 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1000 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1000 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_1100
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_1100
     * @tc.desc   Set checkMarkColor property parameter to outlier 'bgr(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_1100');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1100 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1100 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1100 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkColor_1200
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkColor_1200
     * @tc.desc   Set the checkMarkColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkColor_1200');
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1200 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1200 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkColor_1200 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0100
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0100
     * @tc.desc   Set the checkMarkSize property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0100');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0100 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0100 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0100 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0200
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0200
     * @tc.desc   Set the checkMarkSize property parameter to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0200');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0200 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0200 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0200 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0300
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0300
     * @tc.desc   Set the checkMarkSize property to string "60px".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0300');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0300 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0300 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0300 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0300 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("60.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0400
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0400
     * @tc.desc   Set the checkMarkSize property parameter to the percentage string "120%".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0400');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0400 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0400 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0400 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0400 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0500
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0500
     * @tc.desc   Set the checkMarkSize property parameter to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0500');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0500 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0500 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0500 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0500 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("50.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0600
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0600
     * @tc.desc   Set the checkMarkSize property parameter to an outlier ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0600');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0600 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0600 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0600 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0600 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0700
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0700
     * @tc.desc   Set the checkMarkSize property parameter to an outlier null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0700');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0700 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0700 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0700 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0700 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0800
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0800
     * @tc.desc   Set the checkMarkSize property parameter to an outlier undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0800');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0800 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0800 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0800 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0800 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_0900
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_0900
     * @tc.desc   Set the checkMarkSize property parameter to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_0900');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0900 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0900 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0900 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_0900 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("40.00fp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_1000
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_1000
     * @tc.desc   Set the checkMarkSize property parameter to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_1000');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1000 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1000 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1000 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1000 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_1100
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_1100
     * @tc.desc   Set the checkMarkSize property parameter to the outlier "asdf#$8".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_1100');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1100 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1100 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1100 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_1200
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_1200
     * @tc.desc   Set the checkMarkSize property parameter to 10lpx and the generic size property value to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_1200');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1200 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1200 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1200 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("10.00lpx");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkSize_1300
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkSize_1300
     * @tc.desc   Set the checkMarkSize property parameter to an outlier -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkSize_1300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkSize_1300');
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1300 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1300 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1300 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkSize_1300 component markObj.size is: " +
          JSON.stringify(markObj.size));
          expect(markObj.size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkSize_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0100
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0100
     * @tc.desc   Set the checkMarkWidth property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0100');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0200
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0200
     * @tc.desc   Set the checkMarkWidth property parameter to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0200');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0200 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0200 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0200 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0300
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0300
     * @tc.desc   Set the checkMarkWidth property to string "60px".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0300');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0300 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0300 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0300 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0300 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("60.00px");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0400
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0400
     * @tc.desc   Set the checkMarkWidth property argument to the percentage string "120%".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0400');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0400 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0400 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0400 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0400 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0500
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0500
     * @tc.desc   Set the checkMarkWidth property parameter to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0500');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0500 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0500 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0500 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0500 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("50.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0600
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0600
     * @tc.desc   Set the checkMarkWidth property parameter to an outlier ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0600');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0600 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0600 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0600 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0600 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0700
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0700
     * @tc.desc   Set the checkMarkWidth property parameter to an outlier null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0700');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0700 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0700 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0700 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0700 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0800
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0800
     * @tc.desc   Set the checkMarkWidth property parameter to an outlier undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0800');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0800 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0800 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0800 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0800 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_0900
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_0900
     * @tc.desc   Set the checkMarkWidth property parameter to 10 and the checkMarkWidth property parameter to 5fp again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_0900');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0900 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0900 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0900 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0900 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("5.00fp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_1000
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_1000
     * @tc.desc   Set the checkMarkWidth property parameter to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_1000');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1000 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1000 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1000 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1000 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_1100
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_1100
     * @tc.desc   Set the checkMarkWidth property parameter to an exception value of "asdf#$8".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_1100');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1100 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1100 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1100 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_1200
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_1200
     * @tc.desc   Set the checkMarkWidth property parameter to "40lpx" and the common property width property value to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_1200');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1200 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1200 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_0100 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("40.00lpx");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_1300
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_1300
     * @tc.desc   Set the checkMarkWidth property parameter to an exception value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_1300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_1300');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1300 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1300 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1300 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1300 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          expect(markObj.strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_CheckMarkWidth_1400
     * @tc.number ArkUX_Stage_Checkbox_CheckMarkWidth_1400
     * @tc.desc   Simultaneous setting checkMarkWidth(40) checkMarkSize(40)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Checkbox_CheckMarkWidth_1400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Checkbox_CheckMarkWidth_1400');
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1400 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj: Record<string, ESObject> = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component markObj is: " + JSON.stringify(markObj));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component markObj.strokeWidth is: " +
          JSON.stringify(markObj.strokeWidth));
          console.info("ArkUX_Stage_Checkbox_CheckMarkWidth_1400 component markObj.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(markObj.strokeWidth).assertEqual("40.00vp");
          expect(markObj.size).assertEqual("40.00vp");
          expect(markObj.strokeColor).assertEqual("#FF00FF00");
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_CheckMarkWidth_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
