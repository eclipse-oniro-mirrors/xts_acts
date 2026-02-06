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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;

export default function SwiperMaxDisplayCountTest() {
  describe('SwiperMaxDisplayCountTest', () => {
    /**
     * @tc.number  : SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0100
     * @tc.name    : testArkUIACESwiperMaxDisplayCountTest0100
     * @tc.desc    : testing OH_ArkUI_SwiperIndicator_SetMaxDisplayCount interface.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACESwiperMaxDisplayCountTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0400 start====");
          await Utils.sleep(500);
          let result: number = libnativetype.SetSwiperIndicatorMaxDisplayCount(9);
          console.log('res=?' + result)
          console.info("====>SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0100 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0200
     * @tc.name    : testArkUIACESwiperMaxDisplayCountTest0200
     * @tc.desc    : testing OH_ArkUI_SwiperIndicator_SetMaxDisplayCount interface.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACESwiperMaxDisplayCountTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0200 start====");
          await Utils.sleep(500);
          let result: number = libnativetype.SetSwiperIndicatorMaxDisplayCount(10);
          console.log('res=?' + result)
          console.info("====>SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0200 result: " + result);
          expect(result).assertEqual(401);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_SwiperMaxDisplayCountTest_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
  })
}
