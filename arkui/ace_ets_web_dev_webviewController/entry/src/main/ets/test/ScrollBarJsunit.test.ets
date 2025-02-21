
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
// import router from '@system.router';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function scrollBarJsunit() {
  describe('TEST_ScrollBar_Keep',  () => {
    beforeEach(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scrollBar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollBar state success " + JSON.stringify(pages));
        if (!("span" == pages.name)) {
          console.info("get scrollBar success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBar page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async  () =>{
      await Utils.sleep(2000);
      console.info("scrollBar after each called");
    });

    it('testScrollBarKeep001', 0, async  (done: Function) => {
      console.info('[testScrollBarKeep001] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('scroll');
      console.info("[testScrollBarKeep001] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar001] scrollBar:" + obj.$attrs.scrollBar);
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      done();
    });

    it('testScrollBarKeep002', 0, async  (done: Function) =>{
      console.info('[testScrollBarKeep002] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('scroll');
      console.info("[testScrollBarKeep002] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar002] scrollable:" + obj.$attrs.scrollable);
      expect(obj.$attrs.scrollable).assertEqual("ScrollDirection.Vertical");
      done();
    });
  })
}