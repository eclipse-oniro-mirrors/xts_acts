/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function cachedCountNullUndefinedTest() {
  describe('cachedCountNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("cachedCountNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcListDefault/cachedCountNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("cachedCountNullUndefined" == pages.name)) {
          console.info("get cachedCountNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push cachedCountNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cachedCountNullUndefinedTest page error:" + err);
      }
      console.info("cachedCountNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   arcListCachedCountNullUndefined_0100
     * @tc.number arcListCachedCountNullUndefined_0100
     * @tc.desc   Test ArcList cachedCount property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListCachedCountNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcListCachedCountNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('arclist_cachedCount_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[arcListCachedCountNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // ArcList cachedCount 设置null
      expect(obj.$attrs.cachedCount).assertEqual("1");
      console.info('[arcListCachedCountNullUndefined_0100] END');
    })

    /**
     * @tc.name   arcListCachedCountNullUndefined_0200
     * @tc.number arcListCachedCountNullUndefined_0200
     * @tc.desc   Test ArcList cachedCount property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListCachedCountNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[arcListCachedCountNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('arclist_cachedCount_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[arcListCachedCountNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // ArcList cachedCount 设置undefined
      expect(obj.$attrs.cachedCount).assertEqual("1");
      console.info('[arcListCachedCountNullUndefined_0200] END');
    })
  })
}