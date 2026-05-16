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
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import {LibUtil} from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil();

export default function swiperOnSelectTest() {

  describe('SwiperOnSelectTest',() => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
    })

    
    /**
     * @tc.number   testSwiperOnSelect001
     * @tc.name     testSwiperOnSelect001
     * @tc.desc     testSwiperOnSelect001
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperOnSelect001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'SwiperOnSelectTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('OnSelectTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      done();
    });
  })
}
