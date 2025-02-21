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

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

export default function DialogTest() {
  describe('DialogTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done()
    });

    /*
     *@tc.number ArkUX_Dialog_Visual_0060
     *@tc.name   Support modifying the change of Dialog component
     *@tc.desc   Sets the Dialog property parameter to default value
     */
    it('ArkUX_Dialog_Visual_0060', 0, async function (done) {
      console.info('ArkUX_Dialog_Visual_0060 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Dialog_Visual_0060');
          console.info('ArkUX_Dialog_Visual_0060 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Dialog_Visual_0060 obj is: " + JSON.stringify(obj));
          let fontSize = obj.$attrs.fontSize
          expect(fontSize).assertEqual("20.00fp");
          console.info('ArkUX_Dialog_Visual_0060 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Dialog_Visual_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}