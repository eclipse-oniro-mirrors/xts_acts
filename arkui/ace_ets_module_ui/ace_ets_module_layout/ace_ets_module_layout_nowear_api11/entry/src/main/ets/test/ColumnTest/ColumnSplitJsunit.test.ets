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

export default function columnSplitJsunit() {


  describe('columnSplitTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnSplit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnSplit state success " + JSON.stringify(pages));
        if (!("ColumnSplit" == pages.name)) {
          console.info("get ColumnSplit state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push ColumnSplit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSplit page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("ColumnSplit after each called");
    });

    /**
     * @tc.name   testColumnSplit010
     * @tc.number SUB_ACE_BASIC_ETS_API_0700
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnSplit010',  Level.LEVEL0, async (done: Function) => {
      console.info('new columnSplit0 START');
      let strJson = getInspectorByKey('columnSplit');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ColumnSplit');
      console.info("yr ColumnSplit0 type: " + JSON.stringify(obj.$type));
      console.log("yr columnSplit0 obj.$resizable-'true':" + JSON.stringify(obj.$attrs.resizable));
      expect(obj.$attrs.resizeable).assertEqual('true');
      console.info('new columnSplit0 END');
      done();
    })

    /**
     * @tc.name   testColumnSplit020
     * @tc.number SUB_ACE_BASIC_ETS_API_0710
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnSplit020',  Level.LEVEL0, async (done: Function) => {
      console.info('new columnSplit1 START');
      let strJson = getInspectorByKey('columnSplit1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("yr columnSplit obj.$resizable-'false':" + JSON.stringify(obj.$attrs.resizable));
      expect(obj.$attrs.resizeable).assertEqual('false');
      console.info('new columnSplit1 END');
      done();
    })
  })
}
