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


export default function ScrollJsunit() {

  describe('scrollTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollA',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Scroll state success " + JSON.stringify(pages));
        if (!("Scroll" == pages.name)) {
          console.info("get Scroll state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Scroll page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Scroll after each called");
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1020
     * @tc.name testScrollGetInspectorByKey010
     * @tc.desc aceEtsTest
     */
    it('testScrollGetInspectorByKey010', Level.LEVEL1, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('scroll');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd scroll component obj is: " + JSON.stringify(obj));
      console.log("cd scroll type" + JSON.stringify(obj.$type));
      console.log("cd scroll scrollable" + JSON.stringify(obj.$attrs.scrollable));
      console.log("cd scroll scrollBar" + JSON.stringify(obj.$attrs.scrollBar));
      console.log("cd scroll scrollBarColor" + JSON.stringify(obj.$attrs.scrollBarColor));
      console.log("cd scroll scrollBarWidth" + JSON.stringify(obj.$attrs.scrollBarWidth));
      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.scrollable).assertEqual('ScrollDirection.Vertical');
      expect(obj.$attrs.scrollBarColor).assertEqual('#FFFFC0CB');
      expect(obj.$attrs.scrollBarWidth).assertEqual('20.00vp');
      console.info('cd ScorllGetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1030
     * @tc.name testScrollGetInspectorByKey020
     * @tc.desc aceEtsTest
     */
    it('testScrollGetInspectorByKey020', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('scroll1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd scroll1 component obj is: " + JSON.stringify(obj));
      console.log("cd scroll1 scrollable" + JSON.stringify(obj.$attrs.scrollable));
      console.log("cd scroll1 scrollBar" + JSON.stringify(obj.$attrs.scrollBar));
      expect(obj.$attrs.scrollable).assertEqual('ScrollDirection.Horizontal');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      console.info('cd Scorll1GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1040
     * @tc.name testScrollGetInspectorByKey030
     * @tc.desc aceEtsTest
     */
    it('testScrollGetInspectorByKey030', Level.LEVEL1, async (done: Function) => {
      let strJson: ESObject = getInspectorByKey('scroll2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd scroll2 component obj is: " + JSON.stringify(obj));
      console.log("cd scroll2 scrollable" + JSON.stringify(obj.$attrs.scrollable));
      console.log("cd scroll2 scrollBar" + JSON.stringify(obj.$attrs.scrollBar));
      expect(obj.$attrs.scrollable).assertEqual('ScrollDirection.None');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Off');
      console.info('cd Scorll2GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1050
     * @tc.name testScrollGetInspectorByKey040
     * @tc.desc aceEtsTest
     */
    it('testScrollGetInspectorByKey040', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('scroll3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd scroll3 component obj is: " + JSON.stringify(obj));
      console.log("cd scroll3 scrollable" + JSON.stringify(obj.$attrs.scrollable));
      console.log("cd scroll3 scrollBar" + JSON.stringify(obj.$attrs.scrollBar));
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Off');
      console.info('cd Scorll3GetInspectorByKey END');
      done();
    });
  })
}
