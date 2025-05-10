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

const SleepTime: number = 1000
const ColorGreen: string = '#FF00FF00'

export default function lazyForEachReloadAllItemsTest() {

  describe('LazyForEachReloadAllItemsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_RELOADALLITEMS_0100
     * @tc.name       : testLazyForEachReloadAllItems001
     * @tc.desc       : testing alignment for customDialog with normal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachReloadAllItems001', 0, async (done: Function) => {
      await Utils.pushPage(`lazyforeach/LazyForEachReloadAllItemsTest`)
      await Utils.clickComponent("btn")
      await Utils.sleep(SleepTime)
      expect(Utils.getComponentInfoByKey('col').$attrs.backgroundColor).assertEqual(ColorGreen)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_RELOADALLITEMS_0200
     * @tc.name       : testLazyForEachReloadAllItems002
     * @tc.desc       : testing alignment for customDialog with normal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachReloadAllItems002', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachReloadAllItems002()).assertEqual(0)
      done()
    })

  })
}