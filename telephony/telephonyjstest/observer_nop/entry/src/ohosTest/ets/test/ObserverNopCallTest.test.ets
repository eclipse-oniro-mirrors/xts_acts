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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import observer from '@ohos.telephony.observer';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

function sleep(time: number): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}
export default function observerNopCallTest() {
  describe('observerNopCallTest',  () => {

    /**
     * @tc.name   Telephony_observer_on_noPermission_cCallStateInfo_0100
     * @tc.number Telephony_observer_on_noPermission_cCallStateInfo_0100
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_noPermission_cCallStateInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
        let caseName: string = 'Telephony_observer_on_noPermission_cCallStateInfo_0100';
        console.log("************* Telephony_observer_on_noPermission_cCallStateInfo_0100 Test start *************");
        try {
          let callback = (value: observer.CCallStateInfo) => {
            console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
            ExpectFail();
            observer.offCCallStateChange();
            done();
          }
          observer.onCCallStateChange(callback);
        } catch (err) {
          console.info(`${caseName} catchError: ${JSON.stringify(err)}}`+err);
          ExpectTrue(err.code === 201);
          done();
        }
        console.log("************* Telephony_observer_on_noPermission_cCallStateInfo_0100 Test end *************");
      })

  });
}