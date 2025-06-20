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
      resolve()
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}


export default function columnJsunit() {


  describe('columnTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/Column',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Column state success " + JSON.stringify(pages));
        if (!("Column" == pages.name)) {
          console.info("get Column state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Column page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Column after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0670
     * @tc.name testColumn010
     * @tc.desc aceEtsTest
     */
    it('testColumn010',  Level.LEVEL0, async (done: Function) => {
      console.info('new Column0 START');
      let strJson = getInspectorByKey('column');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Column');
      console.info("yr new Column0-Column: " + JSON.stringify(obj.$type));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.log("yr new Column0 alignItems-'HorizontalAlign.Center':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new Column0 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0680
     * @tc.name testColumn020
     * @tc.desc aceEtsTest
     */
    it('testColumn020',  Level.LEVEL0, async (done: Function) => {
      console.info('new Column1 START');
      let strJson = getInspectorByKey('column1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Start');
      console.log("yr new Column1 alignItems-'HorizontalAlign.Start':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new Column1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0690
     * @tc.name testColumn030
     * @tc.desc aceEtsTest
     */
    it('testColumn030',  Level.LEVEL0, async (done: Function) => {
      console.info('new Column2 START');
      let strJson = getInspectorByKey('column2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.End');
      console.log("yr new Column2 alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new Column2 END');
      done();
    });
  })
}
