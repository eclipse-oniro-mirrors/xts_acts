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

export default function sectionsNullUndefined() {
  describe('sectionsNullUndefined', () => {
    beforeAll(async (done: Function) => {
      console.info("sectionsNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/waterFlowDefault/sectionsNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("sectionsNullUndefined" == pages.name)) {
          console.info("get sectionsNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push sectionsNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sectionsNullUndefined page error:" + err);
      }
      console.info("sectionsNullUndefined beforeEach end");
      done();
    });
    
    // ========== splice tests ==========
    /**
     * @tc.name   waterFlowSplice_nullUndefined_0100
     * @tc.number waterFlowSplice_nullUndefined_0100
     * @tc.desc   Test WaterFlowSections splice with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0100] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_1'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0100 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_start_null");
      console.info('[waterFlowSplice_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_start_null')
      console.info('[waterFlowSplice_nullUndefined_0100] END');
    })

    /**
     * @tc.name   waterFlowSplice_nullUndefined_0200
     * @tc.number waterFlowSplice_nullUndefined_0200
     * @tc.desc   Test WaterFlowSections splice with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0200] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_2'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0200 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_start_undefined");
      console.info('[waterFlowSplice_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_start_undefined')
      console.info('[waterFlowSplice_nullUndefined_0200] END');
    })

    /**
     * @tc.name   waterFlowSplice_nullUndefined_0300
     * @tc.number waterFlowSplice_nullUndefined_0300
     * @tc.desc   Test WaterFlowSections splice deleteCount with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0300] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_3'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0300 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_deleteCount_null");
      console.info('[waterFlowSplice_nullUndefined_0300] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_deleteCount_null')
      console.info('[waterFlowSplice_nullUndefined_0300] END');
    })

    /**
     * @tc.name   waterFlowSplice_nullUndefined_0400
     * @tc.number waterFlowSplice_nullUndefined_0400
     * @tc.desc   Test WaterFlowSections splice deleteCount with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0400] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_4'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0400 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_deleteCount_undefined");
      console.info('[waterFlowSplice_nullUndefined_0400] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_deleteCount_undefined')
      console.info('[waterFlowSplice_nullUndefined_0400] END');
    })

    /**
     * @tc.name   waterFlowSplice_nullUndefined_0500
     * @tc.number waterFlowSplice_nullUndefined_0500
     * @tc.desc   Test WaterFlowSections splice sections with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0500', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0500] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_5'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0500 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_sections_null");
      console.info('[waterFlowSplice_nullUndefined_0500] result: ' + JSON.stringify(result));
      expect(result == undefined).assertTrue();
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_sections_null')
      console.info('[waterFlowSplice_nullUndefined_0500] END');
    })

    /**
     * @tc.name   waterFlowSplice_nullUndefined_0600
     * @tc.number waterFlowSplice_nullUndefined_0600
     * @tc.desc   Test WaterFlowSections splice sections with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0600', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0600] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_6'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0600 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_sections_undefined");
      console.info('[waterFlowSplice_nullUndefined_0600] result: ' + JSON.stringify(result));
      expect(result == undefined).assertTrue();
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_sections_undefined')
      console.info('[waterFlowSplice_nullUndefined_0600] END');
    })

    /**
     * @tc.name   waterFlowSplice_nullUndefined_0700
     * @tc.number waterFlowSplice_nullUndefined_0700
     * @tc.desc   Test WaterFlowSections splice sections with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowSplice_nullUndefined_0700', Level.LEVEL2, async () => {
      console.info('[waterFlowSplice_nullUndefined_0700] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_splice_nullUndefined_7'));
      await clickBtn.click();
      console.info("waterFlowSplice_nullUndefined_0700 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("splice_sections_empty");
      console.info('[waterFlowSplice_nullUndefined_0700] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('splice_sections_empty')
      console.info('[waterFlowSplice_nullUndefined_0700] END');
    })
    
    // ========== push tests ==========
    /**
     * @tc.name   waterFlowPush_nullUndefined_0100
     * @tc.number waterFlowPush_nullUndefined_0100
     * @tc.desc   Test WaterFlowSections push section with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowPush_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[waterFlowPush_nullUndefined_0100] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_push_nullUndefined_1'));
      await clickBtn.click();
      console.info("waterFlowPush_nullUndefined_0100 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("push_section_null");
      console.info('[waterFlowPush_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result == undefined).assertTrue();
      await CommonFunc.sleep(500);

      AppStorage.delete('push_section_null')
      console.info('[waterFlowPush_nullUndefined_0100] END');
    })

    /**
     * @tc.name   waterFlowPush_nullUndefined_0200
     * @tc.number waterFlowPush_nullUndefined_0200
     * @tc.desc   Test WaterFlowSections push section with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowPush_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[waterFlowPush_nullUndefined_0200] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_push_nullUndefined_2'));
      await clickBtn.click();
      console.info("waterFlowPush_nullUndefined_0200 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("push_section_undefined");
      console.info('[waterFlowPush_nullUndefined_0200] result: ' + result);
      expect(result == undefined).assertTrue();
      await CommonFunc.sleep(500);

      AppStorage.delete('push_section_undefined')
      console.info('[waterFlowPush_nullUndefined_0200] END');
    })

    // ========== update tests ==========
    /**
     * @tc.name   waterFlowUpdate_nullUndefined_0100
     * @tc.number waterFlowUpdate_nullUndefined_0100
     * @tc.desc   Test WaterFlowSections update sectionIndex with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowUpdate_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[waterFlowUpdate_nullUndefined_0100] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_update_nullUndefined_1'));
      await clickBtn.click();
      console.info("waterFlowUpdate_nullUndefined_0100 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_sectionIndex_null");
      console.info('[waterFlowUpdate_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('update_sectionIndex_null')
      console.info('[waterFlowUpdate_nullUndefined_0100] END');
    })

    /**
     * @tc.name   waterFlowUpdate_nullUndefined_0200
     * @tc.number waterFlowUpdate_nullUndefined_0200
     * @tc.desc   Test WaterFlowSections update sectionIndex with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowUpdate_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[waterFlowUpdate_nullUndefined_0200] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_update_nullUndefined_2'));
      await clickBtn.click();
      console.info("waterFlowUpdate_nullUndefined_0200 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_sectionIndex_undefined");
      console.info('[waterFlowUpdate_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual(true);
      await CommonFunc.sleep(500);

      AppStorage.delete('update_sectionIndex_undefined')
      console.info('[waterFlowUpdate_nullUndefined_0200] END');
    })
    
    /**
     * @tc.name   waterFlowUpdate_nullUndefined_0300
     * @tc.number waterFlowUpdate_nullUndefined_0300
     * @tc.desc   Test WaterFlowSections update section with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowUpdate_nullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[waterFlowUpdate_nullUndefined_0300] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_update_nullUndefined_1'));
      await clickBtn.click();
      console.info("waterFlowUpdate_nullUndefined_0300 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_section_null");
      console.info('[waterFlowUpdate_nullUndefined_0300] result: ' + JSON.stringify(result));
      expect(result == undefined).assertTrue();
      await CommonFunc.sleep(500);

      AppStorage.delete('update_section_null')
      console.info('[waterFlowUpdate_nullUndefined_0300] END');
    })

    /**
     * @tc.name   waterFlowUpdate_nullUndefined_0400
     * @tc.number waterFlowUpdate_nullUndefined_0400
     * @tc.desc   Test WaterFlowSections update section with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowUpdate_nullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[waterFlowUpdate_nullUndefined_0400] START');
      let driver = await Driver.create()
      let clickBtn = await driver.findComponent(ON.id('water_update_nullUndefined_2'));
      await clickBtn.click();
      console.info("waterFlowUpdate_nullUndefined_0400 click success");
      await CommonFunc.sleep(1500);
      let result: string | undefined = AppStorage.get("update_section_undefined");
      console.info('[waterFlowUpdate_nullUndefined_0400] result: ' + JSON.stringify(result));
      expect(result == undefined).assertTrue();
      await CommonFunc.sleep(500);

      AppStorage.delete('update_section_undefined')
      console.info('[waterFlowUpdate_nullUndefined_0400] END');
    })
  })
}