/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function TabsExample1() {
  describe('TabsExample1', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsExample1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/tabs/TabsExample1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsExample1 state pages:" + JSON.stringify(pages));
        if (!("TabsExample1" == pages.name)) {
          console.info("get TabsExample1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsExample1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsExample1 page error:" + err);
      }
      console.info("TabsExample1 beforeEach end");
      done();
    });

    /**
     * @tc.name   TabsExample1_0100
     * @tc.number TabsExample1_0100
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TabsExample1_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[TabsExample1_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson1 = getInspectorByKey('TabsExampleId1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.log('TabsExample1_0100 obj1 cachedMaxCount ', JSON.stringify(obj1?.$attrs?.cachedMaxCount));
      expect(JSON.stringify(obj1?.$attrs?.cachedMaxCount)).assertEqual('{"count":0,"mode":"TabsCacheMode.CACHE_BOTH_SIDE"}');
      console.info('[TabsExample1_0100] END');
      done();
    });
 })
}
