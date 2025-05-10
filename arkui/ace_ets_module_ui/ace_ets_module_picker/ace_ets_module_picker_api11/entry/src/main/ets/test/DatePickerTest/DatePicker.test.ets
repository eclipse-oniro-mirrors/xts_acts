/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';

export default function ActsDatePickerTest() {
  describe('ActsDatePickerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/DatePicker',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePicker state success " + JSON.stringify(pages));
        if (!("DatePicker" == pages.name)) {
          console.info("get DatePicker state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push DatePicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePicker page error: " + err);
      }
      done()
    });
    it('Stage_DatePicker_Test_0010', 0, async (done: Function) => {
      console.info('Stage_DatePicker_Test_0010 START');
      try{
        let strJson = getInspectorByKey('Stage_DatePicker_Test_0010');
        console.info('Stage_DatePicker_Test_0010 START  :'+ JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("Stage_DatePicker_Test_0010 obj is: " + JSON.stringify(obj));
        let onDateChange: undefined = obj.$attrs.onDateChange
        expect(typeof onDateChange).assertEqual("undefined")
        let DatePickerDialog: DatePickerDialogOptions = {
          onDateAccept: (value: Date) => {
            console.info("DatePickerDialog:onAccept()" + value.toString())
          },
          onDateChange: (value: Date) => {
            console.info("DatePickerDialog:onChange()" + value.toString())
          }}
        console.info("Stage_DatePicker_Test_0010 InsertValue is: " + JSON.stringify(DatePickerDialog))
        expect(typeof DatePickerDialog.onDateAccept).assertEqual("function")
        expect(typeof DatePickerDialog.onDateChange).assertEqual("function")
        console.info('Stage_DatePicker_Test_0010 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_DatePicker_Test_0010 ERR  '+ JSON.stringify(err));
      }
      done();
    });

  })
}