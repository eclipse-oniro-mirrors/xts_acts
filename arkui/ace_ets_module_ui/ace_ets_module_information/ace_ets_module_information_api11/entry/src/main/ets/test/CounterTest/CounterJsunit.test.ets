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


import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
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

export default function counterJsunit() {


  describe('counterTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Counter/Counter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Counter state success " + JSON.stringify(pages));
        if (!("Counter" == pages.name)) {
          console.info("get Counter state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Counter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Counter page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Counter after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0720
     * @tc.name testCounterGetInspectorByKey010
     * @tc.desc aceEtsTest
     */
    it('testCounterGetInspectorByKey010', 0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('counter');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info('testGetInspectorByKey END');
      done();
    });
  })
}
