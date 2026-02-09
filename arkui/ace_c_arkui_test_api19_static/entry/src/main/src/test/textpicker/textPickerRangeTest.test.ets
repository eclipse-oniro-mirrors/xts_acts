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

import { expect, describe, it, afterEach, Level, beforeAll  } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

let libUtil:LibUtil = new LibUtil();

export default function textPickerRangeTest() {

  describe('TextPickerRangeTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api19.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testTextPicker001
     * @tc.name     testTextPicker001
     * @tc.desc     testTextPicker001
     * @tc.level    Level.LEVEL1
     */
    it('testTextPicker001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'testTextPickerRange';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('textpicker');
      console.log('testTextPickerMode001' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('range')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('range')).assertEqual('[\"icon:resource://base/media/icon.png,text:video\",\"icon:,text:test'+
        '\",\"icon:,text:\"]');
      done();
    });

    
    /**
     * @tc.number   testTextPicker002
     * @tc.name     testTextPicker002
     * @tc.desc     testTextPicker002
     * @tc.level    Level.LEVEL1
     */
    it('testTextPicker002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'testTextPickerRange';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('textpicker2');
      console.log('testTextPickerMode002' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('range')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('range')).assertEqual('[{\"text\":\"test1\", \"children\":[{\"text\":\"te'+
        'st2\"},{\"text\":\"test3\"},{\"text\":\"test4\"}]},{\"text\":\"test5\"},{\"text\":\"test6\"}]');
      done();
    });
  })
}