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


export default function makeObserved0020Test() {
  describe('makeObserved0020Test', () => {
    beforeEach(async (done: Function) => {
      console.info("makeObserved0020Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/makeObserved/makeObserved0020',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get makeObserved0020Test state pages: " + JSON.stringify(pages));
        if (!("makeObserved0020" == pages.name)) {
          console.info("get makeObserved0020Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push makeObserved0020Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push makeObserved0020Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   makeObserved0020Test_01
     * @tc.number makeObserved0020Test_01
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('makeObserved0020Test_01', Level.LEVEL1, async (done: Function) => {
      console.info('makeObserved0020Test_01 START');
      let testArr: testType[] = [
        {
          buttonKey: 'push',
          key: 'LastText',
          value: '30'
        },
        {
          buttonKey: 'pop',
          key: 'LastText',
          value: '2'
        },
        {
          buttonKey: 'shift',
          key: 'firstText',
          value: '2'
        },
        {
          buttonKey: 'unshift',
          key: 'firstText',
          value: '50'
        },
        {
          buttonKey: 'splice',
          key: 'LastText',
          value: '50'
        },
        {
          buttonKey: 'shrinkTo',
          key: 'firstText',
          value: '40'
        },
        {
          buttonKey: 'extendTo',
          key: 'LastText',
          value: '20'
        },
        {
          buttonKey: 'sort',
          key: 'firstText',
          value: '20'
        },
        {
          buttonKey: 'fill',
          key: 'firstText',
          value: '5'
        },
        {
          buttonKey: 'slice',
          key: 'LastText',
          value: '20'
        },
        {
          buttonKey: 'map',
          key: 'firstText',
          value: '35'
        },
        {
          buttonKey: 'filter',
          key: 'firstText',
          value: '50'
        },
        {
          buttonKey: 'concat',
          key: 'LastText',
          value: '100'
        }
      ]
      let driver = await Driver.create()
      for (const item of testArr) {
        let button = await driver.findComponent(ON.id(item.buttonKey));
        await button.click();
        await CommonFunc.sleep(1000);
        let textJson = getInspectorByKey(item.key)
        let textJsonObj: ESObject = JSON.parse(textJson);
        console.info("MR031[makeObserved0020Test_01]: " + item.key + ' : ' + item.value);
        expect(textJsonObj.$attrs.content).assertEqual(item.value);
      }
      console.info('makeObserved0020Test_01 END');
      done()
    })
  })
}

interface testType {
  buttonKey: string,
  key: string,
  value: string
}

