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
import { describe, it, expect, Level, TestType, Size} from '../../../hypium/index';
import hilog from '@ohos.hilog';
import observer from '@ohos.telephony.observer';

let domain: int = 0x0000;
let tag: string = 'SimNoCardPublicTag';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
};

export default function SimNoCardPublic() {
  describe('SimNoCardPublic', (): void => {

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0600
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0600
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success have card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getISOCountryCodeForSim(0, (err: BusinessError | null, data: string | undefined) => {
            if (err?.code === 8300004) {
              console.info(`${caseName}: Do not have sim card1. success  data->${JSON.stringify(data)}`);
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
          console.info(`${caseName} failed  have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim1300
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_1300
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success  have sim card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getISOCountryCodeForSim(0).then((data: string) => {
            console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: Error): void => {
            if (err?.code === 8300004) {
              console.info(`${caseName} success Do not have sim card.1, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
            }
          });
        } else {
          console.info(`${caseName}:failed Do not have card>${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0600
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0600
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAccountInfo0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
            if (err?.code === 8300004) {
              console.info(`${caseName} 	Do not have sim card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonySimGetActiveSimAccountInfoList0300
     * @tc.number SUB_Telephony_Sim_GetActiveSimAccountInfoList_0300
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetActiveSimAccountInfoList0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getActiveSimAccountInfoList((err: BusinessError | null, data: Array<sim.IccAccountInfo> | undefined) => {
            if (err?.code === 8300004) {
              console.info(`${caseName}  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonySimGetActiveSimAccountInfoList0700
     * @tc.number SUB_Telephony_Sim_GetActiveSimAccountInfoList_0700
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetActiveSimAccountInfoList0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList0700';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getActiveSimAccountInfoList().then((data: Array<sim.IccAccountInfo>) => {
            console.info(`${caseName} getActiveSimAccountInfoList success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: Error): void => {
            if (err?.code === 8300004) {
              console.info(`${caseName} has not card1  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} getActiveSimAccountInfoList failed, promise: err->${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonySimGetCardType_static_0700
     * @tc.number SUB_Telephony_Sim_GetCardType_0700
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetCardType_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetCardType_static_0700';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data === false) {
          hilog.info(domain, tag, `${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getCardType(0, (err: BusinessError<void>|null, data: sim.CardType|undefined) => {
            if (err?.code === 8300004) {
              hilog.info(domain, tag, `${caseName} 	Do not have sim card1: err->${JSON.stringify(err)}, data->${data}`);
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
    });

    /**
     * @tc.name   testTelephonySimGetCardType_static_0800
     * @tc.number SUB_Telephony_Sim_GetCardType_0800
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetCardType_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetCardType_static_0800';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data === false) {
          hilog.info(domain, tag, `${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getCardType(0).then((data: sim.CardType) => {
            hilog.info(domain, tag, `${caseName} getCardType success, promise: data->${data}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end `);
            done();
          }).catch((error: Error) => {
            let err = error as  BusinessError;
            if (err?.code === 8300004) {
              hilog.info(domain, tag, `${caseName} has not card1  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} getCardType failed, promise: err->${JSON.stringify(err)}`);
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
    });

    /**
     * @tc.name   testTelephonySimGetSimSpn_static_0300
     * @tc.number SUB_Telephony_Sim_GetSimSpn_0300
     * @tc.desc   Obtains the SPN of the SIM card in the specified slot. This API uses a callback to return the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetSimSpn_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimSpn_static_0300';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data === false) {
          hilog.info(domain, tag, `${caseName}:success Do not have sim card1 err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimSpn(0, (err: BusinessError<void>|null, data:string|undefined) => {
            if (err?.code === 8300004) {
              hilog.info(domain, tag, `${caseName}:success Do not have sim card1 err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}:fail,data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            }
            hilog.info(domain, tag, `${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          });
        } else {
          hilog.info(domain, tag, `${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimSpn_static_1100
     * @tc.number SUB_Telephony_Sim_GetSimSpn_1100
     * @tc.desc   Obtains the SPN of the SIM card in the specified slot. This API uses a promise to return the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetSimSpn_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimSpn_static_1100';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data === false) {
          hilog.info(domain, tag, `${caseName}:success Do not have sim card1 err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimSpn(0).then((data: string) => {
            hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end `);
            done();
          }).catch((error: Error) => {
            let err = error as  BusinessError;
            if (err?.code === 8300004) {
              hilog.info(domain, tag, `${caseName} 	Do not have sim card., promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            }
          });
        } else {
          hilog.info(domain, tag, `${caseName}:fail has not SimCard2,data->${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric_static_0500
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0500
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetSimOperatorNumeric_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric_static_0500';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data === false) {
          hilog.info(domain, tag, `${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimOperatorNumeric(0, (err: BusinessError<void>|null, data: string|undefined) => {
            if (err?.code === 8300004) {
              hilog.info(domain, tag, `${caseName}: success Do not have sim card. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            }
          });
        } else {
          hilog.info(domain, tag, `${caseName}:fail hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric_static_1300
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_1300
     * @tc.desc   Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimGetSimOperatorNumeric_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric_static_1300';
      hilog.info(domain, tag, `${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
        if (data === false) {
          hilog.info(domain, tag, `${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimOperatorNumeric(0).then((data: string) => {
            hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} test end `);
            done();
          }).catch((error: Error) => {
            let err = error as  BusinessError;
            if (err?.code === 8300004) {
              hilog.info(domain, tag, `${caseName} success Do not have sim card., promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end `);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
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
    });

  });
}
