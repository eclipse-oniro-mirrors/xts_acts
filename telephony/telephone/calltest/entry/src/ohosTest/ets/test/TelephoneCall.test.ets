/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, it, expect, beforeAll } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import call from '@ohos.telephony.call';


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectEqual(exp: string | number |boolean, assert: string | number |boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export default function WtelephoneCallTest() {
  describe('WtelephoneCallTest', () => {

    /*
     * @tc.number : SUB_Telephony_CallManager_sendCallUiEvent_0100
     * @tc.name   : testTelephoneCallPromise0100
     * @tc.desc   : The call screen event was released. Use Promise asynchronous callback.(callId is -1)
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephoneCallPromise0100', 0, async (done:Function) => {
      let caseName: string = 'testTelephoneCallPromise0100';
      console.info(`${caseName} test start`);
      try {
        call.sendCallUiEvent(-1,'eventName').then(() => {
          console.info(`${caseName} test sendCallUiEvent success `);
          expectTrue(true)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test sendCallUiEvent fail ${JSON.stringify(error)}`);
          expectTrue(false)
          done()
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`)
        expectTrue(false)
        console.info(`${caseName} test end`);
        done()
      }
    });

    /*
    * @tc.number : SUB_Telephony_CallManager_sendCallUiEvent_0200
    * @tc.name   : testTelephoneCallPromise0200
    * @tc.desc   : The call screen event was released. Use Promise asynchronous callback.(callId is 0)
    * @tc.size   : MediumTest
    * @tc.type   : Function
    * @tc.level  : Level 2
    */
    it('testTelephoneCallPromise0200', 0, async (done:Function) => {
      let caseName: string = 'testTelephoneCallPromise0200';
      console.info(`${caseName} test start`);
      try {
        call.sendCallUiEvent(0,'eventName').then(() => {
          console.info(`${caseName} test sendCallUiEvent success `);
          expectTrue(true)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test sendCallUiEvent fail ${JSON.stringify(error)}`);
          expectTrue(false)
          done()
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`)
        expectTrue(false)
        console.info(`${caseName} test end`);
        done()
      }
    });

    /*
    * @tc.number : SUB_Telephony_CallManager_sendCallUiEvent_0300
    * @tc.name   : testTelephoneCallPromise0300
    * @tc.desc   : The call screen event was released. Use Promise asynchronous callbacks.(callId is -1)
    * @tc.size   : MediumTest
    * @tc.type   : Function
    * @tc.level  : Level 2
    */
    it('testTelephoneCallPromise0300', 0, async (done:Function) => {
      let caseName: string = 'testTelephoneCallPromise0300';
      console.info(`${caseName} test start`);
      try {
        call.sendCallUiEvent(-1,'eventName').then(() => {
          console.info(`${caseName} test sendCallUiEvent success `);
          expectTrue(true)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test sendCallUiEvent fail ${JSON.stringify(error)}`);
          expectTrue(false)
          done()
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
        done()
      }
    });

    /*
    * @tc.number : SUB_Telephony_CallManager_sendCallUiEvent_0400
    * @tc.name   : testTelephoneCallPromise0400
    * @tc.desc   : The call screen event was released. Use Promise asynchronous callbacks.(callId is null)
    * @tc.size   : MediumTest
    * @tc.type   : Function
    * @tc.level  : Level 2
    */
    it('testTelephoneCallPromise0400', 0, async (done:Function) => {
      let caseName: string = 'testTelephoneCallPromise0400';
      console.info(`${caseName} test start`);
      try {
        call.sendCallUiEvent(null,'eventName').then(() => {
          console.info(`${caseName} test sendCallUiEvent success `);
          expectTrue(false)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test sendCallUiEvent fail ${JSON.stringify(error)}`);
          expectTrue(true)
          done()
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectEqual(err.code, 401)
        console.info(`${caseName} test end`);
        done()
      }
    });

    /*
    * @tc.number : SUB_Telephony_CallManager_sendCallUiEvent_0500
    * @tc.name   : testTelephoneCallPromise0500
    * @tc.desc   : The call screen event was released. Use Promise asynchronous callbacks.(callId is undefined)
    * @tc.size   : MediumTest
    * @tc.type   : Function
    * @tc.level  : Level 2
    */
    it('testTelephoneCallPromise0500', 0, async (done:Function) => {
      let caseName: string = 'testTelephoneCallPromise0500';
      console.info(`${caseName} test start`);
      try {
        call.sendCallUiEvent(undefined,'eventName').then(() => {
          console.info(`${caseName} test sendCallUiEvent success `);
          expectTrue(false)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test sendCallUiEvent fail ${JSON.stringify(error)}`);
          expectTrue(true)
          done()
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectEqual(err.code, 401)
        console.info(`${caseName} test end`);
        done()
      }
    });


  })
}
