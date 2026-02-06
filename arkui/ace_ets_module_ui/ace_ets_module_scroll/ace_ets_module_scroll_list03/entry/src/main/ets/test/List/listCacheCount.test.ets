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
 
export default function listCacheCount() {
  describe('listCacheCount', () => {
    beforeEach(async (done: Function) => {
      console.info("listCacheCount beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listCacheCount",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("listCacheCount" == pages.name)) {
          console.info("get listCacheCount pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listCacheCount page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listCacheCount page error:" + err);
      }
      console.info("listCacheCount beforeEach end");
      done();
    });
 
    /**
     * @tc.name   listCacheCount_0100
     * @tc.number listCacheCount_0100
     * @tc.desc   When the cached count type is CacheCountInfo, it represents the maximum range of preloads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('listCacheCount_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[listCacheCount_0100] START');
      await CommonFunc.sleep(1000);
      let listItem4 = CommonFunc.getComponentRectOnScreen('countInfo_4');
      console.info('[listCacheCount_0100] listItem4.bottom: ' + listItem4.bottom);
      let listItem5 = CommonFunc.getComponentRectOnScreen('countInfo_5');
      console.info('[listCacheCount_0100] listItem5.top: ' + listItem5.top);
      expect(Math.floor(Math.abs(listItem5.top - listItem4.bottom)) <= 1 ).assertTrue();
 
      let listItem6 = CommonFunc.getComponentRectOnScreen('countInfo_6');
      console.info('[listCacheCount_0100] listItem6.bottom: ' + listItem6.bottom);
      let listItem7 = CommonFunc.getComponentRectOnScreen('countInfo_7');
      console.info('[listCacheCount_0100] listItem7.top: ' + listItem7.top);
      expect(Math.floor(Math.abs(listItem7.top - listItem6.bottom)) <= 1 ).assertTrue();
      await CommonFunc.sleep(500);
      console.info('[listCacheCount_0100] END');
      done();
    });
 
    /**
     * @tc.name   listCacheCount_0200
     * @tc.number listCacheCount_0200
     * @tc.desc   When the cached count type is CacheCountInfo, it represents the minimum range of preloads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('listCacheCount_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[listCacheCount_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swipeList = CommonFunc.getComponentRectOnScreen('list_countInfo');
      let top = swipeList.top;
      let right = swipeList.right;
      let left = swipeList.left;
      let bottom = swipeList.bottom;
      console.info("listCacheCount_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.6),Math.round(left + width/2),Math.round(top + height*0.5),300);
      await CommonFunc.sleep(2000);
 
      let listItem7 = CommonFunc.getComponentRectOnScreen('countInfo_7');
      console.info('[listCacheCount_0200] listItem7.bottom: ' + listItem7.bottom);
      let listItem8 = CommonFunc.getComponentRectOnScreen('countInfo_8');
      console.info('[listCacheCount_0200] listItem8.top: ' + listItem8.top);
      await CommonFunc.sleep(500);
      expect(Math.floor(Math.abs(listItem8.top - listItem7.bottom)) <= 1 ).assertTrue();
      console.info('[listCacheCount_0200] END');
      done();
    });
  })
}