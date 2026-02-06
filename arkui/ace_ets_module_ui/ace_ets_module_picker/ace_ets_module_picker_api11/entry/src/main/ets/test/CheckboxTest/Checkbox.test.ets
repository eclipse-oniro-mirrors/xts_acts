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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function CheckboxTest() {
  describe('CheckboxTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Checkbox/CheckboxTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("CheckboxTest" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUX_CheckBox_Visual_0110
     * @tc.number ArkUX_CheckBox_Visual_0110
     * @tc.desc   Sets the shape property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_CheckBox_Visual_0110', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_CheckBox_Visual_0110 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_CheckBox_Visual_0110');
          console.info('ArkUX_CheckBox_Visual_0110 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_CheckBox_Visual_0110 obj is: " + JSON.stringify(obj));
          let shape: ESObject = obj.$attrs.shape;
          expect(shape).assertEqual("0");
          console.info('ArkUX_CheckBox_Visual_0110 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /**
     * @tc.name   ArkUX_CheckBox_Visual_0120
     * @tc.number ArkUX_CheckBox_Visual_0120
     * @tc.desc   Sets the shape property parameter to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_CheckBox_Visual_0120', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_CheckBox_Visual_0120 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_CheckBox_Visual_0120');
          console.info('ArkUX_CheckBox_Visual_0120 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_CheckBox_Visual_0120 obj is: " + JSON.stringify(obj));
          let shape: ESObject = obj.$attrs.shape;
          expect(shape).assertEqual("1");
          console.info('ArkUX_CheckBox_Visual_0120 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /**
     * @tc.name   ArkUX_CheckBox_Visual_0130
     * @tc.number ArkUX_CheckBox_Visual_0130
     * @tc.desc   Sets the shape property parameter to default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_CheckBox_Visual_0130', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_CheckBox_Visual_0130 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_CheckBox_Visual_0130');
          console.info('ArkUX_CheckBox_Visual_0130 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_CheckBox_Visual_0130 obj is: " + JSON.stringify(obj));
          let shape: ESObject = obj.$attrs.shape;
          expect(shape).assertEqual("0");
          console.info('ArkUX_CheckBox_Visual_0130 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

  })
}