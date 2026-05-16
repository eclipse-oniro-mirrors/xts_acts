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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext'

export default function calendarPickerOnChangeTest() {

  describe('CalendarPickerOnChangeTest', () => {
    let PAGE_TAG = 'CalendarPickerOnChangeTest';
    await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
    const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!

    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await Utils.pushPage(`calendarpicker/${PAGE_TAG}`, false);
      console.info("[ui] beforeAll end");
    });


    
    /**
     * @tc.number   testCalendarPickerOnChange001
     * @tc.name     testCalendarPickerOnChange001
     * @tc.desc     testCalendarPickerOnChange001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerOnChange001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log('Utils.getComponentRect start')
      let Rect = Utils.getComponentRect('calendarPickerOnChangeTest')
      console.log('Utils.getComponentRect end')
      Utils.clickLocation(Math.round((AppStorage.get<number>('winLeft')!).toDouble() + Rect.right - uiContext.vp2px(5)).toInt(),
        Math.round((AppStorage.get<number>('winTop')!).toDouble() + Rect.bottom - uiContext.vp2px(5)).toInt())
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('calendarPickerOnChangeTest')
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })
  })
}
