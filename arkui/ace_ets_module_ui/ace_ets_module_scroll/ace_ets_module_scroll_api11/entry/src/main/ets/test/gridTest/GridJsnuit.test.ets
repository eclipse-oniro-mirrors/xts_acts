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

export default function gridJsunit1() {

  describe('gridTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/Grid',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Grid state success " + JSON.stringify(pages));
        if (!("Grid" == pages.name)) {
          console.info("get Grid state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Grid after each called");
    });

    /**
     * @tc.name   gridTest001
     * @tc.number SUB_ACE_BASIC_ETS_API_0350
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridTest001', Level.LEVEL1, async () => {
      console.info('gridTest001 START');
      await sleep(1)
      let strJson = getInspectorByKey('Grid');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("属性值集合: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Grid')
      console.log(JSON.stringify(JSON.parse(strJson).$attrs.columnsTemplate))
      console.log(JSON.stringify(JSON.parse(strJson).$attrs.rowsTemplate))
      console.log(JSON.stringify(JSON.parse(strJson).$attrs.rowsTemplate))
      console.log(JSON.stringify(JSON.parse(strJson).$attrs.columnsGap))
      console.log(JSON.stringify(JSON.parse(strJson).$attrs.rowsGap))
      await sleep(1)
      expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual('1fr 1fr 1fr 1fr 1fr')
      expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual('1fr 1fr 1fr 1fr 1fr')
      console.info('gridTest001 END');
    });
  }

  )
}
