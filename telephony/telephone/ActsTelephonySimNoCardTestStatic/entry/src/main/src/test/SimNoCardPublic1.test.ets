
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

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

export default function SimNoCardPublic1() {
  describe('SimNoCardPublic1', (): void => {

    /**
     * @tc.name   testTelephonySimGetSimLabelCallback1100
     * @tc.number SUB_Telephony_Sim_getSimLabel_callback_1100
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimGetSimLabelCallback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback1100';
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          try {
            sim.getSimLabel(0, (err: BusinessError | null, data: sim.SimLabel | undefined) => {
              console.info(`${caseName} jin qu la: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              if (data?.index as int <= 2 && data?.simType == sim.SimType.PSIM) {
                console.info(`${caseName} sim card is PSIM, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else if (data?.index as int <= 2 && data?.simType == sim.SimType.ESIM) {
                  console.info(`${caseName} sim card is ESIM,  data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end`);
                  done();
              } else {
                console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end`);
                done();
              }
            });
          } catch(err) {
            console.info(`${caseName} failed, promise: err->` + err);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }else {
          console.info(`${caseName} failed, promise: err->` + err);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimLabelCallback1200
     * @tc.number SUB_Telephony_Sim_getSimLabel_callback_1200
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimGetSimLabelCallback1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback1200';
      if (sim.getMaxSimCount() > 1) {
        sim.hasSimCard(1, (err: BusinessError | null, data: boolean | undefined) => {
          if (data === false) {
            console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            try {
              sim.getSimLabel(1, (err: BusinessError | null, data: sim.SimLabel | undefined) => {
                console.info(`${caseName} jin qu la: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                if (data?.index as int <= 2 && data?.simType == sim.SimType.PSIM) {
                  console.info(`${caseName} sim card is PSIM, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end`);
                  done();
                } else if (data?.index as int <= 2 && data?.simType == sim.SimType.ESIM) {
                  console.info(`${caseName} sim card is ESIM, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end`);
                  done();
                } else {
                  console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
                  ExpectFail();
                  console.info(`${caseName} test end`);
                  done();
                }
              });
            } catch (err) {
              console.info(`${caseName} failed, promise: err->` + err);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          } else {
            console.info(`${caseName} failed, have card: err->` + err);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } else {
        console.info(`${caseName}, Non-single SIM card case.`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
        }
    });

    /**
     * @tc.name   testTelephonySimGetSimLabelPromise1100
     * @tc.number SUB_Telephony_Sim_getSimLabel_promise_1100
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimGetSimLabelPromise1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise1100';
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimLabel(0).then((data: sim.SimLabel) => {
            if (data?.index as int <= 2 && data?.simType == sim.SimType.PSIM) {
              console.info(`${caseName} sim card is PSIM, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else if (data?.index as int <= 2 && data?.simType == sim.SimType.ESIM) {
              console.info(`${caseName} sim card is ESIM, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, err->` + err);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }).catch((err: Error) => {
            console.info(`${caseName} failed, err->` + err);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        } else {
          console.info(`${caseName} failed, have card: err->` + err);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimLabelPromise1200
     * @tc.number SUB_Telephony_Sim_getSimLabel_promise_1200
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimGetSimLabelPromise1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise1200';
      if (sim.getMaxSimCount() > 1) {
        sim.hasSimCard(1, (err: BusinessError | null, data: boolean | undefined) => {
          if (data === false) {
            console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            sim.getSimLabel(1).then((data: sim.SimLabel | undefined) => {
              if (data?.index as int <= 2 && data?.simType == sim.SimType.PSIM) {
                console.info(`${caseName} sim card is PSIM, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else if (data?.index as int <= 2 && data?.simType == sim.SimType.ESIM) {
                console.info(`${caseName} sim card is ESIM, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else {
                console.info(`${caseName} failed, err->` + err);
                ExpectFail();
                console.info(`${caseName} test end`);
                done();
              }
            }).catch((err: Error) => {
              console.info(`${caseName} failed, err->` + err);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            });
          } else {
            console.info(`${caseName} failed, have card: err->` + err);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } else {
        console.info(`${caseName}, Non-single SIM card case.`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonySimGetSimLabelSync1100
     * @tc.number SUB_Telephony_Sim_getSimLabel_sync_1100
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimGetSimLabelSync1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimLabelSync1100';
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          try {
            let data: sim.SimLabel = sim.getSimLabelSync(0);
            if (data?.index as int <= 2 && data?.simType == sim.SimType.PSIM) {
              console.info(`${caseName} sim card is PSIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else if (data?.index as int <= 2 && data?.simType == sim.SimType.ESIM) {
              console.info(`${caseName} sim card is ESIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, err->` + err);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          } catch (err) {
            console.info(`${caseName} failed, err->` + err);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        } else {
          console.info(`${caseName} failed, have card1: err->` + err);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimLabelSync1200
     * @tc.number SUB_Telephony_Sim_getSimLabel_sync_1200
     * @tc.desc   Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimGetSimLabelSync1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimLabelSync1200';
      if (sim.getMaxSimCount() > 1) {
        sim.hasSimCard(1, (err: BusinessError | null, data: boolean | undefined) => {
          if (data === false) {
            console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            try {
              let data: sim.SimLabel = sim.getSimLabelSync(1);
              if (data?.index as int <= 2 && data?.simType == sim.SimType.PSIM) {
                console.info(`${caseName} sim card is PSIM, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else if (data?.index as int <= 2 && data?.simType == sim.SimType.ESIM) {
                console.info(`${caseName} sim card is ESIM, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else {
                console.info(`${caseName} failed, err->` + err);
                ExpectFail();
                console.info(`${caseName} test end`);
                done();
              }
            } catch (err) {
              console.info(`${caseName} failed, err->` + err);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          } else {
            console.info(`${caseName} failed, have card1: err->` + err);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } else {
        console.info(`${caseName}, Non-single SIM card case.`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}
