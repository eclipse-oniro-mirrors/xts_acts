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

export default function listScrollerNullUndefined() {
  describe('listScrollerNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("listScrollerNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listDefault/listScrollerNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("listScrollerNullUndefined" == pages.name)) {
          console.info("get listScrollerNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listScrollerNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listScrollerNullUndefined page error:" + err);
      }
      console.info("listScrollerNullUndefined beforeEach end");
      done();
    });

    // ========== closeAllSwipeActions tests ==========
    /**
     * @tc.name   closeAllSwipeActionsNullUndefined_0100
     * @tc.number closeAllSwipeActionsNullUndefined_0100
     * @tc.desc   Test listScroller closeAllSwipeActions property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('closeAllSwipeActionsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[closeAllSwipeActionsNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('closeAllSwipeActions_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('closeAllSwipeActionsNullUndefined_0100 getValue: ', AppStorage.get('closeAllSwipeActions_null'))
      expect(AppStorage.get('closeAllSwipeActions_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('closeAllSwipeActions_null')
      console.info('[closeAllSwipeActionsNullUndefined_0100] END');
    })

    /**
     * @tc.name   closeAllSwipeActionsNullUndefined_0200
     * @tc.number closeAllSwipeActionsNullUndefined_0200
     * @tc.desc   Test listScroller closeAllSwipeActions property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('closeAllSwipeActionsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[closeAllSwipeActionsNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('closeAllSwipeActions_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('closeAllSwipeActionsNullUndefined_0200 getValue: ', AppStorage.get('closeAllSwipeActions_undefined'))
      expect(AppStorage.get('closeAllSwipeActions_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('closeAllSwipeActions_undefined')
      console.info('[closeAllSwipeActionsNullUndefined_0200] END');
    })

    // ========== getItemRectInGroup tests ==========
    /**
     * @tc.name   getItemRectInGroupNullUndefined_0100
     * @tc.number getItemRectInGroupNullUndefined_0100
     * @tc.desc   Test listScroller getItemRectInGroup index property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemRectInGroupNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[getItemRectInGroupNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemRectInGroup_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemRectInGroupNullUndefined_0100 getValue: ', AppStorage.get('getItemRectInGroup_x_null'))
      expect(AppStorage.get('getItemRectInGroup_x_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemRectInGroup_x_null')
      console.info('[getItemRectInGroupNullUndefined_0100] END');
    })

    /**
     * @tc.name   getItemRectInGroupNullUndefined_0200
     * @tc.number getItemRectInGroupNullUndefined_0200
     * @tc.desc   Test listScroller getItemRectInGroup index property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemRectInGroupNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[getItemRectInGroupNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemRectInGroup_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemRectInGroupNullUndefined_0200 getValue: ', AppStorage.get('getItemRectInGroup_x_undefined'))
      expect(AppStorage.get('getItemRectInGroup_x_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemRectInGroup_x_undefined')
      console.info('[getItemRectInGroupNullUndefined_0200] END');
    })

    /**
     * @tc.name   getItemRectInGroupNullUndefined_0300
     * @tc.number getItemRectInGroupNullUndefined_0300
     * @tc.desc   Test listScroller getItemRectInGroup indexInGroup property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemRectInGroupNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[getItemRectInGroupNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemRectInGroup_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemRectInGroupNullUndefined_0300 getValue: ', AppStorage.get('getItemRectInGroup_y_null'))
      expect(AppStorage.get('getItemRectInGroup_y_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemRectInGroup_y_null')
      console.info('[getItemRectInGroupNullUndefined_0300] END');
    })

    /**
     * @tc.name   getItemRectInGroupNullUndefined_0400
     * @tc.number getItemRectInGroupNullUndefined_0400
     * @tc.desc   Test listScroller getItemRectInGroup indexInGroup property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemRectInGroupNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[getItemRectInGroupNullUndefined_0400] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemRectInGroup_nullUndefined_4'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemRectInGroupNullUndefined_0400 getValue: ', AppStorage.get('getItemRectInGroup_y_undefined'))
      expect(AppStorage.get('getItemRectInGroup_y_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemRectInGroup_y_undefined')
      console.info('[getItemRectInGroupNullUndefined_0400] END');
    })

    // ========== getVisibleListContentInfo tests ==========
    /**
     * @tc.name   getVisibleListContentInfoNullUndefined_0100
     * @tc.number getVisibleListContentInfoNullUndefined_0100
     * @tc.desc   Test listScroller getVisibleListContentInfo x property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getVisibleListContentInfoNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[getVisibleListContentInfoNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getVisibleListContentInfo_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getVisibleListContentInfoNullUndefined_0100 getValue: ', AppStorage.get('getVisibleListContentInfo_x_null'))
      expect(AppStorage.get('getVisibleListContentInfo_x_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getVisibleListContentInfo_x_null')
      console.info('[getVisibleListContentInfoNullUndefined_0100] END');
    })

    /**
     * @tc.name   getVisibleListContentInfoNullUndefined_0200
     * @tc.number getVisibleListContentInfoNullUndefined_0200
     * @tc.desc   Test listScroller getVisibleListContentInfo x property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getVisibleListContentInfoNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[getVisibleListContentInfoNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getVisibleListContentInfo_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getVisibleListContentInfoNullUndefined_0200 getValue: ', AppStorage.get('getVisibleListContentInfo_x_undefined'))
      expect(AppStorage.get('getVisibleListContentInfo_x_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getVisibleListContentInfo_x_undefined')
      console.info('[getVisibleListContentInfoNullUndefined_0200] END');
    })

    /**
     * @tc.name   getVisibleListContentInfoNullUndefined_0300
     * @tc.number getVisibleListContentInfoNullUndefined_0300
     * @tc.desc   Test listScroller getVisibleListContentInfo y property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getVisibleListContentInfoNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[getVisibleListContentInfoNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getVisibleListContentInfo_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getVisibleListContentInfoNullUndefined_0300 getValue: ', AppStorage.get('getVisibleListContentInfo_y_null'))
      expect(AppStorage.get('getVisibleListContentInfo_y_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getVisibleListContentInfo_y_null')
      console.info('[getVisibleListContentInfoNullUndefined_0300] END');
    })

    /**
     * @tc.name   getVisibleListContentInfoNullUndefined_0400
     * @tc.number getVisibleListContentInfoNullUndefined_0400
     * @tc.desc   Test listScroller getVisibleListContentInfo y property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getVisibleListContentInfoNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[getVisibleListContentInfoNullUndefined_0400] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getVisibleListContentInfo_nullUndefined_4'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getVisibleListContentInfoNullUndefined_0400 getValue: ', AppStorage.get('getVisibleListContentInfo_y_undefined'))
      expect(AppStorage.get('getVisibleListContentInfo_y_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getVisibleListContentInfo_y_undefined')
      console.info('[getVisibleListContentInfoNullUndefined_0400] END');
    })
  })
}