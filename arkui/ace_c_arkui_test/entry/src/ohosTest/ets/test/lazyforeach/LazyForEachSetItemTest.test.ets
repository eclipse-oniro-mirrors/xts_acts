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

const SleepTime: number = 2000
const ColorGreen: string = '#FF00FF00'

export default function lazyForEachSetItemTest() {

  describe('LazyForEachSetItemTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testLazyForEachSetItem001
     * @tc.number SUB_ARKUI_CAPI_LAZYFOREACH_SETITEM_0100
     * @tc.desc   testing setItem for lazyForEach with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLazyForEachSetItem001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`lazyforeach/LazyForEachSetNodeIdTest`);
      await Utils.sleep(SleepTime)
      expect(Utils.getComponentInfoByKey('gridItem0').$attrs.backgroundColor).assertEqual(ColorGreen)
      done()
    })

    /**
     * @tc.name   testLazyForEachSetItem002
     * @tc.number SUB_ARKUI_CAPI_LAZYFOREACH_SETITEM_0300
     * @tc.desc   testing setItem for lazyForEach with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLazyForEachSetItem002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLazyForEachSetItem002()).assertEqual(0)
      done()
    })

  })
}