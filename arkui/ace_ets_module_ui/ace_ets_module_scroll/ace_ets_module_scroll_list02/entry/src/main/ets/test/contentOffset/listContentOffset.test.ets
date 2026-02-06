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

export default function listContentOffset() {
  describe('listContentOffset', () => {
    beforeEach(async (done: Function) => {
      console.info("listContentOffset beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/contentOffset/listContentOffset",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listContentOffset state pages:" + JSON.stringify(pages));
        if (!("listContentOffset" == pages.name)) {
          console.info("get listContentOffset pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listContentOffset page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listContentOffset page error:" + err);
      }
      console.info("listContentOffset beforeEach end");
      done();
    });

    /**
     * @tc.name   listContentOffset_0100
     * @tc.number listContentOffset_0100
     * @tc.desc   Set content area offset through number type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listContentOffset_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[listContentOffset_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_contentOffset_num');
      console.info("[listContentOffset_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[listContentOffset_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[listContentOffset_0100] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      console.info("[listContentOffset_0100] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("20.000000");
      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("30.000000");
      console.info('[listContentOffset_0100] END');
      done();
    });

    /**
     * @tc.name   listContentOffset_0200
     * @tc.number listContentOffset_0200
     * @tc.desc   Set the starting offset of the content area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listContentOffset_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[listContentOffset_0200] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('list_contentOffset_start'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let listSwipe = CommonFunc.getComponentRectOnScreen('list_contentOffset_num');
      let top = listSwipe.top;
      let right = listSwipe.right;
      let left = listSwipe.left;
      let bottom = listSwipe.bottom;
      console.info("listContentOffset_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.2),Math.round(left + width/2),Math.round(top + height*0.6));
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('list_contentOffset_num');
      console.info("[listContentOffset_0200] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("30.000000");

      let list = CommonFunc.getComponentRectOnScreen('list_contentOffset_num');
      console.info("[listContentOffset_0200] list_top is: " + list.top);
      let listItem = CommonFunc.getComponentRectOnScreen('list_item_0');
      console.info("[listContentOffset_0200] listItem_top is: " + listItem.top);
      let size_start = listItem.top - list.top
      console.info("[listContentOffset_0200] size_start is: " + size_start);
      console.info("[listContentOffset_0200] vp2px(30) is: " + vp2px(30));
      expect(Math.floor(Math.abs(size_start - vp2px(30))) <= 1).assertTrue();
      console.info('[listContentOffset_0200] END');
      done();
    });

    /**
     * @tc.name   listContentOffset_0300
     * @tc.number listContentOffset_0300
     * @tc.desc   Set the offset at the end of the content area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listContentOffset_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[listContentOffset_0300] START');
      let driver = await Driver.create()
      let btn_btm: Component = await driver.findComponent(ON.id('list_contentOffset_btm'));
      await btn_btm.click();
      await CommonFunc.sleep(1500);
      let btn: Component = await driver.findComponent(ON.id('list_contentOffset_end'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let listSwipe = CommonFunc.getComponentRectOnScreen('list_contentOffset_num');
      let top = listSwipe.top;
      let right = listSwipe.right;
      let left = listSwipe.left;
      let bottom = listSwipe.bottom;
      console.info("listContentOffset_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.6),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('list_contentOffset_num');
      console.info("[listContentOffset_0300] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("20.000000");

      let list = CommonFunc.getComponentRectOnScreen('list_contentOffset_num');
      console.info("[listContentOffset_0300] list_bottom is: " + list.bottom);
      let listItem = CommonFunc.getComponentRectOnScreen('list_item_9');
      console.info("[listContentOffset_0300] listItem_bottom is: " + listItem.bottom);
      let size_end = list.bottom - listItem.bottom
      console.info("[listContentOffset_0300] size_end is: " + size_end);
      console.info("[listContentOffset_0300] vp2px(20) is: " + vp2px(20));
      expect(Math.floor(Math.abs(size_end - vp2px(20))) <= 1).assertTrue();
      console.info('[listContentOffset_0300] END');
      done();
    });
  })
}
