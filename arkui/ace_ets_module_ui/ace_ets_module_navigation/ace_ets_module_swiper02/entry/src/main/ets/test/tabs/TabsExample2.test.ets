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

export default function TabsExample2() {
  describe('TabsExample2', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsExample2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/tabs/TabsExample2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsExample2 state pages:" + JSON.stringify(pages));
        if (!("TabsExample2" == pages.name)) {
          console.info("get TabsExample2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsExample2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsExample2 page error:" + err);
      }
      console.info("TabsExample2 beforeEach end");
      done();
    });

    /**
     * @tc.name   TabsExample2_0100
     * @tc.number TabsExample2_0100
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TabsExample2_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[TabsExample2_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson1 = getInspectorByKey('TabsExampleId2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.log('TabsExample2_0010 obj1 cachedMaxCount ', JSON.stringify(obj1?.$attrs?.cachedMaxCount));
      expect(JSON.stringify(obj1?.$attrs?.cachedMaxCount)).assertEqual(undefined);
      console.info('[TabsExample2_0100] END');
      done();
    });
 })
}