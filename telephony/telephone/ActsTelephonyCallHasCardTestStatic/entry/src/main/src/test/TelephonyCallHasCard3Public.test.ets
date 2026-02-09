/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import call from '@ohos.telephony.call';
import { BusinessError, AsyncCallback } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
let isSimActive: boolean = sim.isSimActiveSync(0);
const phoneNumber: string = "15617922808";
const zonePhoneNumber: string = "+8615617922808";
const formatPhoneNumber: string = "156-1792-2808";
const emergencyPhoneNumber: string = "911";
const landlineNumber: string = "057126885879";
const telphoneErr: string = '+861xxxxxxxxxxx';
const CALL_NUMBER = '10086';

export default function HasCard2PublicNeedCardTest() {
  describe('TelephonyCallHasCard2PublicNeedCardTest', (): void => {

    /**
     * @tc.name   testTelephonyCallManagerHasCallSync0200
     * @tc.number SUB_Telephony_CallManager_HasCallSync_0200
     * @tc.desc   Determine whether there is a phone call api10+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerHasCallSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerHasCallSync0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          hilog.info(domain, tag, '%{public}s', caseName +'success, has call is'+JSON.stringify(hasCall));
          ExpectTrue(hasCall == false);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName +'  catch fail, err->'+JSON.stringify(err));
          ExpectFail();
          done();
        }
      } else {
        hilog.info(domain, tag, '%{public}s', caseName +' the sim is active: false');
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerGetCallStateSync0200
     * @tc.number SUB_Telephony_CallManager_GetCallStateSync_0200
     * @tc.desc   Get the current call status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerGetCallStateSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerGetCallStateSync0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          if (hasCall == false) {
            hilog.info(domain, tag, '%{public}s', caseName +'hasCallSync success, no call exists');
            let callState: number = call.getCallStateSync();
            hilog.info(domain, tag, '%{public}s', caseName +'getCallState success, data->'+JSON.stringify(callState));
            ExpectTrue(callState == 0);
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'hasCallSync fail, call exists');
            ExpectFail();
            done();
          }
        } catch (err) {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      } else {
        console.info(`${caseName} the sim is active: false`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

  });
}