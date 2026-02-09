'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level , beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test'

const TEXTPICKER_WTDTHS1 = 20;
const TEXTPICKER_WTDTHS2 = 50;
const TEXTPICKER_WTDTHS3 = 60;
const TEXTPICKER_WTDTHS4 = 100;
export default function textPickerTest(){

  describe('textPickerTest',() => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   TestTextPickerColumnWidths001
     * @tc.name     TestTextPickerColumnWidths001
     * @tc.desc     TestTextPickerColumnWidths001
     * @tc.level    Level.LEVEL1
     */
    it('TestTextPickerColumnWidths001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TestTextPickerColumnWidths001 START');
      let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(1000);
      console.info('SJH01 TestTextPickerColumnWidths001');
      let strJson = inspector.getInspectorByKey('columnWidths_001');
      await Utils.sleep(1000);
      console.info('SJH02 TestTextPickerColumnWidths001');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[Tes0011]:" + JSON.stringify(obj.getElement('$attrs')));
      console.info("[TestTextPickerColumnWidths001]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
      let str = JSON.stringify(context.vp2px(TEXTPICKER_WTDTHS2));
      expect(obj.getElement('$attrs').getString('columnWidths').includes('px')).assertTrue();
      expect(Math.abs(parseInt(obj.getElement('$attrs').getString('columnWidths')) - parseInt(str)) <= 1).assertTrue();
      await Utils.sleep(1000)
      console.info('TestTextPickerColumnWidths001 END');
      done();
    })

    
    /**
     * @tc.number   TestTextPickerColumnWidths002
     * @tc.name     TestTextPickerColumnWidths002
     * @tc.desc     TestTextPickerColumnWidths002
     * @tc.level    Level.LEVEL1
     */
    it('TestTextPickerColumnWidths002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TestTextPickerColumnWidths002 START');
      let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info('SJH11 TestTextPickerColumnWidths002');
      let strJson = inspector.getInspectorByKey('columnWidths_002');
      await Utils.sleep(1000);
      console.info('SJH12 TestTextPickerColumnWidths002');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[TestTextPickerColumnWidths002]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
      let str = JSON.stringify(context.vp2px(TEXTPICKER_WTDTHS4));
      expect(obj.getElement('$attrs').getString('columnWidths').includes('px')).assertTrue();
      expect(Math.abs(parseInt(obj.getElement('$attrs').getString('columnWidths')) - parseInt(str)) <= 1).assertTrue();
      await Utils.sleep(1000)
      console.info('TestTextPickerColumnWidths002 END');
      done();
    })

    
    /**
     * @tc.number   TestTextPickerColumnWidths003
     * @tc.name     TestTextPickerColumnWidths003
     * @tc.desc     TestTextPickerColumnWidths003
     * @tc.level    Level.LEVEL1
     */
    it('TestTextPickerColumnWidths003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TestTextPickerColumnWidths003 START');
      let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info('SJH21 TestTextPickerColumnWidths002');
      let strJson = inspector.getInspectorByKey('columnWidths_003');
      await Utils.sleep(1000);
      console.info('SJH22 TestTextPickerColumnWidths002');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[TestTextPickerColumnWidths003]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
      let wids: string[] = obj.getElement('$attrs').getString('columnWidths').split(',');
      expect(obj.getElement('$attrs').getString('columnWidths').includes('px')).assertTrue();
      expect(Math.abs(parseInt(wids[0]) - parseInt(JSON.stringify(context.vp2px(TEXTPICKER_WTDTHS3)))) <= 1).assertTrue();
      expect(Math.abs(parseInt(wids[1]) - parseInt(JSON.stringify(context.vp2px(TEXTPICKER_WTDTHS1)))) <= 1).assertTrue();
      expect(Math.abs(parseInt(wids[2]) - parseInt(JSON.stringify(context.vp2px(TEXTPICKER_WTDTHS1)))) <= 1).assertTrue();
      await Utils.sleep(1000)
      console.info('TestTextPickerColumnWidths003 END');
      done();
    })

  })
}