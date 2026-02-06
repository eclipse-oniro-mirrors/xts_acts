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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativerender.so'
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';

export default function RegionListCapiTest(){

  describe('RegionListCapiTest', () => {
    let PAGE_TAG = 'RegionListTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`RegionListTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   RegionListTest_001
     * @tc.number SUB_ARKUI_CAPI_RegionListTest_001
     * @tc.desc   Test ArkUI_ResponseRegionSupportedTool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegionListTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[RegionListTest_001] START');
      await Utils.sleep(1000);
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.id('scrollId'));
      let rowId = await scrollBar.scrollSearch(ON.id('rowId'));
      await rowId.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('textId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('RegionListTest_001 component obj is: ' + JSON.stringify(obj));
      console.info('RegionListTest_001 content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('row1 is clicked');
      console.info('[RegionListTest_001] END');
      done();
    })

    /**
     * @tc.name   RegionListTest_002
     * @tc.number SUB_ARKUI_CAPI_RegionListTest_002
     * @tc.desc   Test ArkUI_ResponseRegionSupportedTool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegionListTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[RegionListTest_002] START');
      await Utils.sleep(1000);
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.id('scrollId'));
      let rowId2 = await scrollBar.scrollSearch(ON.id('rowId2'));
      await rowId2.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('textId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('RegionListTest_002 component obj is: ' + JSON.stringify(obj));
      console.info('RegionListTest_002 content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('row2 is clicked');
      console.info('[RegionListTest_002] END');
      done();
    })

    /**
     * @tc.name   RegionListTest_003
     * @tc.number SUB_ARKUI_CAPI_RegionListTest_003
     * @tc.desc   Test ArkUI_ResponseRegionSupportedTool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegionListTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[RegionListTest_003] START');
      await Utils.sleep(1000);
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.id('scrollId'));
      let buttonId: Component = await scrollBar.scrollSearch(ON.id('buttonId'));
      await buttonId.click();
      await Utils.sleep(1000);
      let rowId3 = await scrollBar.scrollSearch(ON.id('rowId3'));
      await rowId3.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('textId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('RegionListTest_003 component obj is: ' + JSON.stringify(obj));
      console.info('RegionListTest_003 content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('row3 is clicked');
      console.info('[RegionListTest_003] END');
      done();
    })

    /**
     * @tc.name   RegionListTest_004
     * @tc.number SUB_ARKUI_CAPI_RegionListTest_004
     * @tc.desc   Test ArkUI_ResponseRegionSupportedTool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RegionListTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[RegionListTest_004] START');
      await Utils.sleep(1000);
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.id('scrollId'));
      let buttonId: Component = await scrollBar.scrollSearch(ON.id('buttonId'));
      await buttonId.click();
      await Utils.sleep(1000);
      let rowId4 = await scrollBar.scrollSearch(ON.id('rowId4'));
      await rowId4.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('textId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('RegionListTest_004 component obj is: ' + JSON.stringify(obj));
      console.info('RegionListTest_004 content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('row4 is clicked');
      console.info('[RegionListTest_004] END');
      done();
    })
  })
}