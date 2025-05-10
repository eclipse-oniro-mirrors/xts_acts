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

import { expect, describe, it, afterEach, beforeAll ,Level} from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'
import Utils from '../common/Utils'
import nativeRender from 'libnativerender.so'

export default function gestureInterrupterTest(){

  describe('GestureInterrupterTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_GESTURE_INTERRUPTER_CASE_001
     * @tc.name       : GestureInterrupterTest
     * @tc.desc       : testing List lanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('GestureInterrupterTest', Level.LEVEL0, async (done: Function) => {
      let PAGE_TAG = 'GestureInterrupterTest';
      let PAGE_TAG5 = 'gestureInterrupterTest';
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let dataArray: string[] = nativeRender.TestGestureInterrupter(PAGE_TAG5)
      expect(dataArray[0] != '0').assertEqual(true)
      done();
    });
  })
}