/**
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

export default function panelJsunit() {


  describe('panelTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Panel/Panel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Panel state success " + JSON.stringify(pages));
        if (!("Panel" == pages.name)) {
          console.info("get Panel state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Panel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Panel page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Panel after each called");
    });
    /**
     * @tc.name   panelTest001
     * @tc.number SUB_ACE_BASIC_ETS_API_0440
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('panelTest001', Level.LEVEL2, async () => {
      console.info('++++++++++++++++ Panel TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('panel');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Panel')
      console.log('Panel‘s type is ' + JSON.stringify(JSON.parse(strJson).$attrs.type))
      console.log('Panel‘s mode is ' + JSON.stringify(JSON.parse(strJson).$attrs.mode))
      console.log('Panel‘s dragBar is ' + JSON.stringify(JSON.parse(strJson).$attrs.dragBar))
      console.log('Panel‘s fullHeight is ' + JSON.stringify(JSON.parse(strJson).$attrs.fullHeight))
      console.log('Panel‘s halfHeight is ' + JSON.stringify(JSON.parse(strJson).$attrs.halfHeight))
      console.log('Panel‘s miniHeight is ' + JSON.stringify(JSON.parse(strJson).$attrs.miniHeight))
      expect(JSON.parse(strJson).$attrs.type).assertEqual('PanelType.Foldable')
      expect(JSON.parse(strJson).$attrs.mode).assertEqual('PanelMode.Half')
      expect(JSON.parse(strJson).$attrs.dragBar).assertEqual('true')
      expect(JSON.parse(strJson).$attrs.fullHeight).assertEqual('500.00vp')
      expect(JSON.parse(strJson).$attrs.halfHeight).assertEqual('250.00vp')
      expect(JSON.parse(strJson).$attrs.miniHeight).assertEqual('100.00vp')
      console.info('++++++++++++++++ Panel TestCase 1 End ++++++++++++++++');
    });

    /**
     * @tc.name   panelTest002
     * @tc.number SUB_ACE_BASIC_ETS_API_0450
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('panelTest002', Level.LEVEL2, async () => {
      console.info('++++++++++++++++ Panel TestCase 2 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('panel2');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Panel')
      console.log('Panel‘s type is ' + JSON.stringify(JSON.parse(strJson).$attrs.type))
      console.log('Panel‘s mode is ' + JSON.stringify(JSON.parse(strJson).$attrs.mode))
      console.log('Panel‘s show is ' + JSON.stringify(JSON.parse(strJson).$attrs.show))
      expect(JSON.parse(strJson).$attrs.type).assertEqual('PanelType.Minibar')
      expect(JSON.parse(strJson).$attrs.mode).assertEqual('PanelMode.Mini')
      expect(JSON.parse(strJson).$attrs.show).assertEqual('true')
      console.info('++++++++++++++++ Panel TestCase 2 End ++++++++++++++++');
    });

    /**
     * @tc.name   panelTest003
     * @tc.number SUB_ACE_BASIC_ETS_API_0460
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('panelTest003', Level.LEVEL2, async () => {
      console.info('++++++++++++++++ Panel TestCase 3 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('panel3');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Panel')
      console.log('Panel‘s type is ' + JSON.stringify(JSON.parse(strJson).$attrs.type))
      console.log('Panel‘s mode is ' + JSON.stringify(JSON.parse(strJson).$attrs.mode))
      console.log('Panel‘s show is ' + JSON.stringify(JSON.parse(strJson).$attrs.show))
      expect(JSON.parse(strJson).$attrs.type).assertEqual('PanelType.Temporary')
      expect(JSON.parse(strJson).$attrs.mode).assertEqual('PanelMode.Full')
      expect(JSON.parse(strJson).$attrs.show).assertEqual('false')
      console.info('++++++++++++++++ Panel TestCase 3 End ++++++++++++++++');
    });
  })
}
