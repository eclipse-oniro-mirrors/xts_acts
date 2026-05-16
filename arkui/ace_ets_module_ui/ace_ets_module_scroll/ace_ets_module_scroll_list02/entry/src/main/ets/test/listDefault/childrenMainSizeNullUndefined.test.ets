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

export default function childrenMainSizeNullUndefined() {
  describe('childrenMainSizeNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("childrenMainSizeNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listDefault/childrenMainSizeNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("childrenMainSizeNullUndefined" == pages.name)) {
          console.info("get childrenMainSizeNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push childrenMainSizeNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push childrenMainSizeNullUndefined page error:" + err);
      }
      console.info("childrenMainSizeNullUndefined beforeEach end");
      done();
    });

    // ========== splice tests ==========
    /**
     * @tc.name   childrenMainSizeNullUndefined_0100
     * @tc.number childrenMainSizeNullUndefined_0100
     * @tc.desc   Test ChildrenMainSize splice start with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0100] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_1'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0100 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_start_null");
      console.info('[childrenMainSizeNullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("401");
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_start_null')
      console.info('[childrenMainSizeNullUndefined_0100] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_0200
     * @tc.number childrenMainSizeNullUndefined_0200
     * @tc.desc   Test ChildrenMainSize splice start with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0200] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_2'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0200 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_start_undefined");
      console.info('[childrenMainSizeNullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("401");
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_start_undefined')
      console.info('[childrenMainSizeNullUndefined_0200] END');
    })
    
    /**
     * @tc.name   childrenMainSizeNullUndefined_0300
     * @tc.number childrenMainSizeNullUndefined_0300
     * @tc.desc   Test ChildrenMainSize splice deleteCount with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0300] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_3'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0300 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_deleteCount_null");
      console.info('[childrenMainSizeNullUndefined_0300] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_0300] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_0300] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('splice_deleteCount_null')
      console.info('[childrenMainSizeNullUndefined_0300] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_0400
     * @tc.number childrenMainSizeNullUndefined_0400
     * @tc.desc   Test ChildrenMainSize splice deleteCount with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0400] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_4'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0400 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_deleteCount_undefined");
      console.info('[childrenMainSizeNullUndefined_0400] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_0400] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_0400] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('splice_deleteCount_undefined')
      console.info('[childrenMainSizeNullUndefined_0400] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_0500
     * @tc.number childrenMainSizeNullUndefined_0500
     * @tc.desc   Test ChildrenMainSize splice childrenSize with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0500', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0500] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_5'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0500 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_childrenSize_null");
      console.info('[childrenMainSizeNullUndefined_0500] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_0500] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_0500] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('splice_childrenSize_null')
      console.info('[childrenMainSizeNullUndefined_0500] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_0600
     * @tc.number childrenMainSizeNullUndefined_0600
     * @tc.desc   Test ChildrenMainSize splice childrenSize with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0600', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0600] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_6'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0600 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_childrenSize_undefined");
      console.info('[childrenMainSizeNullUndefined_0600] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_0600] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_0600] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('splice_childrenSize_undefined')
      console.info('[childrenMainSizeNullUndefined_0600] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_0700
     * @tc.number childrenMainSizeNullUndefined_0700
     * @tc.desc   Test ChildrenMainSize splice childrenSize with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0700', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0700] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('splice_nullUndefined_7'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0700 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_childrenSize_empty");
      console.info('[childrenMainSizeNullUndefined_0700] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_0700] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_0700] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('splice_childrenSize_empty')
      console.info('[childrenMainSizeNullUndefined_0700] END');
    })
    
    /**
     * @tc.name   childrenMainSizeNullUndefined_0800
     * @tc.number childrenMainSizeNullUndefined_0800
     * @tc.desc   Test ChildrenMainSize update index with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0800', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0800] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('update_nullUndefined_1'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0800 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_index_null");
      console.info('[childrenMainSizeNullUndefined_0800] result: ' + JSON.stringify(result));
      expect(result).assertEqual("401");
      await CommonFunc.sleep(500);

      AppStorage.delete('update_index_null')
      console.info('[childrenMainSizeNullUndefined_0800] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_0900
     * @tc.number childrenMainSizeNullUndefined_0900
     * @tc.desc   Test ChildrenMainSize update index with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_0900', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_0900] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('update_nullUndefined_2'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_0900 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_index_undefined");
      console.info('[childrenMainSizeNullUndefined_0900] result: ' + JSON.stringify(result));
      expect(result).assertEqual("401");
      await CommonFunc.sleep(500);

      AppStorage.delete('update_index_undefined')
      console.info('[childrenMainSizeNullUndefined_0900] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_1000
     * @tc.number childrenMainSizeNullUndefined_1000
     * @tc.desc   Test ChildrenMainSize update childSize with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_1000', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_1000] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('update_nullUndefined_3'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_1000 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_childSize_null");
      console.info('[childrenMainSizeNullUndefined_1000] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_1000] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_1000] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('update_childSize_null')
      console.info('[childrenMainSizeNullUndefined_1000] END');
    })

    /**
     * @tc.name   childrenMainSizeNullUndefined_1100
     * @tc.number childrenMainSizeNullUndefined_1100
     * @tc.desc   Test ChildrenMainSize update childSize with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('childrenMainSizeNullUndefined_1100', Level.LEVEL2, async () => {
      console.info('[childrenMainSizeNullUndefined_1100] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('update_nullUndefined_4'));
      await clickBtn.click();
      console.info("childrenMainSizeNullUndefined_1100 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_childSize_undefined");
      console.info('[childrenMainSizeNullUndefined_1100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      let list = CommonFunc.getComponentRectOnScreen('list_childrenMainSize_nullUndefined');
      let listItem1 = CommonFunc.getComponentRectOnScreen('childrenMainSize_nullUndefined_1');
      console.info(`[childrenMainSizeNullUndefined_1100] list.top = ${list.top}`);
      console.info(`[childrenMainSizeNullUndefined_1100] listItem1.top = ${listItem1.top}`);
      expect(Math.floor(Math.abs(listItem1.top - list.top)) <= 1).assertTrue();

      AppStorage.delete('update_childSize_undefined')
      console.info('[childrenMainSizeNullUndefined_1100] END');
    })
  })
}