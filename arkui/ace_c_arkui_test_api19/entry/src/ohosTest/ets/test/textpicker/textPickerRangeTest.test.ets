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

import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textPickerRangeTest() {

  describe('TextPickerRangeTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextPicker001
     * @tc.number SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.desc   testing TextPicker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPicker001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'testTextPickerRange';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('textpicker');
      console.log('testTextPickerMode001' + JSON.stringify(JSON.parse(strJson).$attrs.range));
      expect(JSON.parse(strJson).$attrs.range).assertEqual('[\"icon:resource://base/media/icon.png,text:video\",\"icon:,text:test'+
        '\",\"icon:,text:\"]');
      done();
    });

    /**
     * @tc.name   testTextPicker002
     * @tc.number SUB_ARKUI_CAPI_POST_FRAME_0200
     * @tc.desc   testing TextPicker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPicker002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'testTextPickerRange';
      await Utils.pushPage(`textPicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('textpicker2');
      console.log('testTextPickerMode002' + JSON.stringify(JSON.parse(strJson).$attrs.range));
      expect(JSON.parse(strJson).$attrs.range).assertEqual('[{\"text\":\"test1\", \"children\":[{\"text\":\"te'+
        'st2\"},{\"text\":\"test3\"},{\"text\":\"test4\"}]},{\"text\":\"test5\"},{\"text\":\"test6\"}]');
      done();
    });
  })
}