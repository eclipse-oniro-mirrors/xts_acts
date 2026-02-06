/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function TextStyleTest() {
  describe('TextStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextStyleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextStyleTest" == pages.name)) {
          console.info("get TextStyleTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextStyleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyleTest page error:" + err);
      }
      console.info("TextStyleTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyleTest after each called");
    });

    /**
     * @tc.name   TextStyle_0005
     * @tc.number TextStyle_0005
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextStyle_0005', Level.LEVEL1, async (done: Function) => {

      console.info('[TextStyle_0005] START');
      await CommonFunc.sleep(2000);
      let text1 = getInspectorByKey('TextKeyAllNUMBER8898888888');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.ellipsisMode).assertEqual('EllipsisMode.START');

      console.info('[TextStyle_0005] END');
      done();
    });

    /**
     * @tc.name   TextStyle_0008
     * @tc.number TextStyle_0008
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextStyle_0008', Level.LEVEL1, async (done: Function) => {
      console.info('[TextStyle_0008] START');
      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('buttonSelect'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let text1 = getInspectorByKey('selectionStart');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('10');

      let text2 = getInspectorByKey('selectionEnd');
      let Obj2: ESObject = JSON.parse(text2);
      expect(Obj2.$attrs.content).assertEqual('30');

      console.info('[TextStyle_0008] END');
      done();
    });

  })
}
