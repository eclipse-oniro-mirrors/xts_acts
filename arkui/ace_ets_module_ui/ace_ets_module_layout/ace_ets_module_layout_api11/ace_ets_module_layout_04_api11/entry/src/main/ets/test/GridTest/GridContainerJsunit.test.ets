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

export default function gridContainerJsunit() {


  describe('gridContainerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridContainer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridContainer state success " + JSON.stringify(pages));
        if (!("GridContainer" == pages.name)) {
          console.info("get GridContainer state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push GridContainer page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridContainer page error " + JSON.stringify(err));
      }
      await sleep(1);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("GridContainer after each called");
    });
    /**
     * @tc.name   testGridContainer010
     * @tc.number SUB_ACE_BASIC_ETS_API_0830
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridContainer010',  Level.LEVEL0, async (done: Function) => {
      console.info('new GridContainer0 START');
      let strJson = getInspectorByKey('gridContainer');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('GridContainer');
      console.info("yr GridContainer0 type: " + JSON.stringify(obj.$type));
      console.log("yr gridContainer0 obj.$attrs.alignItems-'HorizontalAlign.Start':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new GridContainer0 END');
      done();
    });

    /**
     * @tc.name   testGridContainer020
     * @tc.number SUB_ACE_BASIC_ETS_API_0840
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridContainer020',  Level.LEVEL0, async (done: Function) => {
      console.info('new GridContainer1 START');
      let strJson = getInspectorByKey('gridContainer1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.log("yr gridContainer1 obj.$attrs.alignItems-'HorizontalAlign.Center':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new GridContainer1 END');
      done();
    });

    /**
     * @tc.name   testGridContainer030
     * @tc.number SUB_ACE_BASIC_ETS_API_0850
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridContainer030',  Level.LEVEL0, async (done: Function) => {
      console.info('new GridContainer2 START');
      let strJson = getInspectorByKey('gridContainer2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.End');
      console.log("yr gridContainer obj.$attrs.alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new GridContainer2 END');
      done();
    });

    /**
     * @tc.name   testGridContainer040
     * @tc.number SUB_ACE_BASIC_ETS_API_0860
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridContainer040',  Level.LEVEL0, async (done: Function) => {
      console.info('new GridContainer3 START');
      let strJson = getInspectorByKey('gridContainer3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.End');
      console.log("yr gridContainer3 obj.$attrs.alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new GridContainer3  END');
      done();
    });

    /**
     * @tc.name   testGridContainer050
     * @tc.number SUB_ACE_BASIC_ETS_API_0870
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridContainer050',  Level.LEVEL0, async (done: Function) => {
      console.info('new GridContainer4 START');
      let strJson = getInspectorByKey('gridContainer4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("gridContainer obj.$attrs.sizeType:" + JSON.stringify(obj.$attrs.sizeType)); //undefinde
      console.info('new GridContainer4  END');
      done();
    });
  })
}
