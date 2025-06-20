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

export default function scrollbarJsunit() {


  describe('scrollbarTest', () => {

    /**
     * run before testcase
     */
    beforeEach(async (done: Function) => {
      console.info('[scrollbarTest] before each called')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollBar/ScrollBar',
      }
      try {
        let pages = router.getState();
        console.info("[scrollbarTest] current page is: " + JSON.stringify(pages.name));
        if (!('ScrollBar' == pages.name)) {
          let result = await router.pushUrl(options);
          console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.info("push scrollBar page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[scrollbarTest] after each called');
      router.clear();
      await sleep(1);
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1340
     * @tc.name testScrollbar010
     * @tc.desc aceEtsTest
     */
    it('testScrollbar010', Level.LEVEL1, async (done: Function) => {
      console.info('testScrollbar010 START');
      let strJson = getInspectorByKey('scrollbar1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollbar1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ScrollBar');
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.$attrs.state).assertEqual('BarState.Auto');
      console.info('testScrollbar010 End');
      done();
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1350
     * @tc.name testScrollbar020
     * @tc.desc aceEtsTest
     */
    it('testScrollbar020', Level.LEVEL1, async (done: Function) => {
      console.info('testScrollbar020 START');
      let strJson = getInspectorByKey('scrollbar2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollbar2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ScrollBar');
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.$attrs.state).assertEqual('BarState.On');
      console.info('testScrollbar020 End');
      done();
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1360
     * @tc.name testScrollbar030
     * @tc.desc aceEtsTest
     */
    it('testScrollbar030', Level.LEVEL1, async (done: Function) => {
      console.info('testScrollbar030 START');
      let strJson = getInspectorByKey('scrollbar3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollbar3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ScrollBar')
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical')
      expect(obj.$attrs.state).assertEqual('BarState.Off')
      console.info('testScrollbar030 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1370
     * @tc.name testScrollbar040
     * @tc.desc aceEtsTest
     */
    it('testScrollbar040', Level.LEVEL1, async (done: Function) => {
      console.info('testScrollbar040 START');
      let strJson = getInspectorByKey('scrollbar4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollbar4] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ScrollBar')
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.$attrs.state).assertEqual('BarState.Auto')
      console.info('testScrollbar040 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1380
     * @tc.name testScrollbar050
     * @tc.desc aceEtsTest
     */
    it('testScrollbar050', Level.LEVEL1, async (done: Function) => {
      console.info('testScrollbar050 START');
      let strJson = getInspectorByKey('scrollbar5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollbar5] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ScrollBar')
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.$attrs.state).assertEqual('BarState.On')
      console.info('testScrollbar050 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1390
     * @tc.name testScrollbar060
     * @tc.desc aceEtsTest
     */
    it('testScrollbar060', Level.LEVEL1, async (done: Function) => {
      console.info('testScrollbar060 START');
      let strJson = getInspectorByKey('scrollbar6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollbar6] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ScrollBar')
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.$attrs.state).assertEqual('BarState.Off')
      console.info('testScrollbar060 End');
      done();
    });
  })
}
