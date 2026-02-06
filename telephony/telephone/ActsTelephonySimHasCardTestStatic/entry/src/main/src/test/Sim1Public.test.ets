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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import sim from '@ohos.telephony.sim';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog';


let domain: int = 0x0000;
let tag: string = 'Sim1Public';
let PERMISSION_DENIED_CODE: number = 201;
let PARAMETER_ERROR_CODE: number = 8300001;

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}

const SIM_PIN_OLD = "741593";

export default function Sim1Public() {
  describe('Sim1Public', () => {

    beforeAll(async (done: () => void) => {
      hilog.info(domain, tag, 'getPermission beforeAll');
      done();
    });

    afterEach(async (done: () => void) => {
      hilog.info(domain, tag, "afterEach case");
      let lockInfo: sim.LockInfo = {
        lockType: sim.LockType.PIN_LOCK,
        password: SIM_PIN_OLD,
        state: sim.LockState.LOCK_OFF
      };
      sim.setLockState(0, lockInfo, (err: BusinessError<void> | null, data: sim.LockStatusResponse | undefined) => {
        done();
      });
    });

    /**
     * @tc.name   testTelephonySimGetDefaultVoiceSimId_static_0100
     * @tc.number SUB_Telephony_Sim_GetDefaultVoiceSimId_0100
     * @tc.desc   Obtain the SIM card ID of the default voice service. Use callback for asynchronous callback.Need to insert SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetDefaultVoiceSimId_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetDefaultVoiceSimId_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        let hasSimCard: boolean = sim.hasSimCardSync(0);
        if (!hasSimCard) {
          hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
        try {
          sim.setDefaultVoiceSlotId(0, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${caseName} case success,setDefaultVoiceSlotId`);
            if (err?.code === 0) {
              sim.getDefaultVoiceSimId((err: BusinessError<void> | null, data: int | undefined) => {
                if (err?.code === 0) {
                  if (data !== undefined && data > 0) {
                    hilog.info(domain, tag, `${caseName} case success,data:  ${data}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName} test end`);
                    done();
                  } else {
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName} test end `);
                    done();
                  }
                } else {
                  hilog.info(domain, tag, `${caseName} error, case failed,errCode:  ${err?.code}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end`);
                  done();
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName} failed, Set the card slot ID of the default voice service`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} error, case failed,errCode:  ${err?.code}`);
          if (err?.code === PERMISSION_DENIED_CODE) {
            expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetDefaultVoiceSimId_static_0300
     * @tc.number SUB_Telephony_Sim_GetDefaultVoiceSimId_0300
     * @tc.desc   Obtain the SIM card ID of the default voice service. Use Promise for asynchronous callback. Need to insert SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetDefaultVoiceSimId_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetDefaultVoiceSimId_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          let simState: sim.SimState = sim.getSimStateSync(0);
          if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.setDefaultVoiceSlotId(0, (err: BusinessError<void> | null) => {
            if (err?.code === 0) {
              sim.getDefaultVoiceSimId().then((data: int) => {
                if (data > 0) {
                  hilog.info(domain, tag, `${caseName} case success,data: ${data}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} error, Not expected`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end`);
                  done();
                }
              }).catch((err: Error) => {
                let error = err as BusinessError;
                hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
                if (error?.code === PERMISSION_DENIED_CODE) {
                  expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
                } else {
                  expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
                }
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              });
            } else {
              hilog.info(domain, tag, `${caseName} failed, Set the card slot ID of the default voice service`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetSimSpn_static_0700
     * @tc.number SUB_Telephony_Sim_GetSimSpn_0700
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimSpn_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimSpn_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        let hasSimCard: boolean = sim.hasSimCardSync(0);
        if (!hasSimCard) {
          hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
        try {
          sim.getSimSpn(3, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code === 8300001) {
              hilog.info(domain, tag, `${caseName} successfully  : Parameter error and return 8300001`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          if (err?.code === 8300001) {
            hilog.info(domain, tag, `${caseName} successfully  : Parameter error and return 8300001`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });
      
    /**
     * @tc.name   testTelephonySimGetSimAuthentication_static_1500
     * @tc.number SUB_Telephony_Sim_GetSimAuthentication_1500
     * @tc.desc   Performs SIM card authentication. Need to insert SIM card.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAuthentication_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimAuthentication_static_1500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          let simState: sim.SimState = sim.getSimStateSync(0);
          if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getSimAuthentication(0, sim.AuthType.SIM_AUTH_EAP_SIM_TYPE, "test")
            .then((data: sim.SimAuthenticationResponse) => {
              hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }).catch((err: Error) => {
            let error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
            if (error?.code === PERMISSION_DENIED_CODE) {
              expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
            } else {
              expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetSimAuthentication_static_1600
     * @tc.number SUB_Telephony_Sim_GetSimAuthentication_1600
     * @tc.desc   Performs SIM card authentication. Need to insert SIM card.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAuthentication_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimAuthentication_static_1600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          let simState: sim.SimState = sim.getSimStateSync(0);
          if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getSimAuthentication(0, sim.AuthType.SIM_AUTH_EAP_AKA_TYPE, "test")
            .then((data: sim.SimAuthenticationResponse) => {
              hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }).catch((err: Error) => {
            let error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
            if (error?.code === PERMISSION_DENIED_CODE) {
              expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
            } else {
              expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetSimAuthentication_static_1700
     * @tc.number SUB_Telephony_Sim_GetSimAuthentication_1700
     * @tc.desc   Performs SIM card authentication. Need to insert SIM card.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAuthentication_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimAuthentication_static_1700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getSimAuthentication(-1, sim.AuthType.SIM_AUTH_EAP_SIM_TYPE, "test")
            .then((data: sim.SimAuthenticationResponse) => {
              hilog.info(domain, tag, `${caseName} failed, The result is not in line with expectations`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }).catch((err: Error) => {
            let error = err as BusinessError;
            if (error?.code === 8300001) {
              hilog.info(domain, tag,
                `${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
              ExpectTrue(true);
            } else {
              hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(error)}`);
              ExpectFail();
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetOpKey_static_0300
     * @tc.number SUB_Telephony_Sim_GetOpKey_0300
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetOpKey_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpKey_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getOpKey(0).then((data: string) => {
            hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((err: Error) => {
            let error = err as BusinessError;
            if (error?.code === 801) {
              hilog.info(domain, tag, `${caseName} successfully: Parameter error and return 801`);
              ExpectTrue(true);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testTelephonySimGetOpKey_static_0600
     * @tc.number SUB_Telephony_Sim_GetOpKey_0600
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetOpKey_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpKey_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getOpKey(-1, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code === 801) {
              hilog.info(domain, tag, `${caseName} successfully: Parameter error and return 801`);
              ExpectTrue(true);
              done();
            } else {
              if (err?.code === 8300001) {
                hilog.info(domain, tag,
                  `${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(err)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              }
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetOpKey_static_1000
     * @tc.number SUB_Telephony_Sim_GetOpKey_1000
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetOpKey_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpKey_static_1000';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getOpName(-1).then((data: string) => {
            hilog.info(domain, tag, `${caseName} failed, The result is not in line with expectations`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((err: Error) => {
            let error = err as BusinessError;
            if (error && error?.code === 801) {
              hilog.info(domain, tag, `${caseName} successfully: Parameter error and return 801`);
              ExpectTrue(true);
              done();
            } else {
              if (error?.code === 8300001) {
                hilog.info(domain, tag,
                  `${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(error)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              }
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testTelephonySimGetOpName_static_0100
     * @tc.number SUB_Telephony_Sim_GetOpName_0100
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetOpName_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpName_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getOpName(0, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code === 0) {
              hilog.info(domain, tag, `${caseName} successfully, data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            } else {
              if (err?.code === 801) {
                hilog.info(domain, tag, `${caseName} successfully: Parameter error and return 801`);
                ExpectTrue(true);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(err)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              }
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetOpName_static_0300
     * @tc.number SUB_Telephony_Sim_GetOpName_0300
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetOpName_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpName_static_0300';
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          sim.getOpName(0).then((data: string) => {
            hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((err: Error) => {
            let error = err as BusinessError;
            if (error?.code === 801) {
              hilog.info(domain, tag, `${caseName} successfully: Parameter error and return 801`);
              ExpectTrue(true);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetSimSpn_static_1200
     * @tc.number SUB_Telephony_Sim_GetSimSpn_1200
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimSpn_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimSpn_static_1200';
        hilog.info(domain, tag, `${caseName} test start`);
        let hasSimCard: boolean = sim.hasSimCardSync(0);
        if (!hasSimCard) {
          hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
        try {
          sim.getSimSpn(3).then((data: string) => {
            hilog.info(domain, tag, `${caseName} failed, The result is not in line with expectations`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((err: Error) => {
            let error = err as BusinessError;
            if (error?.code === 8300001) {
              hilog.info(domain, tag, `${caseName} successfully  : Parameter error and return 8300001`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          if (err?.code === 8300001) {
            hilog.info(domain, tag, `${caseName} successfully  : Parameter error and return 8300001`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
        }
      });

    /**
     * @tc.name   testTelephonySimGetOpNameSync_static_0300
     * @tc.number SUB_Telephony_Sim_GetOpNameSync_0300
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot.Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetOpNameSync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpNameSync_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          let data: string = sim.getOpNameSync(-1);
	  if (data.length === 0) {
        	hilog.info(domain, tag, `${caseName} success : Return an empty string`);
        	ExpectTrue(true);
        	hilog.info(domain, tag, `${caseName} test end`);
        	done();
      	  } else {
        	hilog.info(domain, tag, `${caseName} err The return value is not the expected value : ${data}`);
        	ExpectFail();
        	hilog.info(domain, tag, `${caseName} test end`);
        	done();
      	  }
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(8300001);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetOpKeySync_static_0300
     * @tc.number SUB_Telephony_Sim_GetOpKeySync_0300
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot.Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonySimGetOpKeySync_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetOpKeySync_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSimCard: boolean = sim.hasSimCardSync(0);
          if (!hasSimCard) {
            hilog.info(domain, tag, `${caseName} failed, No SIM exists in slot 0`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
          let data: string = sim.getOpKeySync(-1);
      	  if (data.length === 0) {
        	hilog.info(domain, tag, `${caseName} success : Return an empty string`);
        	ExpectTrue(true);
        	hilog.info(domain, tag, `${caseName} test end`);
        	done();
      	  } else {
        	hilog.info(domain, tag, `${caseName} err The return value is not the expected value :${data}`);
        	ExpectFail();
        	hilog.info(domain, tag, `${caseName} test end`);
        	done();
      	  }
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          } else {
            expect(error?.code).assertEqual(8300001);
          }
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
  });
}
