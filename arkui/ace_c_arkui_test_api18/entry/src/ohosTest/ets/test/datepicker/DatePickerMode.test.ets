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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function datePickerTest(){

  describe('DatePickerTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })


    /**
     * @tc.name   testDatePickerMode001
     * @tc.number testDatePickerMode001
     * @tc.desc   testDatePickerMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerMode001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestDatePickerMode';
      await Utils.pushPage(`datePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('datePickerMode1');
      console.log('testDatePickerMode001' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      expect(JSON.parse(strJson).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
      done();
    });

    /**
     * @tc.name   testDatePickerMode002
     * @tc.number SUB_ARKUI_CAPI_POST_FRAME_0200
     * @tc.desc   testing DatePicker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerMode002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestDatePickerMode';
      await Utils.pushPage(`datePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('datePickerMode2');
      console.log('testDatePickerMode002' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      expect(JSON.parse(strJson).$attrs.constructor.mode).assertEqual('DatePickerMode.YEAR_AND_MONTH');
      done();
    });

    /**
     * @tc.name   testDatePickerMode003
     * @tc.number SUB_ARKUI_CAPI_POST_FRAME_0300
     * @tc.desc   testing DatePicker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerMode003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestDatePickerMode';
      await Utils.pushPage(`datePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('datePickerMode3');
      console.log('testDatePickerMode003' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      expect(JSON.parse(strJson).$attrs.constructor.mode).assertEqual('DatePickerMode.MONTH_AND_DAY');
      done();
    });
  })
}