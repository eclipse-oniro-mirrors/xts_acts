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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function NodeUtilsReturnTest(){

  describe('NodeUtilsReturnTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   NodeUtilsReturnTest_001
     * @tc.number SUB_ARKUI_NodeUtilsReturnTest_001
     * @tc.desc   Test nodeUtils return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeUtilsReturnTest_001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetPositionGetSize';
      await Utils.pushPage(`nodeUtil/${PAGE_TAG}`);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnDrawTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}