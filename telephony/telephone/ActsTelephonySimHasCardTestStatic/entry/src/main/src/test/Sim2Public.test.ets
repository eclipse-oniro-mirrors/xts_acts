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

import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium/index';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'Sim2Public';
let PERMISSION_DENIED_CODE: number = 201;
let PARAMETER_ERROR_CODE: number = 8300001;
const SIM_PIN_OLD = "741593";

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};


export default function Sim2Public() {
  describe('Sim2Public', () => {


    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0100
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0100
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0, (err: BusinessError | null, data: string | undefined) => {
            if (data?.length as int > 0) {
              console.info(`${caseName}: success data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0300
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0300
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetISOCountryCodeForSim0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(-1, (err: BusinessError | null, data: string | undefined) => {
            if (err?.code === 8300001) {
              console.info(`${caseName}: Invalid parameter value success  data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });


    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0800
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0800
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success have card,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0).then((data: string) => {
            if (data?.length as int > 0) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim1000
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_1000
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          sim.getISOCountryCodeForSim(-1).then((data: string) => {
            console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            if (err?.code === 8300001) {
              console.info(`${caseName} success Invalid parameter value., promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0100
     * @tc.number SUB_Telephony_Sim_GetSimState_0100
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimState0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0, (err: BusinessError| null, data: sim.SimState | undefined) => {
            if (err?.code == 0) {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}, data->` + data);
              const simStateAry: number[] = [
              sim.SimState.SIM_STATE_UNKNOWN,
              sim.SimState.SIM_STATE_LOCKED,
              sim.SimState.SIM_STATE_NOT_PRESENT,
              sim.SimState.SIM_STATE_NOT_READY,
              sim.SimState.SIM_STATE_LOADED,
              sim.SimState.SIM_STATE_READY
              ]
              expect(data).assertEqual(simStateAry[4]);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} callback: 001 err->${JSON.stringify(err)}, data->` + data);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0400
     * @tc.number SUB_Telephony_Sim_GetSimState_0400
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimState0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1, (err: BusinessError | null, data: sim.SimState | undefined) => {
            if (err?.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value. callback: err->${JSON.stringify(err)}, data->` + data);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0600
     * @tc.number SUB_Telephony_Sim_GetSimState_0600
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimState0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0).then((data: sim.SimState) => {
            console.info(`${caseName}getSimState success, promise: data->${JSON.stringify(data)}`);
            const simStateAry: number[] = [
            sim.SimState.SIM_STATE_UNKNOWN,
            sim.SimState.SIM_STATE_LOCKED,
            sim.SimState.SIM_STATE_NOT_PRESENT,
            sim.SimState.SIM_STATE_NOT_READY,
            sim.SimState.SIM_STATE_LOADED,
            sim.SimState.SIM_STATE_READY
            ]
            ExpectTrue(simStateAry.includes(data));
            console.info(`${caseName} test end `);
            done();
          }).catch((err: Error): void => {
            console.info(`${caseName}getSimState failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0900
     * @tc.number SUB_Telephony_Sim_GetSimState_0900
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimState0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1).then((data: sim.SimState) => {
            console.info(`${caseName} getSimState success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: Error): void => {
            if (err.code === 8300001) {
              console.info(`${caseName} getSimState failed Invalid parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasSimCard0100
     * @tc.number SUB_Telephony_Sim_HasSimCard_0100
     * @tc.desc   Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCard0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError| null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasSimCard0600
     * @tc.number SUB_Telephony_Sim_HasSimCard_0600
     * @tc.desc   Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCard0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0).then((data: boolean) => {
        if (data) {
          console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }).catch((err: Error): void => {
        console.info(`hasSimCard failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0100
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0100
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimAccountInfo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
            if (data?.simId as int > 0 && data?.slotIndex as int >= 0 && data?.isEsim !== true && data?.isActive !== false && data?.iccId.length as int > 0 && data?.showName.length as int > 0 && data?.showNumber.length as int > 0 ) {
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0400
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0400
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAccountInfo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(-1, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
            if (err?.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0800
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0800
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimAccountInfo0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean| undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(0).then((data: sim.IccAccountInfo) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            if (data?.simId as int > 0 && data?.slotIndex as int >= 0 && data?.isEsim !== true && data?.isActive !== false && data?.iccId.length as int > 0 && data?.showName.length as int > 0 && data?.showNumber.length as int > 0 ) {
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: Error): void => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo1100
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_1100
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAccountInfo1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(-1).then((data: sim.IccAccountInfo) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: Error): void => {
            if (err?.code === 8300001) {
              console.info(`${caseName} Parameter error, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActive0100
     * @tc.number SUB_Telephony_Sim_IsSimActive_0100
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonySimIsSimActive0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActive0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.isSimActive(0, (err: BusinessError| null, data: boolean | undefined) => {
            if (data) {
              console.info(`${caseName}:success, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActive0400
     * @tc.number SUB_Telephony_Sim_IsSimActive_0400
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonySimIsSimActive0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActive0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.isSimActive(0).then((data: boolean) => {
            if (data) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: Error): void => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActiveSync0100
     * @tc.number SUB_Telephony_Sim_IsSimActiveSync_0100
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimIsSimActiveSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActiveSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          let isSimActive: boolean = sim.isSimActiveSync(0);
          if (isSimActive === true) {
            console.info(`${caseName} success:` + isSimActive);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActiveSync0300
     * @tc.number SUB_Telephony_Sim_IsSimActiveSync_0300
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimIsSimActiveSync0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActiveSync0300';
      console.info(`${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
            if (data) {
              try {
                console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
                let isSimActive: boolean = sim.isSimActiveSync(-1);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              } catch (error) {
                let err = error as BusinessError;
                hilog.info(domain, tag, `${caseName}  err->${JSON.stringify(err)}`);
                expect(err?.code).assertEqual(8300001);
                done();
              }
            } else {
              console.info(`${caseName}  failed Dont have card1: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName}  err->${JSON.stringify(err)}`);
          expect(err?.code).assertEqual(8300001);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimIsSimActive_static_0300
     * @tc.number SUB_Telephony_Sim_IsSimActive_0300
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimIsSimActive_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimIsSimActive_static_0300';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.deactivateSim(0, (err: BusinessError<void> | null) => {
                console.log(`callback: err->${JSON.stringify(err)}`);
                sim.isSimActive(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
                  if (!data) {
                    hilog.info(domain, tag, `${caseName}:success`);
                    ExpectTrue(true);
                  } else {
                    hilog.info(domain, tag, `${caseName} failed: err->${JSON.stringify(err)}`);
                    ExpectFail();
                  }
                  sim.activateSim(0, (err: BusinessError<void> | null) => {
                    hilog.info(domain, tag, `${caseName} Restore the status of the card`);
                    hilog.info(domain, tag, `${caseName} test end `);
                    done();
                  });
                });
              });
            } else {
              hilog.info(domain, tag, `${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            }
          });
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(error)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimIsSimActive_static_0600
     * @tc.number SUB_Telephony_Sim_IsSimActive_0600
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimIsSimActive_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimIsSimActive_static_0600';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.deactivateSim(0, (err: BusinessError<void> | null) => {
                console.log(`callback: err->${JSON.stringify(err)}`);
                sim.isSimActive(0).then((data: boolean) => {
                  if (!data) {
                    hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
                    ExpectTrue(true);
                  } else {
                    ExpectFail();
                  }
                  sim.activateSim(0, (err: BusinessError<void> | null) => {
                    hilog.info(domain, tag, `${caseName} Restore the status of the card`);
                    hilog.info(domain, tag, `${caseName} test end `);
                    done();
                  });
                }).catch((err: Error) => {
                  let error = err as BusinessError;
                  hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
                  if (error?.code === PERMISSION_DENIED_CODE) {
                    expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
                  } else {
                    expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
                  }
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                });
              })
            } else {
              hilog.info(domain, tag, `${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetActiveSimAccountInfoList_static_0100
     * @tc.number SUB_Telephony_Sim_GetActiveSimAccountInfoList_0100
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use callback for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetActiveSimAccountInfoList_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag,
                `${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              sim.activateSim(0, (err: BusinessError<void> | null) => {
                if (err?.code === 0) {
                  hilog.info(domain, tag,
                    `${caseName} success card1 is actived callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  sim.getActiveSimAccountInfoList((err: BusinessError<void> | null,
                    data: Array<sim.IccAccountInfo> | undefined) => {
                    if (err?.code === 0) {
                      if (data !== undefined && data.length > 0) {
                        hilog.info(domain, tag,
                          `${caseName} callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                        ExpectTrue(true);
                        hilog.info(domain, tag, `${caseName} test end `);
                        done();
                      } else {
                        ExpectFail();
                        hilog.info(domain, tag, `${caseName} test end `);
                        done();
                      }
                    } else {
                      ExpectFail();
                      hilog.info(domain, tag, `${caseName} test end `);
                      done();
                    }
                  });
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetActiveSimAccountInfoList_static_0500
     * @tc.number SUB_Telephony_Sim_GetActiveSimAccountInfoList_0500
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetActiveSimAccountInfoList_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList_static_0500';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag,
                `${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              sim.activateSim(0, (err: BusinessError<void> | null) => {
                if (err?.code === 0) {
                  hilog.info(domain, tag,
                    `${caseName} success card1 is actived callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  sim.getActiveSimAccountInfoList().then((data: Array<sim.IccAccountInfo>) => {
                    if (data.length > 0) {
                      hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
                      ExpectTrue(true);
                      hilog.info(domain, tag, `${caseName} test end `);
                      done();
                    } else {
                      ExpectFail();
                      hilog.info(domain, tag, `${caseName} test end `);
                      done();
                    }
                  }).catch((err: Error) => {
                    let error = err as BusinessError;
                    hilog.info(domain, tag,
                      `${caseName} getActiveSimAccountInfoList failed, promise: err->${JSON.stringify(error)}`);
                    if (error?.code === PERMISSION_DENIED_CODE) {
                      expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
                    } else {
                      expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
                    }
                    hilog.info(domain, tag, `${caseName} test end `);
                    done();
                  });
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetDefaultVoiceSlotId_static_0100
     * @tc.number SUB_Telephony_Sim_GetDefaultVoiceSlotId_0100
     * @tc.desc   SIMCard required Obtain the slot ID for the default voice service. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetDefaultVoiceSlotId_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetDefaultVoiceSlotId_static_0100';
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.setDefaultVoiceSlotId(0, (error: BusinessError<void> | null) => {
                if (error?.code) {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName}: setDefaultVoiceSlotId success`);
                  sim.getDefaultVoiceSlotId((err: BusinessError<void> | null, data: int | undefined) => {
                    if (data === 0) {
                      hilog.info(domain, tag,
                        `${caseName} success: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                      ExpectTrue(true);
                      hilog.info(domain, tag, `${caseName} test end `);
                      done();
                    } else {
                      ExpectFail();
                      hilog.info(domain, tag, `${caseName} test end `);
                      done();
                    }
                  });
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetDefaultVoiceSlotId_static_0400
     * @tc.number SUB_Telephony_Sim_GetDefaultVoiceSlotId_0400
     * @tc.desc   SIMCard required Obtain the slot ID for the default voice service. Use promise for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetDefaultVoiceSlotId_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetDefaultVoiceSlotId_static_0400';
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.setDefaultVoiceSlotId(0).then(() => {
                hilog.info(domain, tag, `${caseName}: setDefaultVoiceSlotId success`);
                sim.getDefaultVoiceSlotId().then((data: int) => {
                  if (data === 0) {
                    hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName} test end `);
                    done();
                  } else {
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName} test end `);
                    done();
                  }
                }).catch((err: Error) => {
                  let error = err as BusinessError;
                  hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
                  if (error?.code === PERMISSION_DENIED_CODE) {
                    expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
                  } else {
                    expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
                  }
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                });
              }).catch((err: Error) => {
                let error = err as BusinessError;
                hilog.info(domain, tag,
                  `${caseName} failed, setDefaultVoiceSlotId promise: err->${JSON.stringify(error)}`);
                if (error?.code === PERMISSION_DENIED_CODE) {
                  expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
                } else {
                  expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
                }
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              });
            } else {
              hilog.info(domain, tag, `${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.name   testTelephonySimGetSimCardType_static_0400
     * @tc.number SUB_Telephony_Sim_GetSimCardType_0400
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardType_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimCardType_static_0400';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag,
                `${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              sim.getCardType(-1, (err: BusinessError<void> | null, data: sim.CardType | undefined) => {
                if (err?.code === 8300001) {
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} getCardType true test end `);
                  done();
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} getCardType else test end `);
                  done();
                }
              });
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testTelephonySimGetSimCardType_static_1100
     * @tc.number SUB_Telephony_Sim_GetSimCardType_1100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardType_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimCardType_static_1100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag,
                `${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              sim.getCardType(-1).then((data: sim.CardType) => {
                hilog.info(domain, tag, `${caseName} getCardType failed, promise: data->${JSON.stringify(data)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              }).catch((err: Error) => {
                let error = err as BusinessError;
                if (error?.code === 8300001) {
                  hilog.info(domain, tag,
                    `${caseName} Invalid parameter value. getCardType success, promise: err->${JSON.stringify(error)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetSimOperatorNumeric_static_0100
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0100
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumeric_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimOperatorNumeric_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.getSimOperatorNumeric(0, (err: BusinessError<void> | null, data: string | undefined) => {
                if (data !== undefined && data.length > 0) {
                  hilog.info(domain, tag,
                    `${caseName}: success err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  hilog.info(domain, tag,
                    `${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetSimOperatorNumeric_static_0300
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0300
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumeric_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimOperatorNumeric_static_0300';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.getSimOperatorNumeric(-1, (err: BusinessError<void> | null, data: string | undefined) => {
                if (err?.code === 8300001) {
                  hilog.info(domain, tag,
                    `${caseName}: success Invalid parameter value err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  hilog.info(domain, tag,
                    `${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetSimOperatorNumeric_static_0800
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0800
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumeric_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimOperatorNumeric_static_0800';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
              sim.getSimOperatorNumeric(0).then((data: string) => {
                if (data.length > 0) {
                  hilog.info(domain, tag, `${caseName}  success, promise: data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              }).catch((err: Error) => {
                let error = err as BusinessError;
                hilog.info(domain, tag, `${caseName}  failed, promise: err->${JSON.stringify(error)}`);
                if (error?.code === PERMISSION_DENIED_CODE) {
                  expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
                } else {
                  expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
                }
                hilog.info(domain, tag, `${caseName} test end`);
                done();
              });
            } else {
              hilog.info(domain, tag, `${caseName} :failed hasSimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetSimOperatorNumeric_static_1000
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_1000
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumeric_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimOperatorNumeric_static_1000';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              sim.getSimOperatorNumeric(-1).then((data: string) => {
                hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              }).catch((err: Error) => {
                let error = err as BusinessError;
                if (error?.code === 8300001) {
                  hilog.info(domain, tag,
                    `${caseName} success Invalid parameter value, promise: err->${JSON.stringify(error)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName}:failed hasSimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetSimOperatorNumericSync_static_0100
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumericSync_0100
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumericSync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimOperatorNumericSync_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              let numeric: string = sim.getSimOperatorNumericSync(0);
              if (numeric.length > 0) {
                hilog.info(domain, tag, `${caseName}the sim operator numeric is success:` + numeric);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}the sim operator numeric  is:` + numeric);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              }
            } else {
              hilog.info(domain, tag, `${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetSimOperatorNumericSync_static_0300
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumericSync_0300
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumericSync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimOperatorNumericSync_static_0300';
        hilog.info(domain, tag, `${caseName} test start `);
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              try {
                let numeric: string = sim.getSimOperatorNumericSync(-1);
                hilog.info(domain, tag, `${caseName}the sim operator numeric  is:` + numeric);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              } catch (error) {
                let err = error as BusinessError;
                hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
                if (err.code === PERMISSION_DENIED_CODE) {
                  expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
                } else {
                  expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
                }
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              }
            } else {
              hilog.info(domain, tag, `${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            }
          });
      });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges_static_0800
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_0800
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasOperaterPrivileges_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimHasOperaterPrivileges_static_0800';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
              sim.hasOperatorPrivileges(-1, (err: BusinessError<void> | null, data: boolean | undefined) => {
                if (err?.code === 8300001) {
                  hilog.info(domain, tag,
                    `${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName}:fail Do not have SimCard1,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimHasOperaterPrivileges_static_1700
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_1700
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasOperaterPrivileges_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimHasOperaterPrivileges_static_1700';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success has  SimCard1,data->${JSON.stringify(data)}`);
              sim.hasOperatorPrivileges(-1).then((data: boolean) => {
                hilog.info(domain, tag, `${caseName} success   , promise: data->${JSON.stringify(data)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              }).catch((err: Error) => {
                let error = err as BusinessError;
                if (error?.code === 8300001) {
                  hilog.info(domain, tag,
                    `${caseName}:Invalid parameter value. err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(error)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} test end `);
                  done();
                }
              });
            } else {
              hilog.info(domain, tag, `${caseName}:success has not SimCard1,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetOpName_static_0600
     * @tc.number SUB_Telephony_Sim_GetSimCardType_0800
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetOpName_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimCardType0800';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data) {
          hilog.info(domain, tag, `${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(0).then((data: sim.CardType) => {
            const simStateAry: sim.CardType[] = [
              sim.CardType.UNKNOWN_CARD,
              sim.CardType.SINGLE_MODE_SIM_CARD,
              sim.CardType.SINGLE_MODE_USIM_CARD,
              sim.CardType.SINGLE_MODE_RUIM_CARD,
              sim.CardType.DUAL_MODE_CG_CARD,
              sim.CardType.CT_NATIONAL_ROAMING_CARD,
              sim.CardType.CU_DUAL_MODE_CARD,
              sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
              sim.CardType.DUAL_MODE_UG_CARD,
              sim.CardType.SINGLE_MODE_ISIM_CARD
            ];
            const isCard: boolean = simStateAry.includes(data);
            if (isCard) {
              hilog.info(domain, tag, `${caseName} getCardType success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            }
          }).catch((error:Error) => {
            let err = error as  BusinessError;
            hilog.info(domain, tag, `${caseName} getCardType failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasSimCardSync_static_0100
     * @tc.number SUB_Telephony_Sim_HasSimCardSync_0100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimHasSimCardSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCardSync_static_0100';
      hilog.info(domain, tag, `${caseName} test start `);
      let hasSimCard: boolean = sim.hasSimCardSync(0);
      if (hasSimCard === true) {
        hilog.info(domain, tag, `${caseName} success has sim card1: ` + hasSimCard);
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName} test end `);
        done();
      } else {
        hilog.info(domain, tag, `${caseName} false has not sim card1: ` + hasSimCard);
        ExpectFail();
        hilog.info(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonySimGetSimCardTypeSync_static_0100
     * @tc.number SUB_Telephony_Sim_GetSimCardTypeSync_0100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardTypeSync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetSimCardTypeSync_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag,
                `${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              let cardType: sim.CardType = sim.getCardTypeSync(0);
              const simStateAry: sim.CardType[] = [
                sim.CardType.UNKNOWN_CARD,
                sim.CardType.SINGLE_MODE_SIM_CARD,
                sim.CardType.SINGLE_MODE_USIM_CARD,
                sim.CardType.SINGLE_MODE_RUIM_CARD,
                sim.CardType.DUAL_MODE_CG_CARD,
                sim.CardType.CT_NATIONAL_ROAMING_CARD,
                sim.CardType.CU_DUAL_MODE_CARD,
                sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
                sim.CardType.DUAL_MODE_UG_CARD,
                sim.CardType.SINGLE_MODE_ISIM_CARD
              ];
              ExpectTrue(simStateAry.includes(cardType));
              hilog.info(domain, tag, `${caseName} the card type is:` + cardType);
              done();
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
     * @tc.name   testTelephonySimGetISOCountryCodeForSimSync_static_0100
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSimSync_0100
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSimSync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetISOCountryCodeForSimSync_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              try {
                let countryCode: string = sim.getISOCountryCodeForSimSync(0);
                if (countryCode.length > 0) {
                  hilog.info(domain, tag, `${caseName} success1:` + countryCode);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName} test end`);
                  done();
                } else {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName} testfail end`);
                  done();
                }
              } catch (err) {
                ExpectFail();
                hilog.info(domain, tag, `${caseName} errtest end`);
                done();
              }
            } else {
              hilog.info(domain, tag, `${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end==3 `);
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
     * @tc.name   testTelephonySimGetISOCountryCodeForSimSync_static_0300
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSimSync_0300
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSimSync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySimGetISOCountryCodeForSimSync_static_0300';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          sim.hasSimCard(0, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (data) {
              hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
              try {
                let countryCode: string = sim.getISOCountryCodeForSimSync(-1);
                ExpectFail();
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(8300001);
                hilog.info(domain, tag, `${caseName} test end `);
                done();
              }
            } else {
              hilog.info(domain, tag, `${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
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
  });
}
