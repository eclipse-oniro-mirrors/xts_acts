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

export default function TextfieldSingleTest() {
  describe('TextfieldSingleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextfieldSingle',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextfieldSingle state success " + JSON.stringify(pages));
        if (!("TextfieldSingle" == pages.name)) {
          console.info("get TextfieldSingle state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push TextfieldSingle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextfieldSingle page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Text_Visual_0040
     * @tc.number ArkUX_Text_Visual_0040
     * @tc.desc   Sets the selectAll property parameter to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0040', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0040 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0040');
          console.info('ArkUX_Text_Visual_0040 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0040 obj is: " + JSON.stringify(obj));
          let selectAll: ESObject = obj.$attrs.selectAll;
          expect(selectAll).assertEqual(true);
          console.info('ArkUX_Text_Visual_0040 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /**
     * @tc.name   ArkUX_Text_Visual_0050
     * @tc.number ArkUX_Text_Visual_0050
     * @tc.desc   Sets the selectAll property parameter to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0050', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0050 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0050');
          console.info('ArkUX_Text_Visual_0050 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0050 obj is: " + JSON.stringify(obj));
          let selectAll: ESObject = obj.$attrs.selectAll;
          expect(selectAll).assertEqual(false);
          console.info('ArkUX_Text_Visual_0050 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /**
     * @tc.name   ArkUX_Text_Visual_0060
     * @tc.number ArkUX_Text_Visual_0060
     * @tc.desc   Sets the selectAll property parameter to default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0060', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0060 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0060');
          console.info('ArkUX_Text_Visual_0060 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0060 obj is: " + JSON.stringify(obj));
          let selectAll: ESObject = obj.$attrs.selectAll;
          expect(selectAll).assertEqual(false);
          console.info('ArkUX_Text_Visual_0060 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });
  })
}