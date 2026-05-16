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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { Driver } from '@kit.TestKit';

export default function DragEventGetDropOperationTest() {

  describe('DragEventGetDropOperationTest', () => {

    let PAGE_TAG = 'DragEventGetDropOperationTest';

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`drag/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   DragEventGetDropOperationTest001
     * @tc.number SUB_ARKUI_CAPI_DragEvent_GetDropOperation_0100
     * @tc.desc   testing DisableDefaultDropAnimation DragEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragEventGetDropOperationTest001', Level.LEVEL1, async (done: Function) => {
      console.info('DragEventGetDropOperationTest001 START');
      let rect = Utils.getDragComponentRect('GetDropOperation');
      console.info("DragEventGetDropOperationTest001 GetDropOperation is " + JSON.stringify(rect));
      let downX = Math.round(globalThis.winLeft + rect.left + (rect.right - rect.left) / 2);
      let downY = Math.round(globalThis.winTop + rect.top + (rect.bottom - rect.top) / 2);
      let rectOne = Utils.getDragComponentRect('textDragTest2');
      console.info("DragEventGetDropOperationTest001 textDragTest2 is " + JSON.stringify(rectOne));
      let upX = Math.round(globalThis.winLeft + rectOne.left + (rectOne.right - rectOne.left) / 2);
      let upY = Math.round(globalThis.winTop + rectOne.top + (rectOne.bottom - rectOne.top) / 2);
      let driver: Driver = Driver.create();
      await driver.drag(downX, downY, upX, upY, 400);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('GetDropOperation').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();
    })

  })
}
