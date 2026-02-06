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
  });
}

export default function ButtonJsunit2() {


  describe('ButtonJsunit2', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/Button',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Button state success " + JSON.stringify(pages));
        if (!("Button" == pages.name)) {
          console.info("get Button state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Button page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Button page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Button after each called");
    });

    /**
     * @tc.name   buttonGetInspectorByKey010
     * @tc.number SUB_ACE_BASIC_ETS_API_0640
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonGetInspectorByKey010', Level.LEVEL1, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('button');
      let obj: ESObject = JSON.parse(strJson);
      console.info("buttonGetInspectorByKey010 obj is: " + JSON.stringify(obj));
      console.info("buttonGetInspectorByKey010 obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.type).assertEqual('ButtonType.Circle');
      expect(obj.$attrs.stateEffect).assertEqual('true');
      expect(obj.$attrs.label).assertEqual('1.value');
      expect(obj.$attrs.fontSize).assertEqual('12.00px');
      console.info('cd buttonInspectorByKey END');
      done();
    });
    /**
     * @tc.name   ButtonGetInspectorByKey020
     * @tc.number SUB_ACE_BASIC_ETS_API_0650
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ButtonGetInspectorByKey020', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('button1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd button1 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      expect(obj.$attrs.stateEffect).assertEqual('false');
      console.info('cd button1InspectorByKey END');
      done();
    });

    /**
     * @tc.name   ButtonGetInspectorByKey030
     * @tc.number SUB_ACE_BASIC_ETS_API_0660
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ButtonGetInspectorByKey030', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('button2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd button2 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal');
      console.info('cd button2InspectorByKey END');
      done();
    });
  })
}
