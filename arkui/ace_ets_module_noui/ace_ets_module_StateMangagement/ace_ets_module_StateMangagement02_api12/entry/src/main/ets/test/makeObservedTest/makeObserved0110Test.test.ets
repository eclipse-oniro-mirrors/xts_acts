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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function makeObserved0110Test() {
  describe('makeObserved0110Test', () => {
    beforeEach(async (done: Function) => {
      console.info("makeObserved0110Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/makeObserved/makeObserved0110',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get makeObserved0110Test state pages: " + JSON.stringify(pages));
        if (!("makeObserved0110" == pages.name)) {
          console.info("get makeObserved0110Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push makeObserved0110Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push makeObserved0110Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   makeObserved0110Test_01
     * @tc.number makeObserved0110Test_01
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('makeObserved0110Test_01', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)

      console.info('makeObserved0110Test_01 START');

      let driver = await Driver.create()
      let testArr: testType[] = [
        {
          buttonKey: 'buttonTest',
          key: 'buttonTest',
          value: '#FF000000'
        },
      ]
      for (const item of testArr) {
        let button = await driver.findComponent(ON.id(item.buttonKey));
        await button.click();
        await CommonFunc.sleep(1000)
        let textJson = getInspectorByKey(item.key)
        let textJsonObj: ESObject = JSON.parse(textJson);
        console.info("MR031[makeObserved0110Test_01]: " + item.key + ' : ' + item.value);
        console.info("MR031[makeObserved0110Test_01]: " + JSON.stringify(textJsonObj.$attrs.backgroundColor));

        for (const element of Object.keys(textJsonObj.$attrs)) {
          // console.info("MR031[makeObserved0110Test_01]: " + element );

        }
        expect(textJsonObj.$attrs.backgroundColor).assertEqual(item.value);
      }
      console.info('makeObserved0110Test_01 END');
      done()
    })
  })
}

interface testType {
  buttonKey: string,
  key: string,
  value: string
}

