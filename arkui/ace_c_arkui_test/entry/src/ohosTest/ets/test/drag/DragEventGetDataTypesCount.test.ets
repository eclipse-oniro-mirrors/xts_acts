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

export default function DragEventGetDataTypesCountTest() {

  describe('DragEventGetDataTypesCountTest', () => {

    let PAGE_TAG = 'DragEventGetDataTypesCountTest';

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`drag/${PAGE_TAG}`, done);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DragEvent_GetDataTypesCount_0100
     * @tc.name       : DragEventGetDataTypesCountTest001
     * @tc.desc       : testing DisableDefaultDropAnimation DragEvent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragEventGetDataTypesCountTest001', 0, async (done: Function) => {
      console.info('DragEventGetDataTypesCountTest001 START');
      let rect = Utils.getDragComponentRect('getDataTypesCountTest');
      console.info("DragEventGetDataTypesCountTest001 getDataTypesCountTest is " + JSON.stringify(rect));
      let downX = rect.left + (rect.right - rect.left) / 2;
      let downY = rect.top + (rect.bottom - rect.top) / 2;
      let rectOne = Utils.getDragComponentRect('dragArea');
      console.info("DragEventGetDataTypesCountTest001 dragArea is " + JSON.stringify(rectOne));
      let upX = rectOne.left + (rectOne.right - rectOne.left) / 2;
      let upY = rectOne.top + (rectOne.bottom - rectOne.top) / 2;
      await Utils.drag(downX, downY, upX, upY, 10);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('getDataTypesCountTest').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();
    })

  })
}
