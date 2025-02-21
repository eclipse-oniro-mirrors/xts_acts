/**
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
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

import sim from '@ohos.telephony.sim';
import radio from '@ohos.telephony.radio';
import * as env from './lib/Const';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function SimManagerTest() {

  describe('SimManagerTest', function () {
    afterEach(async function () {
      try {
        class IccAccountInfo {
          constructor (slotIndex, showName, showNumber) {
            this.slotIndex = slotIndex;
            this.showName = showName;
            this.showNumber = showNumber;
          }
        }
        const SLOT_INDEX = 0;
        const SHOW_NAME = 'test';
        const SHOW_NUMBER = '10';
        let iccAccountInfo = new IccAccountInfo(SLOT_INDEX, SHOW_NAME, SHOW_NUMBER);
        expect(iccAccountInfo.slotIndex === SLOT_INDEX).assertTrue();
        expect(iccAccountInfo.showName === SHOW_NAME).assertTrue();
        expect(iccAccountInfo.showNumber === SHOW_NUMBER).assertTrue();

        class LockStatusResponse {
          constructor (result, remain) {
            this.result = result;
            this.remain = remain;
          }
        }
        const RES_RESULT = 0;
        const RES_REMAIN = 0;
        let lockStatusResponse = new LockStatusResponse(RES_RESULT, RES_REMAIN);
        expect(lockStatusResponse.result === RES_RESULT).assertTrue();
        expect(lockStatusResponse.remain === RES_REMAIN).assertTrue();
      } catch (error) {
        console.info(`Telephony_Sim error`);
      }
    });

    it('Telephony_Sim_getDefaultVoiceSlotId_0100', 0, async function (done) {
      sim.getDefaultVoiceSlotId((err, data) => {
        expect(data === null).assertFalse();
        done();
      });
    });

    it('Telephony_Sim_getDefaultVoiceSlotId_0200', 0, async function (done) {
      let promise = sim.getDefaultVoiceSlotId();
      promise.then(data => {
        expect(data === null).assertFalse();
        done();
      }).catch(err => {
        expect(err === null).assertFalse();
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_constantValidate_0100
     * @tc.name    SIM card constant validation
     * @tc.desc    Function test
     */
    it('Telephony_Sim_constantValidate_0100', 0, async function (done) {
      console.info(`Telephony_Sim_constantValidate_0100 start`);
      expect(sim.SimState.SIM_STATE_UNKNOWN !== env.INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_NOT_PRESENT !== env.INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_LOCKED !== env.INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_NOT_READY !== env.INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_READY !== env.INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_LOADED !== env.INVALID_VALUE).assertTrue();
      expect(sim.UNKNOWN_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_SIM_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_USIM_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_RUIM_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.DUAL_MODE_CG_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.CT_NATIONAL_ROAMING_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.CU_DUAL_MODE_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.DUAL_MODE_TELECOM_LTE_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.DUAL_MODE_UG_CARD !== env.INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_ISIM_CARD !== env.INVALID_VALUE).assertTrue();
      console.info(`Telephony_Sim_constantValidate_0100 finish`);
      done();
    });

    /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Async_0200
     * @tc.name    Enter exception parameters to test whether the getISOCountryCodeForSim interface function
     *             can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getISOCountryCodeForSim_Async_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Async_0200';
      sim.getISOCountryCodeForSim(env.SLOTID_INVALID, (err, data) => {
        if (err) {
          console.info(`${CASE_NAME} expect err: ${err.message}`);
          console.info(`${CASE_NAME} finish`);
          done();
          return;
        }
        expect().assertFail();
        console.info(`${CASE_NAME} fail, data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Promise_0200
     * @tc.name    Enter exception parameters to test whether the getISOCountryCodeForSim interface function
     *             can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getISOCountryCodeForSim_Promise_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Promise_0200';
      try {
        var data = await sim.getISOCountryCodeForSim(env.SLOTID_INVALID);
      } catch (err) {
        console.info(`${CASE_NAME} expect err: ${err.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.info(`${CASE_NAME} fail, data = ${data}`);
      done();
    });

    /**
     * @tc.number  Telephony_Sim_getSimOperatorNumeric_Async_0200
     * @tc.name    Enter exception parameters to test whether the getSimOperatorNumeric interface function
     *             can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimOperatorNumeric_Async_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getSimOperatorNumeric_Async_0200';
      sim.getSimOperatorNumeric(env.SLOTID_INVALID, (err, data) => {
        if (err) {
          console.info(`${CASE_NAME} expect err: ${err.message}`);
          console.info(`${CASE_NAME} finish`);
          done();
          return;
        }
        expect().assertFail();
        console.info(`${CASE_NAME} fail, data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_getSimOperatorNumeric_Promise_0200
     * @tc.name    Enter exception parameters to test whether the getSimOperatorNumeric interface function
     *             can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimOperatorNumeric_Promise_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getSimOperatorNumeric_Promise_0200';
      try {
        var data = await sim.getSimOperatorNumeric(env.SLOTID_INVALID);
      } catch (err) {
        console.info(`${CASE_NAME} expect err: ${err.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.info(`${CASE_NAME} fail, data = ${data}`);
      done();
    });

    /**
     * @tc.number  Telephony_Sim_getSimSpn_Async_0200
     * @tc.name    Enter exception parameters to test whether the getSimSpn interface function can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimSpn_Async_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getSimSpn_Async_0200';
      sim.getSimSpn(env.SLOTID_INVALID, (err, data) => {
        if (err) {
          console.info(`${CASE_NAME} fail: ${err.message}`);
          console.info(`${CASE_NAME} finish`);
          done();
          return;
        }
        expect().assertFail();
        console.info(`${CASE_NAME} fail, data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_getSimSpn_Promise_0200
     * @tc.name    Enter exception parameters to test whether the getSimSpn interface function can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimSpn_Promise_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getSimSpn_Promise_0200';
      try {
        var data = await sim.getSimSpn(env.SLOTID_INVALID);
      } catch (err) {
        console.info(`${CASE_NAME} expect err: ${err.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.info(`${CASE_NAME} fail, data = ${data}`);
      done();
    });

    /**
     * @tc.number  Telephony_Sim_getSimState_Async_0200
     * @tc.name    Enter exception parameters to test whether the getSimState interface function can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimState_Async_0200', 0, async function (done) {
      sim.getSimState(env.SLOTID_INVALID, (err, data) => {
        const CASE_NAME = 'Telephony_Sim_getSimState_Async_0200';
        if (err) {
          console.info(`${CASE_NAME} expect err: ${err.message}`);
          console.info(`${CASE_NAME} finish`);
          done();
          return;
        }
        expect().assertFail();
        console.info(`${CASE_NAME} fail, data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_getSimState_Promise_0200
     * @tc.name    Enter exception parameters to test whether the getSimState interface function can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimState_Promise_0200', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_getSimState_Promise_0200';
      try {
        var data = await sim.getSimState(env.SLOTID_INVALID);
      } catch (err) {
        console.info(`${CASE_NAME} expect err: ${err.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.info(`${CASE_NAME} fail, data = ${data}`);
      done();
    });

    /**
     * @tc.number  Telephony_Sim_isSimActive_Async_0700
     * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_isSimActive_Async_0700', 0, async function (done) {
      sim.isSimActive(env.SLOTID_INVALID, (err, data) => {
        console.info("isSimActive async err info :" + JSON.stringify(err) + "data:" + JSON.stringify(data));
        expect(err.code).assertEqual(8300001);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_isSimActive_Promise_0700
     * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_isSimActive_Promise_0700', 0, async function (done) {
      let promise = sim.isSimActive(env.SLOTID_INVALID);
      promise.then(data => {
        console.log(`isSimActive success, promise: data->${JSON.stringify(data)}`);
        expect(data).assertFalse();
        done();
      }).catch(err => {
        console.info("isSimActive promise err info :" + JSON.stringify(err));
        expect(err.code).assertEqual(8300001);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_hasSimCard_Async_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_hasSimCard_Async_0600', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_hasSimCard_Async_0600';
      sim.hasSimCard(env.SLOTID_INVALID, (err, data) => {
        if (err) {
          expect(err.code).assertEqual(8300001);
          console.info(CASE_NAME +' fail, err: ' + JSON.stringify(err));
          done();
          return;
        }
        console.info(CASE_NAME + ' finish' + JSON.stringify(data));
      });
    });

    /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_hasSimCard_Promise_0600', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_hasSimCard_Promise_0600';
      try {
        let data = await sim.hasSimCard(env.SLOTID_INVALID);
      } catch (err) {
        expect(err.code).assertEqual(8300001);
        console.info(CASE_NAME +' fail, err: ' + JSON.stringify(err));
        done();
        return;
      }
      console.info(CASE_NAME + ' finish');
    });

    /**
     * @tc.number Telephony_Sim_getMaxSimCount_0100
     * @tc.name   Test the getMaxSimCount interface and view the callback result
     * @tc.desc   Function test
     */
    it('Telephony_Sim_getMaxSimCount_0100', 0, function (done) {
      const CASE_NAME = 'Telephony_Sim_getMaxSimCount_0100';
      let simCount = sim.getMaxSimCount();
      expect(simCount > env.SIM_MIN_COUNT).assertTrue();
      console.info(`${CASE_NAME} test finish.`);
      done();
    });

    /**
     * @tc.number Telephony_Sim_GetCardType_Async_0400
     * @tc.name   Verify that the slotId of the GetCardType async callback interface is abnormal
     *            and enter parameter 2, and check the callback value
     * @tc.desc   Function test
     */
    it('Telephony_Sim_GetCardType_Async_0400', 0, function (done) {
      const CASE_NAME = 'Telephony_Sim_GetCardType_Async_0400';
      sim.getCardType(env.SLOTID_INVALID, (err, cardType) => {
        if (err) {
          console.info(CASE_NAME + ' GetCardType error: ' + JSON.stringify(err));
          expect(err.code).assertEqual(8300001);
          done();
          return;
        }
        console.info(CASE_NAME + ' finish' + JSON.stringify(cardType));
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number Telephony_Sim_GetCardType_Promise_0400
     * @tc.name   Verify that the slotId of the GetCardType promise interface is abnormal
     *            and enter parameter 2, and check the callback value
     * @tc.desc   Function test
     */
    it('Telephony_Sim_GetCardType_Promise_0400', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_GetCardType_Promise_0400';
      try {
        const cardType = await sim.getCardType(env.SLOTID_INVALID);
        console.info(CASE_NAME + ' finish');
      } catch (err) {
        console.info(CASE_NAME + ' GetCardType error: ' + JSON.stringify(err));
        expect(err.code).assertEqual(8300001);
      }
      done();
    });

    /**
     * @tc.number Telephony_Sim_hasOperatorPrivileges_Async_0400
     * @tc.name   Test hasOperatorPrivileges interface slotId exception enter parameter 2,
     *            check the callback result
     * @tc.desc   Function test
     */
    it('Telephony_Sim_hasOperatorPrivileges_Async_0400', 0, function (done) {
      const CASE_NAME = 'Telephony_Sim_hasOperatorPrivileges_Async_0400';
      sim.hasOperatorPrivileges(env.SLOTID_INVALID, (error, result) => {
        if (error) {
          console.info(CASE_NAME + 'hasOperatorPrivileges error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(8300001);
          done();
          return;
        }
        console.info(CASE_NAME + ' finish' + JSON.stringify(result));
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number Telephony_Sim_hasOperatorPrivileges_Promise_0400
     * @tc.name   Test hasOperatorPrivileges interface slotId exception enter parameter 2,
     *            check the returned result
     * @tc.desc   Function test
     */
    it('Telephony_Sim_hasOperatorPrivileges_Promise_0400', 0, async function (done) {
      const CASE_NAME = 'Telephony_Sim_hasOperatorPrivileges_Promise_0400';
      try {
        const result = await sim.hasOperatorPrivileges(env.SLOTID_INVALID);
        console.info(CASE_NAME + ' finish' + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (error) {
        console.info(CASE_NAME + 'hasOperatorPrivileges error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(8300001);
      }
      done();
    });

    /**
     * @tc.number Telephony_Sim_getOpKey_CallBack_0100
     * @tc.name   Test getOpKey interface
     * @tc.desc   Obtains the opkey of the SIM card in a specified slot.Returns the opkey;
     *            returns "-1" if no SIM card is inserted or no opkey matched.
     */
    it('Telephony_Sim_getOpKey_CallBack_0100', 0, async function (done) {
      sim.getOpKey(0, (err, data) => {
        console.info("Telephony_Sim_getOpKey_CallBack_0100 err = " + JSON.stringify(err) + " data = " + JSON.stringify(data));
        if(err){
          expect(err.code).assertEqual(-1);
          done();
          return;
        }
        done();
      });
    });

    /**
     * @tc.number Telephony_Sim_getOpKey_Promise_0100
     * @tc.name   Test getOpKey interface
     * @tc.desc   Obtains the opkey of the SIM card in a specified slot.Returns the opkey;
     *            returns "-1" if no SIM card is inserted or no opkey matched.
     */
    it('Telephony_Sim_getOpKey_Promise_0100', 0, async function (done) {
      let promise = sim.getOpKey(0);
      promise.then(data => {
        console.info("Telephony_Sim_getOpKey_Promise_0100 data = " + JSON.stringify(data));
        done();
      }).catch(err => {
        console.info("Telephony_Sim_getOpKey_Promise_0100 err = " + JSON.stringify(err));
        expect(err.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.number Telephony_Sim_getOpName_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc   Obtains the opname of the SIM card in a specified slot.
     *            returns null if no SIM card is inserted or no opname matched.
     */
    it('Telephony_Sim_getOpName_CallBack_0100', 0, async function (done) {
      sim.getOpName(0, (err, data) => {
        console.info("Telephony_Sim_getOpName_CallBack_0100 err = " + JSON.stringify(err) + " data = " + JSON.stringify(data));
        if(err){
          expect(err.code).assertEqual(-1);
          done();
          return;
        }
        done();
      });
    });

    /**
     * @tc.number Telephony_Sim_getOpName_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc   Obtains the opname of the SIM card in a specified slot.
     *            returns null if no SIM card is inserted or no opname matched.
     */
    it('Telephony_Sim_getOpName_Promise_0100', 0, async function (done) {
      let promise = sim.getOpName(0);
      promise.then(data => {
        console.info("Telephony_Sim_getOpName_Promise_0100 data = " + JSON.stringify(data));
        done();
      }).catch(err => {
        console.info("Telephony_Sim_getOpName_Promise_0100 err = " + JSON.stringify(err));
        expect(err.code).assertEqual(-1);
        done();
      });
    });
    /**
     * @tc.number Telephony_Sim_getSimAccountInfo_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getSimAccountInfo_CallBack_0100', 0, async function (done) {
      sim.getSimAccountInfo(0, (err, data) => {
        if(err){
          console.info("Telephony_Sim_getSimAccountInfo_CallBack_0100 err = " + JSON.stringify(err));
          expect(true).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getSimAccountInfo_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
		expect(data.simId != null).assertTrue();
		expect(data.isEsim != null).assertTrue();
		expect(data.isActive != null).assertTrue();
		expect(data.iccId != null).assertTrue();
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sim_getSimAccountInfo_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      });
    });
    /**
     * @tc.number Telephony_Sim_getSimAccountInfo_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getSimAccountInfo_Promise_0100', 0, async function (done) {
      let promise = sim.getSimAccountInfo(0);
      promise.then(data => {
        console.info("Telephony_Sim_getSimAccountInfo_Promise_0100 data = " + JSON.stringify(data));
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sim_getSimAccountInfo_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      }).catch(err => {
        console.info("Telephony_Sim_getSimAccountInfo_Promise_0100 err = " + JSON.stringify(err));
        expect(true).assertTrue();
        done();
      });
    });
    /**
     * @tc.number Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100', 0, async function (done) {
      sim.getActiveSimAccountInfoList((err, data) => {
        if(err){
          console.info("Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 err = " + JSON.stringify(err));
          expect(true).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      });
    });
    /**
     * @tc.number Telephony_Sim_getActiveSimAccountInfoList_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getActiveSimAccountInfoList_Promise_0100', 0, async function (done) {
      let promise = sim.getActiveSimAccountInfoList();
      promise.then(data => {
        console.info("Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 data = " + JSON.stringify(data));
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      }).catch(err => {
        console.info("Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 err = " + JSON.stringify(err));
        expect(true).assertTrue();
        done();
      });
    });

    /**
     * @tc.number Telephony_Sim_getDefaultVoiceSimId_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getDefaultVoiceSimId_CallBack_0100', 0, async function (done) {
      sim.getDefaultVoiceSimId((err, data) => {
        if(err){
          console.info("Telephony_Sim_getDefaultVoiceSimId_CallBack_0100 err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getDefaultVoiceSimId_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sim_getDefaultVoiceSimId_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertFalse();
          done();
        });
      });
    });
    /**
     * @tc.number Telephony_Sim_getDefaultVoiceSimId_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getDefaultVoiceSimId_Promise_0100', 0, async function (done) {
      let promise = sim.getDefaultVoiceSimId();
      promise.then(data => {
        console.info("Telephony_Sim_getDefaultVoiceSimId_Promise_0100 data = " + JSON.stringify(data));
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sim_getDefaultVoiceSimId_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertFalse();
          done();
        });
      }).catch(err => {
        console.info("Telephony_Sim_getDefaultVoiceSimId_Promise_0100 err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      });
    });
  })
}
