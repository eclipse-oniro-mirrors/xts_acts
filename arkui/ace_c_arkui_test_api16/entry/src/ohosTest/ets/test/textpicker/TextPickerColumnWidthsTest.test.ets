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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';

export default function textPickerTest(){

  describe('textPickerTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: TestTextPickerColumnWidths001
     * @tc.name: TestTextPickerColumnWidths001
     * @tc.desc: testing width for textPicker with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
      */
    it('TestTextPickerColumnWidths001', 0, async (done: Function) => {
      console.info('TestTextPickerColumnWidths001 START');
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(1000);
      console.info('SJH01 TestTextPickerColumnWidths001');
      let strJson = getInspectorByKey('columnWidths_001');
      await Utils.sleep(1000);
      console.info('SJH02 TestTextPickerColumnWidths001');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[Tes0011]:" + JSON.stringify(obj.$attrs));
      console.info("[TestTextPickerColumnWidths001]:" + JSON.stringify(obj.$attrs.columnWidths));
      expect(obj.$attrs.columnWidths).assertEqual(vp2px(50).toFixed(2).toString() + 'px');
      await Utils.sleep(1000)
      console.info('TestTextPickerColumnWidths001 END');
      done();
    })

    /*
       * @tc.number: TestTextPickerColumnWidths002
       * @tc.name: TestTextPickerColumnWidths002
       * @tc.desc: testing width for textPicker with outlier value
       * @tc.size: MediumTest
       * @tc.type: Function
       * @tc.level: Level 1
     */
    it('TestTextPickerColumnWidths002', 0, async (done: Function) => {
      console.info('TestTextPickerColumnWidths002 START');
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info('SJH11 TestTextPickerColumnWidths002');
      let strJson = getInspectorByKey('columnWidths_002');
      await Utils.sleep(1000);
      console.info('SJH12 TestTextPickerColumnWidths002');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[TestTextPickerColumnWidths002]:" + JSON.stringify(obj.$attrs.columnWidths));
      expect(obj.$attrs.columnWidths).assertEqual(vp2px(100).toFixed(2).toString() + 'px');
      await Utils.sleep(1000)
      console.info('TestTextPickerColumnWidths002 END');
      done();
    })

    /*
      * @tc.number: TestTextPickerColumnWidths003
      * @tc.name: TestTextPickerColumnWidths003
      * @tc.desc: testing width for textPicker with normal value
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it('TestTextPickerColumnWidths003', 0, async (done: Function) => {
      console.info('TestTextPickerColumnWidths003 START');
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info('SJH21 TestTextPickerColumnWidths002');
      let strJson = getInspectorByKey('columnWidths_003');
      await Utils.sleep(1000);
      console.info('SJH22 TestTextPickerColumnWidths002');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[TestTextPickerColumnWidths003]:" + JSON.stringify(obj.$attrs.columnWidths));
      let str = vp2px(60).toFixed(2).toString() + 'px,' + vp2px(20).toFixed(2).toString() + 'px,'
        + vp2px(20).toFixed(2).toString() + 'px';
      expect(obj.$attrs.columnWidths).assertEqual(str);
      await Utils.sleep(1000)
      console.info('TestTextPickerColumnWidths003 END');
      done();
    })

  })
}