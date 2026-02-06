/*
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

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function appStorageJsunit() {


  describe('appStorageTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AppStorage/AppStorage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AppStorage state success " + JSON.stringify(pages));
        if (!("AppStorage" == pages.name)) {
          console.info("get AppStorage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AppStorage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AppStorage page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("AppStorage after each called");
    });


    /**
     * @tc.name   appStorageTest001
     * @tc.number SUB_ACE_BASIC_ETS_API_0130
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest001', Level.LEVEL0, async () => {
      console.info('AppStorageTest001 START');
      await sleep(1)
      let strJson = getInspectorByKey('Button0_1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      console.log(JSON.stringify(obj.$type))
      console.info("yr AppStorage0 type: " + JSON.stringify(obj.$type));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('20');
      console.log("yr AppStorage0 label-'47'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorage0 END');
    });

    /**
     * @tc.name   appStorageTest002
     * @tc.number SUB_ACE_BASIC_ETS_API_0140
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest002', Level.LEVEL0, async () => {
      console.info('AppStorageTest002 START');
      let strJson = getInspectorByKey('Button0_2');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('20');
      console.log("yr AppStorage1 label-'47'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest002 END');
    });

    /**
     * @tc.name   appStorageTest003
     * @tc.number SUB_ACE_BASIC_ETS_API_0150
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest003', Level.LEVEL0, async () => {
      console.info('AppStorageTest003 START');
      let strJson = getInspectorByKey('Button0_3');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('50');
      console.log("yr AppStorage2 label-'50'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest003 END');
    });

    /**
     * @tc.name   appStorageTest004
     * @tc.number SUB_ACE_BASIC_ETS_API_0160
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest004', Level.LEVEL0, async () => {
      console.info('AppStorageTest004 START');
      let strJson = getInspectorByKey('Button0_4');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('47');
      console.log("yr AppStorage3 label-'47'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest004 END');
    });

    /**
     * @tc.name   appStorageTest005
     * @tc.number SUB_ACE_BASIC_ETS_API_0170
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest005', Level.LEVEL0, async () => {
      console.info('AppStorageTest005 START');
      let strJson = getInspectorByKey('Button0_5');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('true');
      console.log("yr AppStorage4 label-' '" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest005 END');
    });

    /**
     * @tc.name   appStorageTest006
     * @tc.number SUB_ACE_BASIC_ETS_API_0180
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest006', Level.LEVEL0, async () => {
      console.info('AppStorageTest006 START');
      let strJson = getInspectorByKey('Button0_6');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('PropB');
      console.log("yr AppStorage5 label-'PropA'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest006 END');
    });


    /**
     * @tc.name   appStorageTest007
     * @tc.number SUB_ACE_BASIC_ETS_API_0190
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest007', Level.LEVEL0, async () => {
      console.info('AppStorageTest007 START');
      let strJson = getInspectorByKey('Button0_7');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('20');
      console.log("yr AppStorage6 label-'47'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest007 END');
    });

    /**
     * @tc.name   appStorageTest008
     * @tc.number SUB_ACE_BASIC_ETS_API_0100
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest008', Level.LEVEL0, async () => {
      console.info('AppStorageTest008 START');
      let strJson = getInspectorByKey('Button0_8');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('true');
      console.log("yr AppStorage7 label-'20'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest008 END');
    });

    /**
     * @tc.name   appStorageTest009
     * @tc.number SUB_ACE_BASIC_ETS_API_0210
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest009', Level.LEVEL0, async () => {
      console.info('AppStorageTest009 START');
      let strJson = getInspectorByKey('Button0_9');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('1');
      console.log("yr AppStorage8 label-'1'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest009 END');
    });

    /**
     * @tc.name   appStorageTest010
     * @tc.number SUB_ACE_BASIC_ETS_API_0220
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest010', Level.LEVEL0, async () => {
      console.info('AppStorageTest010 START');
      let strJson = getInspectorByKey('Button0_10');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('false');
      console.log("yr AppStorage9 label-' '" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest010 END');
    });

    /**
     * @tc.name   appStorageTest011
     * @tc.number SUB_ACE_BASIC_ETS_API_0230
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('appStorageTest011', Level.LEVEL0, async () => {
      console.info('AppStorageTest011 START');
      let strJson = getInspectorByKey('Button0_12');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.log("yr AppStorage11 label-'50'" + JSON.stringify(JSON.parse(strJson).$attrs.label))
      console.info('AppStorageTest011 END');
    });
  })
}
