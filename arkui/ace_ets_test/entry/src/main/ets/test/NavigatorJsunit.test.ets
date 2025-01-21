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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function navigatorJsunit() {


  describe('navigatorTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigator',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Navigator state success " + JSON.stringify(pages));
        if (!("Navigator" == pages.name)) {
          console.info("get Navigator state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Navigator page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Navigator page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Navigator after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0420
     * @tc.name navigatorTest001
     * @tc.desc aceEtsTest
     */
    it('navigatorTest001', 0, async () => {
      console.info('++++++++++++++++ Navigator TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('navigator');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Navigator')
      console.log('Navigator‘s target is ' + JSON.stringify(JSON.parse(strJson).$attrs.target))
      console.log('Navigator‘s type is ' + JSON.stringify(JSON.parse(strJson).$attrs.type))
      console.log('Navigator‘s active is ' + JSON.stringify(JSON.parse(strJson).$attrs.active))
      console.log('Navigator‘s params is ' + JSON.stringify(JSON.parse(strJson).$attrs.params))
      expect(JSON.parse(strJson).$attrs.target).assertEqual('pages/index')
      expect(JSON.parse(strJson).$attrs.type).assertEqual('NavigationType.Back')
      expect(JSON.parse(strJson).$attrs.active).assertEqual('false')
      expect(JSON.parse(strJson).$attrs.params).assertEqual(JSON.stringify({
        data: 24
      }))
      console.info('++++++++++++++++ Navigator TestCase 1 End ++++++++++++++++');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0430
     * @tc.name navigatorTest002
     * @tc.desc aceEtsTest
     */
    it('navigatorTest002', 0, async () => {
      console.info('++++++++++++++++ Navigator TestCase 2 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('navigator2');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Navigator')
      console.log('Navigator‘s type is ' + JSON.stringify(JSON.parse(strJson).$attrs.type))
      expect(JSON.parse(strJson).$attrs.type).assertEqual('NavigationType.Push')
      console.info('++++++++++++++++ Navigator TestCase 2 End ++++++++++++++++');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0440
     * @tc.name navigatorTest003
     * @tc.desc aceEtsTest
     */
    it('navigatorTest003', 0, async () => {
      console.info('++++++++++++++++ Navigator TestCase 3 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('navigator3');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Navigator')
      console.log('Navigator‘s type is ' + JSON.stringify(JSON.parse(strJson).$attrs.type))
      expect(JSON.parse(strJson).$attrs.type).assertEqual('NavigationType.Replace')
      console.info('++++++++++++++++ Navigator TestCase 3 End ++++++++++++++++');
    });
  })
}
