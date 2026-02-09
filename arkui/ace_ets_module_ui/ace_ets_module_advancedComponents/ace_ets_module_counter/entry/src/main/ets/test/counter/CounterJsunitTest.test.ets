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


import { afterEach, beforeEach, describe, expect,it, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function CounterJsunitTest() {


  describe('CounterJsunitTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/counter/CounterJsunitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CounterJsunitTest state success " + JSON.stringify(pages));
        if (!("CounterJsunitTest" == pages.name)) {
          console.info("get CounterJsunitTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push CounterJsunitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CounterJsunitTest page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("CounterJsunitTest after each called");
    });

    /**
     * @tc.name   testCounterGetInspectorByKey010
     * @tc.number SUB_ACE_BASIC_ETS_API_testCounterGetInspectorByKey010
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCounterGetInspectorByKey010', Level.LEVEL0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('counterCounterJsunitTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$type).assertEqual("Counter");
      console.info('testGetInspectorByKey END');
      done();
    });
  })
}
