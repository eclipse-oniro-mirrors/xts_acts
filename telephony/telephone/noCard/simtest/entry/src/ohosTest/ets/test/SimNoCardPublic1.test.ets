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
import { describe, it, expect, Level, TestType, Size} from '@ohos/hypium';

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
  describe('SimNoCardPublic1', () => {

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_1100
     * @tc.name   : testTelephonySimGetSimLabelCallback1100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelCallback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback1100';
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          try {
            sim.getSimLabel(0, (err: BusinessError, data: sim.SimLabel) => {
              console.info(`${caseName} jin qu la: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              if (!err && data.index <= 2 && data.simType == sim.SimType.PSIM) {
                console.info(`${caseName} sim card is PSIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
          } catch(error) {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }else {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_1200
     * @tc.name   : testTelephonySimGetSimLabelCallback1200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelCallback1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback1200';
      sim.hasSimCard(1, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          try {
            sim.getSimLabel(1, (err: BusinessError, data: sim.SimLabel) => {
              console.info(`${caseName} jin qu la: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              if (!err && data.index <= 2 && data.simType == sim.SimType.PSIM) {
                console.info(`${caseName} sim card is PSIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else if (!err && data.index <= 10 && data.simType == sim.SimType.ESIM) {
                console.info(`${caseName} sim card is ESIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
          } catch(error) {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }else {
          console.info(`${caseName} failed, have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_promise_1100
     * @tc.name   : testTelephonySimGetSimLabelPromise1100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelPromise1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise1100';
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimLabel(0).then((data: sim.SimLabel) => {
            if (!err && data.index <= 2 && data.simType == sim.SimType.PSIM) {
              console.info(`${caseName} sim card is PSIM,data -> ${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        } else {
          console.info(`${caseName} failed, have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_promise_1200
     * @tc.name   : testTelephonySimGetSimLabelPromise1200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelPromise1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise1200';
      sim.hasSimCard(1, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimLabel(1).then((data: sim.SimLabel) => {
            if (!err && data.index <= 2 && data.simType == sim.SimType.PSIM) {
              console.info(`${caseName} sim card is PSIM,data -> ${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else if (!err && data.index <= 10 && data.simType == sim.SimType.ESIM) {
              console.info(`${caseName} sim card is ESIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        } else {
          console.info(`${caseName} failed, have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_1100
     * @tc.name   : testTelephonySimGetSimLabelSync1100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelSync1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync1100';
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          try {
            let simLabel: sim.SimLabel = sim.getSimLabelSync(0);
            if (simLabel.index <= 2 && simLabel.simType == sim.SimType.PSIM) {
              console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
              ExpectTrue(true);
              console.info(`${caseName} 01 test end`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} 02 test end`);
              done();
            }
          } catch (err) {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        } else {
          console.info(`${caseName} failed, have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_1200
     * @tc.name   : testTelephonySimGetSimLabelSync1200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelSync1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync1200';
      sim.hasSimCard(1, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}:success have not card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          try {
            let simLabel: sim.SimLabel = sim.getSimLabelSync(1);
            if (simLabel.index <= 2 && simLabel.simType == sim.SimType.PSIM) {
              console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
              ExpectTrue(true);
              console.info(`${caseName} 01 test end`);
              done();
            } else if (simLabel.index <= 10 && simLabel.simType == sim.SimType.ESIM) {
              console.info(`${caseName} sim card is ESIM, err->${JSON.stringify(err)}, simLabel->${JSON.stringify(simLabel)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} 02 test end`);
              done();
            }
          } catch (err) {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        } else {
          console.info(`${caseName} failed, have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });
  });
}
