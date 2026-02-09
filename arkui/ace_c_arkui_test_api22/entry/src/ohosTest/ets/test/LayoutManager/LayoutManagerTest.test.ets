/*
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

import { beforeAll, describe, expect, it, Level, afterEach,beforeEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function LayoutManagerTest() {

  describe('LayoutManagerTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_001
     * @tc.name      LayoutManagerTest_001
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetLineCount success
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_001] START');
      let PAGE_TAG = 'LayoutManager1Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton01'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText1ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_001] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_002
     * @tc.name      LayoutManagerTest_002
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetLineCount failed
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_002] START');
      let PAGE_TAG = 'LayoutManager2Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton02'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText2ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_002] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_003
     * @tc.name      LayoutManagerTest_003
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetRectsForRange success
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_003] START');
      let PAGE_TAG = 'LayoutManager3Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton03'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText3ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_003] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_004
     * @tc.name      LayoutManagerTest_004
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetRectsForRange failed
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_004] START');
      let PAGE_TAG = 'LayoutManager4Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton04'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText4ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_004] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_005
     * @tc.name      LayoutManagerTest_005
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate success
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_005', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_005] START');
      let PAGE_TAG = 'LayoutManager5Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton05'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText5ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_005] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_006
     * @tc.name      LayoutManagerTest_006
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate failed
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_006', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_006] START');
      let PAGE_TAG = 'LayoutManager6Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton06'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText6ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_006] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_007
     * @tc.name      LayoutManagerTest_007
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetLineMetrics success
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_007', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_007] START');
      let PAGE_TAG = 'LayoutManager7Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton07'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText7ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_007] END');
      done();
    })

    /**
     * @tc.number    LayoutManagerTest_008
     * @tc.name      LayoutManagerTest_008
     * @tc.desc      test OH_ArkUI_TextLayoutManager_GetLineMetrics failed
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('LayoutManagerTest_008', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutManagerTest_008] START');
      let PAGE_TAG = 'LayoutManager8Test';
      await Utils.pushPage(`LayoutManager/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LayoutManagerTestButton08'));
      await Utils.sleep(500);
      await button.click()
      await Utils.sleep(500);
      let strJsonNew:string = getInspectorByKey('LayoutManagerText8ID');
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('[LayoutManagerTest_008] END');
      done();
    })
  })
}