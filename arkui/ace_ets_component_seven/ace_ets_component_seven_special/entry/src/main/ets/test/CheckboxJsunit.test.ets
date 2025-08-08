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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';

export default function checkboxJsunit() {
  describe('checkboxJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("checkboxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBox state pages: " + JSON.stringify(pages));
        if (!("checkBox" == pages.name)) {
          console.info("get checkBox state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push checkBox page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBox page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ArkUX_Stage_Checkbox_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Checkbox_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          console.info("ArkUX_Stage_Checkbox_0100 component strJson is: " + strJson);
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_0100 component obj is: " + JSON.stringify(obj));
          expect(JSON.parse(obj.$attrs.mark).size).assertEqual('50.00vp');
          console.info('ArkUX_Stage_Checkbox_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number ArkUX_Stage_Checkbox_0400
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Checkbox_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_0400 component obj is: " + JSON.stringify(obj));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /**
     * @tc.number ArkUX_Stage_Checkbox_0300
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Checkbox_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_0300 component obj is: " + JSON.stringify(obj));

          expect(obj.$attrs.select).assertEqual("false");

          console.info('ArkUX_Stage_Checkbox_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number ArkUX_Stage_Checkbox_attrs_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Checkbox_attrs_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_attrs_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Checkbox_attrs_0200 component obj is: " + JSON.stringify(obj));
          expect(obj.$attrs.selectedColor).assertEqual("#FFED6F21");
          console.info('ArkUX_Stage_Checkbox_attrs_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_attrs_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}
