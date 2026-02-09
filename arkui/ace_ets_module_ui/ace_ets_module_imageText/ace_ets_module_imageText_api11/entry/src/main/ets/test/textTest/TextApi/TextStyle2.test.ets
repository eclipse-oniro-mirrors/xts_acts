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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../../MainAbility/common/Common'

export default function TextStyle2() {
  describe('TextStyle2', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextApi/TextStyle2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyle state pages:" + JSON.stringify(pages));
        if (!("TextStyle2" == pages.name)) {
          console.info("get TextStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyle page error:" + err);
      }
      console.info("TextStyle beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyle after each called");
    });


    /**
     * @tc.name   TextStyle_0001
     * @tc.number TextStyle_0001
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextStyle_0001', Level.LEVEL1, async (done: Function) => {

      console.info('[TextStyle_0001] START');
      await CommonFunc.sleep(2000);
      let text1 = getInspectorByKey('buttonStyle');
      expect(JSON.parse(text1).$attrs.buttonStyle).assertEqual('ButtonStyleMode.EMPHASIZED');
      console.info('[TextStyle_0001] END');
      done();
    });
  })
}
