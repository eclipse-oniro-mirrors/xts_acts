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

export default function tabJsunit() {


  describe('tabTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/Tab',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Tab state success " + JSON.stringify(pages));
        if (!("Tab" == pages.name)) {
          console.info("get Tab state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Tab page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tab page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Tab after each called");
    });

    /**
     * @tc.name   tabTest001
     * @tc.number SUB_ACE_BASIC_ETS_API_0510
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabTest001', Level.LEVEL1, async () => {
      console.info('++++++++++++++++ Tab TestCase 1 START ++++++++++++++++');
      let strJson = getInspectorByKey('tab');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      console.log('obj.$attrs.scrollable' + typeof (JSON.parse(strJson).$attrs.scrollable))
      console.log('obj.$attrs.vertical' + typeof (JSON.parse(strJson).$attrs.vertical))
      expect(obj.$type).assertEqual('Tabs')
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual('BarPosition.Start')
      expect(JSON.parse(strJson).$attrs.index).assertEqual('1')
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('true')
      expect(JSON.parse(strJson).$attrs.scrollable).assertTrue()
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed')
      expect(Math.abs(Number(JSON.parse(strJson).$attrs.barWidth) - Number(70.000000.toFixed(6))) <=1 ).assertTrue();
      expect(Math.abs(Number(JSON.parse(strJson).$attrs.barHeight) - Number(150.000000.toFixed(6))) <=1 ).assertTrue();
      
      console.info('++++++++++++++++ Tab TestCase 1 End ++++++++++++++++');
    });

    /**
     * @tc.name   tabTest003
     * @tc.number SUB_ACE_BASIC_ETS_API_0530
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabTest003', Level.LEVEL1, async () => {
      console.info('++++++++++++++++ Tab TestCase 3 START ++++++++++++++++');
      let strJson = getInspectorByKey('tab2');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Tabs')
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual('BarPosition.End')
      expect(JSON.parse(strJson).$attrs.barMode)
        .assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}')
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('false')
      expect(JSON.parse(strJson).$attrs.scrollable).assertFalse()
      console.info('++++++++++++++++ Tab TestCase 3 End ++++++++++++++++');
    });
  })
}
