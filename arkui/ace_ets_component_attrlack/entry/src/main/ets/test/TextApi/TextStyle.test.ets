/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from '../Utils'

export default function TextStyle() {
  describe('TextStyle', function () {
    beforeEach(async function (done) {
      console.info("TextStyle beforeEach start");
      let options = {
        url: 'MainAbility/pages/TextApi/TextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyle state pages:" + JSON.stringify(pages));
        if (!("TextStyle" == pages.name)) {
          console.info("get TextStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push TextStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyle page error:" + err);
      }
      console.info("TextStyle beforeEach end");
      done();
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("TextStyle after each called");
    });



    /**
     * @tc.number    TextStyle_0001
     * @tc.name      TextStyle_0001
     * @tc.desc      set api
     * @tc.level       Level 1
     * @tc.type
    * @tc.size
     */
    it('TextStyle_0001', 0, async function (done) {

      console.info('[TextStyle_0001] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('buttonStyle');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.buttonStyle).assertEqual('ButtonStyleMode.EMPHASIZED');

      console.info('[TextStyle_0001] END');
      done();
    });






  })
}
