/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function calendarPickerOnChangeTest() {

  describe('CalendarPickerOnChangeTest', () => {

    let PAGE_TAG = 'CalendarPickerOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`calendarpicker/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CALENDARPICKER_ONCHANGE_0100
    * @tc.name       : testCalendarPickerOnChange001
    * @tc.desc       : test onChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCalendarPickerOnChange001', Level.LEVEL1, async  (done: Function) => {
      let Rect = Utils.getComponentRect('calendarPickerOnChangeTest')
      await Utils.clickLocation(Math.round(globalThis.winLeft + Rect.right-vp2px(5)) , Math.round( globalThis.winTop + Rect.bottom-vp2px(5)))
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('calendarPickerOnChangeTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })
  })
}
