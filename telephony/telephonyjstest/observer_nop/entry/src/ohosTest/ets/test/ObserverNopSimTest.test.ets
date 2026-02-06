/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import observer from '@ohos.telephony.observer';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function observerNopSimTest() {
  describe('observerNopSimTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testObserverOnGetSimActiveStateNop0100
     * @tc.number SUB_Observer_OnGetSimActiveState_Nop_0100
     * @tc.desc   Using the observer onGetSimActiveState method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testObserverOnGetSimActiveStateNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testObserverOnGetSimActiveStateNop0100';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = 0;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectFail();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code === 201);
        done();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testObserverOffGetSimActiveStateNop0100
     * @tc.number SUB_Observer_OffGetSimActiveState_Nop_0100
     * @tc.desc   Using the observer offGetSimActiveState method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testObserverOffGetSimActiveStateNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testObserverOffGetSimActiveStateNop0100';
      console.info(`${caseName} test start`);
      try {
        observer.offGetSimActiveState((data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectFail();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code === 201);
        done();
      }
      console.info(`${caseName} test end`);
    })
  })
}

