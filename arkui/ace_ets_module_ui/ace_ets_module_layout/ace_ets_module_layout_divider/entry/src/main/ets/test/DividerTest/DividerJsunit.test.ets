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

export default function dividerJsunit() {
  describe('dividerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/Divider',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get divider state success " + JSON.stringify(pages));
        if (!("Divider" == pages.name)) {
          console.info("get divider state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push divider page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push divider page error " + JSON.stringify(err));
      }
      await sleep(1);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Divider after each called");
    });
    /**
     * @tc.name   testDividerGetInspectorByKey010
     * @tc.number SUB_ACE_BASIC_ETS_API_0750
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDividerGetInspectorByKey010',  Level.LEVEL0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('divider');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd divider component obj is: " + JSON.stringify(obj));
      console.log("cd divider type" + JSON.stringify(obj.$type));
      console.log("cd divider color" + JSON.stringify(obj.$attrs.color));
      expect(obj.$type).assertEqual('Divider')
      expect(obj.$attrs.color).assertEqual('#FFFF0000')
      console.info(" divider component obj is: " + JSON.stringify(obj));
      console.log("cd divider strokeWidth" + JSON.stringify(obj.$attrs.strokeWidth));
      console.log("cd divider vertical" + JSON.stringify(obj.$attrs.vertical));
      console.log("cd divider lineCap" + JSON.stringify(obj.$attrs.lineCap));
      expect(obj.$attrs.strokeWidth).assertEqual("7.00vp")
      expect(obj.$attrs.vertical).assertEqual('true')
      expect(obj.$attrs.lineCap).assertEqual('BUTT');
      console.info('cd dividerInspectorByKey END');
      done();
    });

    /**
     * @tc.name   testDividerGetInspectorByKey020
     * @tc.number SUB_ACE_BASIC_ETS_API_0760
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDividerGetInspectorByKey020',  Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('divider1');
      let obj: ESObject = JSON.parse(strJson);
      console.info(" divider1 component obj is: " + JSON.stringify(obj));
      console.log("cd divider1 vertical" + JSON.stringify(obj.$attrs.vertical));
      console.log("cd divider1 lineCap" + JSON.stringify(obj.$attrs.lineCap));
      expect(obj.$attrs.vertical).assertEqual('false');
      expect(obj.$attrs.lineCap).assertEqual('ROUND');
      console.info('cd divider1InspectorByKey END');
      done();
    });
    /**
     * @tc.name   testDividerGetInspectorByKey030
     * @tc.number SUB_ACE_BASIC_ETS_API_0770
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDividerGetInspectorByKey030',  Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('divider2');
      let obj: ESObject = JSON.parse(strJson);
      console.info(" divider2 component obj is: " + JSON.stringify(obj));
      console.log("cd divider2 lineCap" + JSON.stringify(obj.$attrs.lineCap));
      expect(obj.$attrs.lineCap).assertEqual('SQUARE');
      console.info('cd divider2InspectorByKey END');
      done();
    });
  })
}
