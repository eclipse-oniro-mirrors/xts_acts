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

import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium'
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

const SLOT_0: number = 0;
const SLOT_1: number = 1;

let isSim0Active: Boolean = false;
let isSim1Active: Boolean = false;
let hasCard0: Boolean = false;
let hasCard1: Boolean = false;

const ExpectTrue = (n: boolean) => {
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

export default function telephonyRadioNoPermissionPublicTest() {

  describe('telephonyRadioNoPermissionPublicTest', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      try {
        hasCard0 = sim.hasSimCardSync(SLOT_0);
        hasCard1 = sim.hasSimCardSync(SLOT_1);
        isSim0Active = sim.isSimActiveSync(SLOT_0);
        isSim1Active = sim.isSimActiveSync(SLOT_1);
        if (hasCard0) {
          console.info(`RTS--hasSimCard 0`);
        }
        if (hasCard1) {
          console.info(`RTS--hasSimCard 1`);
        }
        if (isSim0Active) {
          console.info(`RTS--isSimActiveSync 0`);
        }
        if (isSim1Active) {
          console.info(`RTS--isSimActiveSync 1`);
        }
        done();
      } catch (err) {
        console.info(`an error occurred to check SIM card activation status, ${JSON.stringify(err)}`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0150
     * @tc.name  : testTelephonyRadioGetRadioTech0150
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetRadioTech0150', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0150';
      console.info(`${caseName} test start`);
      if (!isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        radio.getRadioTech(SLOT_0, (err: BusinessError, data: radio.NetworkRadioTech) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} callback: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0250
     * @tc.name  : testTelephonyRadioGetRadioTech0250
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetRadioTech0250', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0250';
      console.info(`${caseName} test start`);
      if (!isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        try {
          let data = await radio.getRadioTech(SLOT_0);
          console.info(`${caseName} Promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        } catch (err) {
          console.info(`${caseName} Promise: err->${err}`);
          ExpectTrue(err.code === 201);
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_1400
     * @tc.name  : testTelephonyRadioGetNetworkState1400
     * @tc.desc  : No permission to obtain network status.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkState0140', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0140';
      console.info(`${caseName} test start`);
      try {
        if (!isSim0Active) {
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
        else {
          radio.getNetworkState((err: BusinessError, Radio: radio.NetworkState) => {
            if (err) {
              console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
              ExpectTrue(err.code === 201);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} success, callback: Radio->${JSON.stringify(Radio)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          });
        }
      } catch {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_1500
     * @tc.name  : testTelephonyRadioGetNetworkState1500
     * @tc.desc  : No permission to obtain network status.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkState1500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState1500';
      console.info(`${caseName} test start`);
      try {
        if (!isSim0Active) {
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
        else {
          radio.getNetworkState(SLOT_0, (err: BusinessError, Radio: radio.NetworkState) => {
            if (err) {
              console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
              ExpectTrue(err.code === 201);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} success, callback: Radio->${JSON.stringify(Radio)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          });
        }
      } catch {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_1600
     * @tc.name  : testTelephonyRadioGetNetworkState1600
     * @tc.desc  : No permission to obtain network status.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetNetworkState1600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState1600';
      console.info(`${caseName} test start`);
      try {
        if (!isSim0Active) {
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
        else {
          radio.getNetworkState(SLOT_0).then((Radio: radio.NetworkState) => {
            console.info(`${caseName} success, promise: Radio->${JSON.stringify(Radio)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            console.info(`${caseName} test end`);
            done();
          });
        }
      } catch {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0150
     * @tc.name  : testTelephonyRadioIsRadioOn0150
     * @tc.desc  : Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsRadioOn0150', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0150';
      console.info(`${caseName} test start`);
      if (!isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        radio.isRadioOn(SLOT_0, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0250
     * @tc.name  : testTelephonyRadioIsRadioOn0250
     * @tc.desc  : Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsRadioOn0250', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0250';
      console.info(`${caseName} test start`);
      if (!isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        radio.isRadioOn(SLOT_0).then((data: boolean) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          console.info(`${caseName} test end`);
          done();
        });
      }
    });

    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      let mode0: radio.PreferredNetworkMode = radio.PreferredNetworkMode.PREFERRED_NETWORK_MODE_NR_LTE_TDSCDMA_WCDMA_GSM_EVDO_CDMA;
      await radio.setPreferredNetwork(SLOT_0, mode0);
      await radio.setPreferredNetwork(SLOT_1, mode0);
    });
  });

}