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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router';

export default function checkBoxGroupTest() {
  describe('ActsCheckBoxGroupTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.routerOptions = {
        url: "TestAbility/pages/CheckBoxGroup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CheckBoxGroup state success " + JSON.stringify(pages));
        if (!("CheckBoxGroup" == pages.name)) {
          console.info("get CheckBoxGroup state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push CheckBoxGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckBoxGroup page error " + JSON.stringify(err));
      }
      done()
    });

    /*
    *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0100
    *tc.name   Tests the unselectedColor property of the CheckboxGroup component
    *tc.desc   Set the unselectedColor property parameter to 0x00ff00
    */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0100');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0100 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0200
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to '#fffd0000'
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0200');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0200 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0300
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0300');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0300 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0300 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0400
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0400');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0400 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0400 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0500
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to $r("app.color.checkbox_Color")
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0500');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0500 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0500 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0600
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to an outlier ""
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0600');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0600 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0600 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0700
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to an outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0700');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0700 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0700 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0800
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to an outlier undefined
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0800');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0800 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0800 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0900
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to Color.Pink
     *          and again set the unselectedColor property parameter to "#FFFD0000".
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0900');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0900 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0900 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_1000
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to Color.Pink
     *          and again set the unselectedColor property parameter to the outlier value of undefined
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1000');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1000 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1000 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_1100
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set unselectedColor property parameter to outlier 'bgr(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1100');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1100 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_1200
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to 0x00ff00
     *          and the universal property backgroundColor property value to the outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1200');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1200 component JSON.parse(strJson).$attrs.unselectedColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
    *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100
    *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
    *tc.desc   Set the checkMarkColor property parameter to 0x00ff00
    */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to '#fffd0000'
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to $r("app.color.checkbox_Color")
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to an outlier ""
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to an outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to an outlier undefined
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to Color.Pink
     *          and again set the checkMarkColor property parameter to "#FFFD0000".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to Color.Pink
     *          and again set the checkMarkColor property parameter to the outlier 'bgr(138,43,226)'.
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set checkMarkColor property parameter to outlier 'bgr(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to 0x00ff00
     *          and the universal property backgroundColor property value to null outlier
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component JSON.parse(strJson).$attrs.strokeColor is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
    *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100
    *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
    *tc.desc   Set the checkMarkSize property parameter to 0
    */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to 10
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("10.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property to string "60px".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("60.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to the percentage string "120%".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to
     *          the resource reference type $r("app.string.Check_Mark_Size_test")
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("50.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to an outlier ""
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to an outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to an outlier undefined
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to 10
     *          and again set the checkMarkSize property parameter to "40fp"
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("40.00fp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to 10
     *          and again set the checkMarkSize property parameter to the exception value undefined
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to the outlier "asdf#$8".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to "10.00lpx" and the generic size property value to null
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("10.00lpx");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300
     *tc.name   Tests the CheckMarkSize property of the CheckboxGroup component
     *tc.desc   Set the checkMarkSize property parameter to an outlier -10
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 component JSON.parse(JSON.parse(strJson).$attrs.mark).size is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).size));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to 0
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to 1
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("1.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property to string "60px".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("60.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property argument to the percentage string "120%".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to
     *          the resource reference type $r("app.string.Check_Mark_Size_test").
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("50.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to an outlier ""
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to an outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to an outlier undefined
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to 10 and the checkMarkWidth property parameter to "5fp" again
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("5.00fp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to 10
     *          and again set the checkMarkWidth property parameter to the exception value undefined
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to an exception value of "frgw*&^%".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to "40lpx" and the common property width property value to null
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("40.00lpx");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300
     *tc.name   Tests the CheckMarkWidth property of the CheckboxGroup component
     *tc.desc   Set the checkMarkWidth property parameter to an exception value of -1.
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400
     *tc.name   Tests the CheckMarkWidth&checkMarkSize&checkMarkColor&unselectedColor property of
     *          the CheckboxGroup component
     *tc.desc   Simultaneous setting checkMarkWidth(40) checkMarkSize(40)
     *          checkMarkColor(0x00ff00) unselectedColor(Color.Pink)
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(JSON.parse(strJson).$attrs.mark) is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark)));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.mark).unselectedColor));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("40.00vp");
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("40.00vp");
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual("#FF00FF00");
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500
     *tc.name   Tests the CheckMarkWidth&checkMarkSize&checkMarkColor&unselectedColor property of
     *          the CheckboxGroup component
     *tc.desc   Simultaneous setting checkMarkWidth(40) checkMarkSize(40)
     *          checkMarkColor(0x00ff00) unselectedColor(Color.Pink)
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('checkboxNO');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 START  :' + JSON.stringify(strJson));
          
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 component JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.unselectedColor));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 component JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.mark));
          
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("0.00vp");
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.borderColor);
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          let strJsonGroup = getInspectorByKey('checkboxGroupNO');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 strJsonGroup  :' + JSON.stringify(strJsonGroup));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 objGroup JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth is: " +
          JSON.stringify(JSON.parse(strJsonGroup).$attrs.unselectedColor));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 objGroup JSON.parse(strJson).$attrs.mark is: " +
          JSON.stringify(JSON.parse(strJsonGroup).$attrs.mark));
          expect(JSON.parse(JSON.parse(strJsonGroup).$attrs.mark).strokeWidth).assertEqual("2.00vp");
          expect(JSON.parse(JSON.parse(strJsonGroup).$attrs.mark).size).assertEqual("0.00vp");
          expect(JSON.parse(JSON.parse(strJsonGroup).$attrs.mark).strokeColor).assertEqual(JSON.parse(strJson).$attrs.borderColor);
          expect(JSON.parse(strJsonGroup).$attrs.unselectedColor).assertEqual(JSON.parse(strJson).$attrs.backgroundColor);
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
