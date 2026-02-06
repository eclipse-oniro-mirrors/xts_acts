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
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';

export default function SelectTest() {
  describe('SelectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/Select',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Select state success " + JSON.stringify(pages));
        if (!("Select" == pages.name)) {
          console.info("get Select state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Select page error: " + err);
      }
      done();
    });

    /*
     *@tc.number ArkUX_Select_Visual_0030
     *@tc.name   Support modifying the select optionWidth and optionHeight change of Select component
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to 200
     */
    it('ArkUX_Select_Visual_0030', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0030 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Select_Visual_0030');
          console.info('ArkUX_Select_Visual_0030 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Select_Visual_0030 obj is: " + JSON.stringify(obj));
          let optionWidth: ESObject = obj.$attrs.optionWidth;
          let optionHeight: ESObject = obj.$attrs.optionHeight;
          expect(optionWidth).assertEqual("300.000000");
          expect(optionHeight).assertEqual("300.000000");
          console.info('ArkUX_Select_Visual_0030 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /*
     *@tc.number ArkUX_Select_Visual_0040
     *@tc.name   Support modifying the select optionWidth and optionHeight change of Select component
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to 400
     */
    it('ArkUX_Select_Visual_0040', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0040 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Select_Visual_0040');
          console.info('ArkUX_Select_Visual_0040 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Select_Visual_0040 obj is: " + JSON.stringify(obj));
          let optionWidth: ESObject = obj.$attrs.optionWidth;
          let optionHeight: ESObject = obj.$attrs.optionHeight;
          expect(optionWidth).assertEqual("600.000000");
          expect(optionHeight).assertEqual("600.000000");
          console.info('ArkUX_Select_Visual_0040 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /*
     *@tc.number ArkUX_Select_Visual_0050
     *@tc.name   Support modifying the select optionWidth and optionHeight change of Select component
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to FIT_TRIGGER and 600
     */
    it('ArkUX_Select_Visual_0050', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0050 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Select_Visual_0050');
          console.info('ArkUX_Select_Visual_0050 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Select_Visual_0050 obj is: " + JSON.stringify(obj));
          let optionWidth: ESObject = obj.$attrs.optionWidth;
          let optionHeight: ESObject = obj.$attrs.optionHeight;
          expect(optionWidth).assertEqual("900.000000");
          expect(optionHeight).assertEqual("900.000000");
          console.info('ArkUX_Select_Visual_0050 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /*
     *@tc.number ArkUX_Select_Visual_0060
     *@tc.name   Support modifying the select optionWidth and optionHeight change of Select component
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to FIT_CONTENT and 600
     */
    it('ArkUX_Select_Visual_0060', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0060 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Select_Visual_0060');
          console.info('ArkUX_Select_Visual_0060 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Select_Visual_0060 obj is: " + JSON.stringify(obj));
          let optionWidth: ESObject = obj.$attrs.optionWidth;
          let optionHeight: ESObject = obj.$attrs.optionHeight;
          expect(optionWidth).assertEqual("1200.000000");
          expect(optionHeight).assertEqual("1200.000000");
          console.info('ArkUX_Select_Visual_0060 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /*
     *@tc.number ArkUX_Select_Visual_0070
     *@tc.name   Support modifying the select optionWidth and optionHeight change of Select component
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to default value
     */
    it('ArkUX_Select_Visual_0070', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0070 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Select_Visual_0070');
          console.info('ArkUX_Select_Visual_0070 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Select_Visual_0070 obj is: " + JSON.stringify(obj));
          let optionWidth: ESObject = obj.$attrs.optionWidth;
          let optionHeight: ESObject = obj.$attrs.optionHeight;
          expect(optionWidth).assertEqual("1500.000000");
          expect(optionHeight).assertEqual("1500.000000");
          console.info('ArkUX_Select_Visual_0070 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

  })
}