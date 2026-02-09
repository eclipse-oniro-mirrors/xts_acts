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

import { expect, describe, it, Level, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function NotifyDragTest(){

  describe('NotifyDragTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })


    /**
     * @tc.name   NotifyDragTest_001
     * @tc.number NotifyDragTest_001
     * @tc.desc   NotifyDragTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NotifyDragTest_001', Level.LEVEL0, async (done: Function) => {
      let PAGE_TAG = 'TestNotifyDragTest';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info('NotifyDragTest_001 START');
      let rect = Utils.getDragComponentRect('getDataTypesCountTest');
      console.info("NotifyDragTest_001 getDataTypesCountTest is " + JSON.stringify(rect));
      let downX = Math.round(globalThis.winLeft + rect.left + (rect.right - rect.left) / 2);
      let downY = Math.round(globalThis.winTop + rect.top + (rect.bottom - rect.top) / 2);
      let rectOne = Utils.getDragComponentRect('dragArea');
      console.info("NotifyDragTest_001 dragArea is " + JSON.stringify(rectOne));
      let upX = Math.round(globalThis.winLeft + rectOne.left + (rectOne.right - rectOne.left) / 2);
      let upY = Math.round(globalThis.winTop + rectOne.top + (rectOne.bottom - rectOne.top) / 2);
      let driver: Driver = Driver.create();
      await driver.drag(downX, downY, upX, upY, 10);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('text1_id').$attrs.backgroundColor).assertEqual('#FF00FF00');
      expect(Utils.getComponentInfoByKey('text2_id').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();

    });
  })
}