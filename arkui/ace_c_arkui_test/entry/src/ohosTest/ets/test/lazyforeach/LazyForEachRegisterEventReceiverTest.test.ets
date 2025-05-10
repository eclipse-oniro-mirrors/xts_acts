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

export default function lazyForEachRegisterEventReceiverTest() {

  describe('LazyForEachRegisterEventReceiverTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_REGISTEREVENTRECEIVER_0100
     * @tc.name       : testLazyForEachRegisterEventReceiver001
     * @tc.desc       : testing registerEventReceiver for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachRegisterEventReceiver001', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachRegisterEventReceiver001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_REGISTEREVENTRECEIVER_0200
     * @tc.name       : testLazyForEachRegisterEventReceiver002
     * @tc.desc       : testing registerEventReceiver for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachRegisterEventReceiver002', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachRegisterEventReceiver002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_REGISTEREVENTRECEIVER_0300
     * @tc.name       : testLazyForEachRegisterEventReceiver003
     * @tc.desc       : testing registerEventReceiver for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachRegisterEventReceiver003', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachRegisterEventReceiver003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_REGISTEREVENTRECEIVER_0400
     * @tc.name       : testLazyForEachRegisterEventReceiver004
     * @tc.desc       : testing registerEventReceiver for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachRegisterEventReceiver004', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachRegisterEventReceiver004()).assertEqual(0)
      done()
    })

  })
}