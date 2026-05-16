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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import radio from '@ohos.telephony.radio';
import sim from '@ohos.telephony.sim';

let domain: Int = 0x0000;
let tag: string = 'TelephonyRadioPublic1Static';
const SLOT_0: int = 0;
const SLOT_1: int = 1;
const SLOT_2: int = -1;
const SLOT_3: int = 1000000;

let isSim0Active: boolean = false;


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

export default function TelephonyRadioPublic1Static() {
  describe('TelephonyRadioPublic1Static', () => {


    /**
    * @tc.number SUB_Telephony_Radio_IsRadioOn_0900
    * @tc.name   testTelephonyRadioIsRadioOn_static_0900
    * @tc.desc   Check if the Radio is turned on. Use Promise asynchronous callback.
    * @tc.size   SmallTest
    * @tc.type   Function
    * @tc.level  Level 3
    */
    it("testTelephonyRadioIsRadioOn_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_0900';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let simState: sim.SimState = sim.getSimStateSync(0);
          if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            let isSimActive = sim.isSimActiveSync(SLOT_0);
            if (isSimActive === true) {
              radio.isRadioOn(SLOT_0).then((data: boolean) => {
                hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
                expect(data).assertTrue();
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.error(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
                expect().assertFail();
                hilog.error(domain, tag, `${caseName} test end`);
                done();
              });
            } else {
              hilog.info(domain, tag, `${caseName} SIM not activated`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          }
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0100
     * @tc.name   testTelephonyRadioGetISOCountryCodeForNetworkAsync0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it("testTelephonyRadioGetISOCountryCodeForNetworkAsync0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          if (isSim0Active) {
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            radio.getISOCountryCodeForNetwork(SLOT_0, (err: BusinessError<void> | null, data: string | undefined) => {
              if (err?.code !== 0) {
                hilog.error(domain, tag, `${caseName} failed, err->${JSON.stringify(err)}`);
                expect().assertFail();
                hilog.error(domain, tag, `${caseName} test end`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
                expect(true).assertEqual(typeof data === 'string');
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              }
            });
          }
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0100
     * @tc.name   testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it("testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          if (isSim0Active) {
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            radio.getISOCountryCodeForNetwork(SLOT_0).then((data: string) => {
              hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
              expect(true).assertEqual(typeof data === 'string');
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.error(domain, tag, `${caseName} failed, err->${JSON.stringify(err)}`);
              expect().assertFail();
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            });
          }
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
    * @tc.number SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Sync_0100
    * @tc.name   testTelephonyRadioGetISOCountryCodeForNetworkSync_static_0100
    * @tc.desc   slotId parameter input is 0,isSim0Active is true
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 1
    */
    it("testTelephonyRadioGetISOCountryCodeForNetworkSync_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkSync_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          if (isSim0Active) {
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            try {
              let data = radio.getISOCountryCodeForNetworkSync(SLOT_0);
              hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
              expect(true).assertEqual(typeof data === 'string');
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            } catch (error) {
              let err = error as BusinessError;
              hilog.error(domain, tag, `${caseName} failed, err->${JSON.stringify(err)}`);
              expect().assertFail();
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            }
          }
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_Telephony_Radio_GetRadioTech_0100
     * @tc.name   testTelephonyRadioGetRadioTech_static_0100
     * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it("testTelephonyRadioGetRadioTech_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          sim.hasSimCard(SLOT_0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data === true) {
              radio.getRadioTech(SLOT_0,
                (err: BusinessError<void> | null, data: radio.NetworkRadioTech | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`);
                    expect().assertFail();
                    hilog.error(domain, tag, `${caseName} test end`);
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName} test end`);
                    done();
                  }
                });
            } else {
              hilog.info(domain, tag, `${caseName}: No SIM card`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
    * @tc.number SUB_Telephony_Radio_GetRadioTech_0700
    * @tc.name   testTelephonyRadioGetRadioTech_static_0700
    * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 3
    */
    it("testTelephonyRadioGetRadioTech_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let data = await sim.hasSimCard(SLOT_0);
            if (data === true) {
              try {
                let data = await radio.getRadioTech(SLOT_0);
                hilog.info(domain, tag, `${caseName} success, Promise: data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              } catch (error) {
                let err = error as BusinessError;
                hilog.error(domain, tag, `${caseName} failed, Promise: err->${err}`);
                expect().assertFail();
                hilog.error(domain, tag, `${caseName} test end`);
                done();
              }
            } else {
              hilog.info(domain, tag, `${caseName}: No SIM card`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          } catch (err) {
            console.error('hasSimCard failed: ' + err);
          }
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
  });

    /**
    * @tc.number SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0100
    * @tc.name   testTelephonyRadioGetNetworkSelectionModeAsync_static_0100
    * @tc.desc   slotId parameter input is 0,isSim0Active is true
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 1
    */
    it('testTelephonyRadioGetNetworkSelectionModeAsync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
        hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      } else {
        if (isSim0Active) {
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
        else {
          radio.getNetworkSelectionMode(SLOT_0, (err: BusinessError<void> | null, data: radio.NetworkSelectionMode | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} failed, err->${JSON.stringify(err)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
            else {
              hilog.info(domain, tag, `${caseName} success, data is: ` + data);
              expect(data == radio.NetworkSelectionMode.NETWORK_SELECTION_AUTOMATIC ||
                data == radio.NetworkSelectionMode.NETWORK_SELECTION_MANUAL ||
                data == radio.NetworkSelectionMode.NETWORK_SELECTION_UNKNOWN).assertTrue();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        }
      }
    });  
  
    /**
     * @tc.number SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0100
     * @tc.name   testTelephonyRadioGetNetworkSelectionModePromise_static_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      } else {
        if (isSim0Active) {
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          radio.getNetworkSelectionMode(SLOT_0).then((data: radio.NetworkSelectionMode) => {
            hilog.info(domain, tag, `${caseName} success, data is: ` + data);
            expect(data == radio.NetworkSelectionMode.NETWORK_SELECTION_AUTOMATIC ||
              data == radio.NetworkSelectionMode.NETWORK_SELECTION_MANUAL ||
              data == radio.NetworkSelectionMode.NETWORK_SELECTION_UNKNOWN).assertTrue();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} failed, err->${JSON.stringify(err)}`);
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          });
        }
      }
    });  
}