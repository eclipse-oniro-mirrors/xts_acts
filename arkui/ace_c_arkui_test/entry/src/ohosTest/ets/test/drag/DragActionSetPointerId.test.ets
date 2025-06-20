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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { Driver } from '@kit.TestKit';

export default function DragActionSetPointerIdTest() {

  describe('DragActionSetPointerIdTest', () => {

    let PAGE_TAG = 'DragActionSetPointerIdTest';

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`drag/${PAGE_TAG}`, done);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DragActionSetPointerId_0100
     * @tc.name       : DragActionSetPointerIdTest001
     * @tc.desc       : testing DragActionSetPointerId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionSetPointerIdTest001', 0, async (done: Function) => {
      console.info('DragActionSetPointerIdTest001 START');
      let rect = Utils.getDragComponentRect('textDragTest1');
      console.info("DragActionSetPointerIdTest001 textDragTest1 is " + JSON.stringify(rect));
      let downX = Math.round(globalThis.winLeft + rect.left + (rect.right - rect.left) / 2);
      let downY = Math.round(globalThis.winTop + rect.top + (rect.bottom - rect.top) / 2);
      let rectOne = Utils.getDragComponentRect('textDragTest2');
      console.info("DragActionSetPointerIdTest001 textDragTest2 is " + JSON.stringify(rectOne));
      let upX = Math.round(globalThis.winLeft + rectOne.left + (rectOne.right - rectOne.left) / 2);
      let upY = Math.round(globalThis.winTop + rectOne.top + (rectOne.bottom - rectOne.top) / 2);
      let driver: Driver = Driver.create();
      await driver.drag(downX, downY, upX, upY, 10);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('textDragTest1').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();
    })

  })
}
