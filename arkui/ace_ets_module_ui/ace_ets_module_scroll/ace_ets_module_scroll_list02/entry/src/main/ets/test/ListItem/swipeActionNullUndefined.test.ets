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
import hilog from '@ohos.hilog';

export default function swipeActionNullUndefined() {
  describe('swipeActionNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("swipeActionNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItem/swipeActionNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swipeActionNullUndefined state pages:" + JSON.stringify(pages));
        if (!("listItemNullUndefined" == pages.name)) {
          console.info("get swipeActionNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swipeActionNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swipeActionNullUndefined page error:" + err);
      }
      console.info("swipeActionNullUndefined beforeEach end");
      done();
    });
    beforeAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('swipeActionNullUndefined beforeAll start');
    });
    
    // ========== expand tests ==========
    /**
     * @tc.name   expandNullUndefined_0100
     * @tc.number expandNullUndefined_0100
     * @tc.desc   Test ListItemSwipeActionManager expand node with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('expandNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[expandNullUndefined_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('expand_nullUndefined_1'));
      await clickBtn.click();
      console.info("expandNullUndefined_0100 click success");
      await CommonFunc.sleep(1500);
       try {
        console.info('expandNullUndefined_0100 expand_node_null');
      } catch (err) {
        hilog.error(0x0000, "Error expandNullUndefined_0100:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
      };
      console.info('[expandNullUndefined_0100] END');
    })

    /**
     * @tc.name   expandNullUndefined_0200
     * @tc.number expandNullUndefined_0200
     * @tc.desc   Test ListItemSwipeActionManager expand node with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('expandNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[expandNullUndefined_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('expand_nullUndefined_2'));
      await clickBtn.click();
      console.info("expandNullUndefined_0200 click success");
      await CommonFunc.sleep(1500);
       try {
        console.info('expandNullUndefined_0200 expand_node_undefined');
      } catch (err) {
        hilog.error(0x0000, "Error expandNullUndefined_0200:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
      };
      console.info('[expandNullUndefined_0200] END');
    })

    /**
     * @tc.name   expandNullUndefined_0300
     * @tc.number expandNullUndefined_0300
     * @tc.desc   Test ListItemSwipeActionManager expand direction with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('expandNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[expandNullUndefined_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('expand_nullUndefined_3'));
      await clickBtn.click();
      console.info("expandNullUndefined_0300 click success");
      await CommonFunc.sleep(1500);
       try {
        console.info('expandNullUndefined_0300 expand_direction_null');
      } catch (err) {
        hilog.error(0x0000, "Error expandNullUndefined_0300:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
      };
      console.info('[expandNullUndefined_0300] END');
    })

    /**
     * @tc.name   expandNullUndefined_0400
     * @tc.number expandNullUndefined_0400
     * @tc.desc   Test ListItemSwipeActionManager expand direction with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('expandNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[expandNullUndefined_0400] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('expand_nullUndefined_4'));
      await clickBtn.click();
      console.info("expandNullUndefined_0400 click success");
      await CommonFunc.sleep(1500);
       try {
        console.info('expandNullUndefined_0400 expand_direction_undefined');
      } catch (err) {
        hilog.error(0x0000, "Error expandNullUndefined_0400:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
      };
      console.info('[expandNullUndefined_0400] END');
    })

    // ========== collapse tests ==========
    /**
     * @tc.name   collapseNullUndefined_0100
     * @tc.number collapseNullUndefined_0100
     * @tc.desc   Test ListItemSwipeActionManager collapse with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('collapseNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[collapseNullUndefined_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('collapse_nullUndefined_1'));
      await clickBtn.click();
      console.info("collapseNullUndefined_0100 click success");
      await CommonFunc.sleep(1500);
       try {
        console.info('collapseNullUndefined_0100 expand_collapse_null');
      } catch (err) {
        hilog.error(0x0000, "Error collapseNullUndefined_0100:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
      };
      console.info('[collapseNullUndefined_0100] END');
    })

    /**
     * @tc.name   collapseNullUndefined_0200
     * @tc.number collapseNullUndefined_0200
     * @tc.desc   Test ListItemSwipeActionManager collapse with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('collapseNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[collapseNullUndefined_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('collapse_nullUndefined_2'));
      await clickBtn.click();
      console.info("collapseNullUndefined_0200 click success");
      await CommonFunc.sleep(1500);
       try {
        console.info('collapseNullUndefined_0200 expand_collapse_undefined');
      } catch (err) {
        hilog.error(0x0000, "Error collapseNullUndefined_0200:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
      };
      console.info('[collapseNullUndefined_0200] END');
    })
  })
}