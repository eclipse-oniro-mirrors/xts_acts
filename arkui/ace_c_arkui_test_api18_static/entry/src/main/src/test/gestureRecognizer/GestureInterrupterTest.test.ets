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
import { LibUtil } from '../../../ets/pages/LibUtil';
import { Content, NodeContent } from '@ohos.arkui.node'

const libUtil: LibUtil = new LibUtil();
let rootSlot: Content = new NodeContent() as Content;

export default function gestureInterrupterTest() {

  describe('GestureInterrupterTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   GestureInterrupterTest
     * @tc.name     GestureInterrupterTest
     * @tc.desc     GestureInterrupterTest
     * @tc.level    Level.LEVEL0
     */
    it('GestureInterrupterTest', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureInterrupterTest';
      let PAGE_TAG5 = 'gestureInterrupterTest';
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let dataArray: string[] = libUtil.TestGestureInterrupter(rootSlot)
      console.log('[ui]dataArray[0]：' + dataArray[0]);
      expect(dataArray[0] != '0').assertEqual(true)
      done();
    });
  })
}