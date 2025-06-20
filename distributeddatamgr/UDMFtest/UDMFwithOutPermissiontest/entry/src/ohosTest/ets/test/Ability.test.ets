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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ttt]'

export default function dragWithOutPPermissionTest() {
  describe('DragWithOutPPermissionTest', () => {
    beforeAll(() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    beforeEach(() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    afterEach(() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    afterAll(() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `removeAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('201');
      }
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {

      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.CROSS_APP);
        console.info(TAG, `removeAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('201');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        console.info(TAG, `removeAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('201');
      }
    })
  })
}