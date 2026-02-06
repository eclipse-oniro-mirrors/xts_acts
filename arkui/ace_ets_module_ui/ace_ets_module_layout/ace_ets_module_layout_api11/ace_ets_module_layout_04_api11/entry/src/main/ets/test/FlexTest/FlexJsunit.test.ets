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

export default function flexJsunit() {
  describe('flexTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Flex',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Flex state success " + JSON.stringify(pages));
        if (!("Flex" == pages.name)) {
          console.info("get Flex state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Flex page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Flex after each called");
    });
    /**
     * @tc.name   testFlex010
     * @tc.number SUB_ACE_BASIC_ETS_API_0770
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex010',  Level.LEVEL0, async (done: Function) => {
      console.info('new Flex0 START');
      let strJson = getInspectorByKey('flex');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Flex');
      console.info("yr Flex0 type: " + JSON.stringify(obj.$type));
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Column');
      console.log("yr flex0 obj.$attrs.constructor.direction-'FlexDirection.Column':" + JSON.stringify(obj.$attrs.constructor.direction));
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      console.log("yr flex0 obj.$attrs.constructor.wrap-'FlexWrap.NoWrap':" + JSON.stringify(obj.$attrs.constructor.wrap));
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      console.log("yr flex0 obj.$attrs.constructor.alignItems-'FlexWrap.NoWrap':" + JSON.stringify(obj.$attrs.constructor.alignItems));
      console.log("yr flex0 obj.$attrs.constructor.justifyContent-'FlexAlign.Center':" + JSON.stringify(obj.$attrs.constructor.justifyContent));
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      console.log("yr flex0 obj.$attrs.constructor.alignContent-'FlexAlign.Start':" + JSON.stringify(obj.$attrs.constructor.alignContent));
      console.info('new Flex0 END');
      done();
    });

    /**
     * @tc.name   testFlex020
     * @tc.number SUB_ACE_BASIC_ETS_API_0780
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex020',  Level.LEVEL0, async (done: Function) => {
      console.info('new Flex1 START');
      let strJson = getInspectorByKey('flex1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      console.log("yr flex1 direction-'FlexDirection.Row':" + JSON.stringify(obj.$attrs.constructor.direction));
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      console.log("yr flex1 wrap-'FlexWrap.Wrap':" + JSON.stringify(obj.$attrs.constructor.wrap));
      console.log("yr flex1 alignItems-'ItemAlign.Start':" + JSON.stringify(obj.$attrs.constructor.alignItems));
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      console.log("yr flex1 justifyContent-'FlexAlign.Start':" + JSON.stringify(obj.$attrs.constructor.justifyContent));
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");
      console.log("yr flex1 obj.$attrs.constructor.alignContent-'FlexAlign.Center':" + JSON.stringify(obj.$attrs.constructor.alignContent));
      console.info('new Flex1 END');
      done();
    });

    /**
     * @tc.name   testFlex030
     * @tc.number SUB_ACE_BASIC_ETS_API_0790
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex030',  Level.LEVEL0, async (done: Function) => {
      console.info('new Flex2 START');
      let strJson = getInspectorByKey('flex2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.RowReverse');
      console.log("yr flex2 direction-'FlexDirection.RowReverse':" + JSON.stringify(obj.$attrs.constructor.direction));
      console.log("yr flex1 alignItems-'ItemAlign.Start':" + JSON.stringify(obj.$attrs.constructor.alignItems));
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      console.log("yr flex2 justifyContent-'FlexAlign.End':" + JSON.stringify(obj.$attrs.constructor.justifyContent));
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.End");
      console.log("yr flex2 alignContent-'FlexAlign.End':" + JSON.stringify(obj.$attrs.constructor.alignContent));
      console.info('new Flex2 END');
      done();
    });

    /**
     * @tc.name   testFlex040
     * @tc.number SUB_ACE_BASIC_ETS_API_0800
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex040',  Level.LEVEL0, async (done: Function) => {
      console.info('new Flex3 START');
      let strJson = getInspectorByKey('flex3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("yr flex3 direction-'FlexDirection.ColumnReverse':" + JSON.stringify(obj.$attrs.constructor.direction));
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      console.log("yr flex3 justifyContent-'FlexAlign.SpaceBetween':" + JSON.stringify(obj.$attrs.constructor.justifyContent));
      console.info('new Flex3 END');
      done();
    });

    /**
     * @tc.name   testFlex050
     * @tc.number SUB_ACE_BASIC_ETS_API_0810
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex050',  Level.LEVEL0, async (done: Function) => {
      console.info('new Flex4 START');
      let strJson = getInspectorByKey('flex4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      console.log("yr flex4 obj.$attrs.justifyContent-'FlexAlign.SpaceEvenly':" + JSON.stringify(obj.$attrs.constructor.justifyContent));
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");
      console.log("yr flex4 obj.$attrs.constructor.alignContent-'FlexAlign.SpaceEvenly':" + JSON.stringify(obj.$attrs.constructor.alignContent));
      console.info('new Flex4 END');
      done();
    });

    /**
     * @tc.name   testFlex060
     * @tc.number SUB_ACE_BASIC_ETS_API_0820
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex060',  Level.LEVEL0, async (done: Function) => {
      console.info('new Flex5 START');
      let strJson = getInspectorByKey('flex5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      console.log("yr flex5 obj.$attrs.constructor.justifyContent-'FlexAlign.SpaceAround':" + JSON.stringify(obj.$attrs.constructor.justifyContent));
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceAround");
      console.log("yr flex5 obj.$attrs.constructor.alignContent-'FlexAlign.SpaceAround':" + JSON.stringify(obj.$attrs.constructor.alignContent));
      console.info('testGetInspectorByKey END');
      done();
    });
  })
}
