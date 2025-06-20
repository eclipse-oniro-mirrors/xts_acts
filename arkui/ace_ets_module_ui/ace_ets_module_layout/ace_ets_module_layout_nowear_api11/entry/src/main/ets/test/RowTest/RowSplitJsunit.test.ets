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


import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
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


export default function rowSplitJsunit() {

  describe('RowSplitTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowSplit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowSplit state success " + JSON.stringify(pages));
        if (!("RowSplit" == pages.name)) {
          console.info("get RowSplit state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push RowSplit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowSplit page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("RowSplit after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1010
     * @tc.name testRowSplitGetInspectorByKey010
     * @tc.desc aceEtsTest
     */
    it('testRowSplitGetInspectorByKey010',  Level.LEVEL0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('rowSplit');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd rowSplit component obj is: " + JSON.stringify(obj));
      console.log("cd rowSplit type" + JSON.stringify(obj.$type));
      console.log("cd rowSplit  resizeable" + JSON.stringify(obj.$attrs.resizeable));
      expect(obj.$type).assertEqual('RowSplit');
      expect(obj.$attrs.resizeable).assertEqual('false');
      console.info('cd RowSplitInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1020
     * @tc.name testRowSplitGetInspectorByKey020
     * @tc.desc aceEtsTest
     */
    it('testRowSplitGetInspectorByKey020',  Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('rowSplit1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd rowSplit1 component obj is: " + JSON.stringify(obj));
      console.log("cd rowSplit1  resizeable" + JSON.stringify(obj.$attrs.resizeable));
      expect(obj.$attrs.resizeable).assertEqual('true');
      console.info('cd RowSplit1InspectorByKey END');
      done();
    });
  })
}
