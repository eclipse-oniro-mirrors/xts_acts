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

import { BusinessError } from '@ohos.base';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import sim from '@ohos.telephony.sim';
import radio from '@ohos.telephony.radio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index';
import hilog from '@ohos.hilog';

export default function SimManagerTest() {

  const ExpectFail = () => {
    try {
      expect().assertFail();
    } catch (err) {
      console.info('expectInfo', 'test failed')
    }
  }

  const ExpectTrue = (n: boolean) => {
    try {
      expect(n).assertTrue();
    } catch (err){
      console.info('expectInfo', 'test failed')
    }
  }

  const SLOTID_INVALID = 3;
  const CORRECT_PIN = '1234';
  const CORRECT_PUK = '12345678';
  const CORRECT_PIN2 = '12345678';
  const INCORRECT_PIN2 = '4321';
  const INCORRECT_PUK2_LEN8 = '12345678';
  const ALTER_PIN = '1234';
  // const LOCK_STATE = { SUCCESS: 0, FAILURE: -1, EXCEPTION: -2 };
  const CARD_NAME = '1234';
  const CARD_NUMBER = '1234';
  const MAIL_NAME_LEN12 = '123#@%_ABCDE';
  const MAIL_NUMBER_LEN20 = '01234567890123456789';
  const SIM_MIN_COUNT = 0;
  const STK_CMD = 'D30781020181900101';
  const SIM_PN_PIN_PASSWORD = '1111';
  const INVALID_VALUE = -1000;

  let domain: int = 0x0000; 
  let tag: string = 'testTag';

  describe('SimManagerTest',  () => {

    /**
     * @tc.name   Telephony_Sim_getDefaultVoiceSlotId_0100
     * @tc.number Telephony_Sim_getDefaultVoiceSlotId_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_getDefaultVoiceSlotId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      sim.getDefaultVoiceSlotId((err: BusinessError | null, data: int | undefined) => {
        expect(data === null).assertFalse();
        done();
      });
    });

    /**
     * @tc.name   Telephony_Sim_getDefaultVoiceSlotId_0200
     * @tc.number Telephony_Sim_getDefaultVoiceSlotId_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_getDefaultVoiceSlotId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   Telephony_Sim_constantValidate_0100
     * @tc.number Telephony_Sim_constantValidate_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_constantValidate_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`Telephony_Sim_constantValidate_0100 start`);
      expect(sim.SimState.SIM_STATE_UNKNOWN !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_NOT_PRESENT !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_LOCKED !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_NOT_READY !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_READY !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_LOADED !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.UNKNOWN_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.SINGLE_MODE_SIM_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.SINGLE_MODE_USIM_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.SINGLE_MODE_RUIM_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.DUAL_MODE_CG_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.CT_NATIONAL_ROAMING_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.CU_DUAL_MODE_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.DUAL_MODE_TELECOM_LTE_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.DUAL_MODE_UG_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CardType.SINGLE_MODE_ISIM_CARD !== INVALID_VALUE).assertTrue();
      console.info(`Telephony_Sim_constantValidate_0100 finish`);
      done();
    });

    /**
     * @tc.name   Telephony_Sim_getISOCountryCodeForSim_Async_0200
     * @tc.number Telephony_Sim_getISOCountryCodeForSim_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_getISOCountryCodeForSim_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Async_0200';
      sim.getISOCountryCodeForSim(SLOTID_INVALID, (err: BusinessError | null, data: string | undefined) => {
        if (err) {
          console.info(`${CASE_NAME} expect err: ${err?.message}`);
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
     * @tc.name   Telephony_Sim_getISOCountryCodeForSim_Promise_0200
     * @tc.number Telephony_Sim_getISOCountryCodeForSim_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_getISOCountryCodeForSim_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Promise_0200';
      try {
        let data = await sim.getISOCountryCodeForSim(SLOTID_INVALID);
        console.info(`${CASE_NAME} ， data ->` + data);
        expect().assertFail();
        done
      } catch (error) {
        let err = error as BusinessError;
        console.info(`${CASE_NAME} expect err: ${err?.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getSimState_Async_0200
     * @tc.number Telephony_Sim_getSimState_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getSimState_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      sim.getSimState(SLOTID_INVALID, (err: BusinessError | null, data: sim.SimState | undefined) => {
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
     * @tc.name   Telephony_Sim_getSimState_Promise_0200
     * @tc.number Telephony_Sim_getSimState_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_getSimState_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getSimState_Promise_0200';
      try {
        let data = await sim.getSimState(SLOTID_INVALID);
        console.info(`${CASE_NAME} fail, data = ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(`${CASE_NAME} expect err: ${err.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_isSimActive_Async_0700
     * @tc.number Telephony_Sim_isSimActive_Async_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_isSimActive_Async_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_isSimActive_Async_0700';
      sim.isSimActive(SLOTID_INVALID, (err: BusinessError | null, data: Boolean | undefined) => {
        console.info(CASE_NAME + "isSimActive async err info :" + JSON.stringify(err) + "data:" + JSON.stringify(data));
        expect(err?.code).assertEqual(8300001);
        done();
      });
    });

    /**
     * @tc.name   Telephony_Sim_isSimActive_Promise_0700
     * @tc.number Telephony_Sim_isSimActive_Promise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_isSimActive_Promise_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_isSimActive_Promise_0700';
      let promise = sim.isSimActive(SLOTID_INVALID);
      promise.then((data: boolean) => {
        console.info(CASE_NAME + `isSimActive success, promise: data->` + data);
        expect(data).assertFalse();
        done();
      }).catch((err: Error) => {
        console.info(CASE_NAME + "isSimActive promise err info :" + err);
        done();
      });
    });

    /**
     * @tc.name   Telephony_Sim_hasSimCard_Async_0600
     * @tc.number Telephony_Sim_hasSimCard_Async_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_hasSimCard_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_hasSimCard_Async_0600';
      sim.hasSimCard(SLOTID_INVALID, (err: BusinessError | null, data: Boolean | undefined) => {
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
     * @tc.name   Telephony_Sim_hasSimCard_Promise_0600
     * @tc.number Telephony_Sim_hasSimCard_Promise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_hasSimCard_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_hasSimCard_Promise_0600';
      try {
        let data = await sim.hasSimCard(SLOTID_INVALID);
        console.info(CASE_NAME + 'data ->' + data);
      } catch (err) {
        console.info(CASE_NAME +' fail, err: ' + JSON.stringify(err));
        done();
      }
      console.info(CASE_NAME + ' finish');
    });

    /**
     * @tc.name   Telephony_Sim_getMaxSimCount_0100
     * @tc.number Telephony_Sim_getMaxSimCount_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getMaxSimCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getMaxSimCount_0100';
      let simCount = sim.getMaxSimCount();
      expect(simCount > SIM_MIN_COUNT).assertTrue();
      console.info(`${CASE_NAME} test finish.`);
      done();
    });

    /**
     * @tc.name   Telephony_Sim_getSimAccountInfo_CallBack_0100
     * @tc.number Telephony_Sim_getSimAccountInfo_CallBack_0100
     * @tc.desc   Telephony_Sim_getSimAccountInfo_CallBack_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_getSimAccountInfo_CallBack_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
        if(err){
          console.info("Telephony_Sim_getSimAccountInfo_CallBack_0100 err = " + JSON.stringify(err));
          expect(true).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getSimAccountInfo_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
		    expect(data?.simId != null).assertTrue();
		    expect(data?.isEsim != null).assertTrue();
		    expect(data?.isActive != null).assertTrue();
		    expect(data?.iccId != null).assertTrue();
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getSimAccountInfo_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      });
    });
    /**
     * @tc.name   Telephony_Sim_getSimAccountInfo_Promise_0100
     * @tc.number Telephony_Sim_getSimAccountInfo_Promise_0100
     * @tc.desc   Telephony_Sim_getSimAccountInfo_Promise_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_Sim_getSimAccountInfo_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let promise = sim.getSimAccountInfo(0);
      promise.then((data: sim.IccAccountInfo) => {
        console.info("Telephony_Sim_getSimAccountInfo_Promise_0100 data = " + data);
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getSimAccountInfo_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      }).catch((err: Error) => {
        console.info("Telephony_Sim_getSimAccountInfo_Promise_0100 err = " + err);
        expect(true).assertTrue();
        done();
      });
    });
    /**
     * @tc.name   Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100
     * @tc.number Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100
     * @tc.desc   Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      sim.getActiveSimAccountInfoList((err: BusinessError | null, data: Array<sim.IccAccountInfo> | undefined) => {
        if(err){
          console.info("Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 err = " + JSON.stringify(err));
          expect(true).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      });
    });
    /**
     * @tc.name   Telephony_Sim_getActiveSimAccountInfoList_Promise_0100
     * @tc.number Telephony_Sim_getActiveSimAccountInfoList_Promise_0100
     * @tc.desc   Telephony_Sim_getActiveSimAccountInfoList_Promise_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_Sim_getActiveSimAccountInfoList_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promise = sim.getActiveSimAccountInfoList();
      promise.then((data: Array<sim.IccAccountInfo>) => {
        console.info("Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 data = " + data);
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      }).catch((err: Error) => {
        console.info("Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 err = " + err);
        expect(true).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   Telephony_Sim_getOpName_CallBack_static_0100
     * @tc.number Telephony_Sim_getOpName_CallBack_0100
     * @tc.desc   Obtains the opname of the SIM card in a specified slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getOpName_CallBack_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getOpName_CallBack_static_0100';
      try {
        sim.getOpName(0, (err: BusinessError<void>|null, data: string|undefined) => {
          hilog.info(domain, tag, CASE_NAME + " err = " + JSON.stringify(err) + " data = " + JSON.stringify(data));
          if(err?.code === 0){
            expect(true).assertTrue();
            done();
          } else {
            expect(err?.code).assertEqual(-1);
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_Sim_getOpName_try_catch_static_0100 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getOpName_Promise_static_0100
     * @tc.number Telephony_Sim_getOpName_Promise_0100
     * @tc.desc   Obtains the opname of the SIM card in a specified slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getOpName_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getOpName_Promise_static_0100';
      try {
        let promise = sim.getOpName(0);
        promise.then((data: string|undefined) => {
          hilog.info(domain, tag, CASE_NAME + " data = " + data?.toString());
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag, CASE_NAME + "getOpName err");
          expect(err?.code).assertEqual(-1);
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, CASE_NAME + " err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getOpKey_CallBack_static_0100
     * @tc.number Telephony_Sim_getOpKey_CallBack_0100
     * @tc.desc   Obtains the opkey of the SIM card in a specified slot.Returns the opkey;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getOpKey_CallBack_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getOpKey_CallBack_static_0100';
      try {
        sim.getOpKey(0, (err: BusinessError<void>|null, data: string|undefined) => {
          hilog.info(domain, tag, CASE_NAME + " err = " + JSON.stringify(err) + " data = " + JSON.stringify(data));
          if(err?.code === 0){
            expect(true).assertTrue();
            done();
          } else {
            expect(err?.code).assertEqual(-1);
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_Sim_getOpKey_try_catch_0100 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getOpKey_Promise_static_0100
     * @tc.number Telephony_Sim_getOpKey_Promise_0100
     * @tc.desc   Obtains the opkey of the SIM card in a specified slot.Returns the opkey;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getOpKey_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getOpKey_Promise_static_0100';
      try {
        let promise = sim.getOpKey(0);
        promise.then((data: string|undefined) => {
          hilog.info(domain, tag, CASE_NAME + " data = " + data?.toString());
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag, CASE_NAME + "getOpKey err");
          expect(err?.code).assertEqual(-1);
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, CASE_NAME + " err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_GetCardType_Async_static_0400
     * @tc.number Telephony_Sim_GetCardType_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_GetCardType_Async_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_GetCardType_Async_static_0400';
      try {
        sim.getCardType(SLOTID_INVALID, (err: BusinessError<void>|null, cardType: sim.CardType | undefined) => {
          if (err?.code !== 0) {
            hilog.error(domain, tag, CASE_NAME + ' GetCardType error: ' + JSON.stringify(err));
            expect(true).assertEqual(err?.code === 8300001);
            done();
          } else {
            hilog.info(domain, tag, CASE_NAME + ' finish cardType：' + cardType);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_Sim_GetCardType_try_catch_static_0400 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_GetCardType_Promise_static_0400
     * @tc.number Telephony_Sim_GetCardType_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_GetCardType_Promise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_GetCardType_Promise_static_0400';
      try {
        const cardType = await sim.getCardType(SLOTID_INVALID);
        hilog.info(domain, tag, CASE_NAME + ' finish');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, CASE_NAME + ' GetCardType error: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(8300001);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getSimSpn_Async_static_0200
     * @tc.number Telephony_Sim_getSimSpn_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getSimSpn_Async_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getSimSpn_Async_static_0200';
      try {
        sim.getSimSpn(SLOTID_INVALID, (err: BusinessError<void>|null, data: string|undefined) => {
          if (err?.code !== 0) {
            hilog.error(domain, tag, `${CASE_NAME} fail: ${err?.message}`);
            hilog.error(domain, tag, `${CASE_NAME} finish`);
            done();
          }else{
            expect().assertFail();
            hilog.info(domain, tag, `${CASE_NAME} fail, data = ${data}`);
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, CASE_NAME + ' Telephony_Sim_getSimSpn_try_catch_error_0200: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getSimSpn_Promise_static_0200
     * @tc.number Telephony_Sim_getSimSpn_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getSimSpn_Promise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getSimSpn_Promise_static_0200';
      try {
        let data = await sim.getSimSpn(SLOTID_INVALID);
        hilog.info(domain, tag, CASE_NAME + ' finish' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} expect err: ${err?.message}`);
        hilog.error(domain, tag, `${CASE_NAME} finish`);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getSimOperatorNumeric_Async_static_0200
     * @tc.number Telephony_Sim_getSimOperatorNumeric_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getSimOperatorNumeric_Async_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getSimOperatorNumeric_Async_static_0200';
      try {
        sim.getSimOperatorNumeric(SLOTID_INVALID, (err: BusinessError<void>|null, data: string|undefined) => {
          if (err?.code !== 0) {
            hilog.error(domain, tag, `${CASE_NAME} expect err: ${err?.message}`);
            hilog.error(domain, tag, `${CASE_NAME} finish`);
            done();
          }else {
            expect().assertFail();
            hilog.info(domain, tag, `${CASE_NAME} fail, data = ${data}`);
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_Sim_getSimOperatorNumeric_try_catch_static_0200 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getSimOperatorNumeric_Promise_static_0200
     * @tc.number Telephony_Sim_getSimOperatorNumeric_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getSimOperatorNumeric_Promise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getSimOperatorNumeric_Promise_static_0200';
      try {
        let data = await sim.getSimOperatorNumeric(SLOTID_INVALID);
        hilog.info(domain, tag, CASE_NAME + ' finish' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} expect err: ${err?.message}`);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_hasOperatorPrivileges_Async_static_0400
     * @tc.number Telephony_Sim_hasOperatorPrivileges_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_hasOperatorPrivileges_Async_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_hasOperatorPrivileges_Async_static_0400';
      try {
        sim.hasOperatorPrivileges(SLOTID_INVALID, (error: BusinessError<void>|null, result: boolean|undefined) => {
          if (error?.code !== 0) {
            hilog.error(domain, tag, CASE_NAME + 'hasOperatorPrivileges error: ' + JSON.stringify(error));
            expect(error?.code).assertEqual(8300001);
            done();
          }else{
            hilog.info(domain, tag, CASE_NAME + ' finish' + JSON.stringify(result));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_Sim_hasOperatorPrivileges_try_catch_static_0400 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_hasOperatorPrivileges_Promise_static_0400
     * @tc.number Telephony_Sim_hasOperatorPrivileges_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_hasOperatorPrivileges_Promise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_hasOperatorPrivileges_Promise_static_0400';
      try {
        const result = await sim.hasOperatorPrivileges(SLOTID_INVALID);
        hilog.info(domain, tag, CASE_NAME + ' finish' + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, CASE_NAME + 'hasOperatorPrivileges error: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(8300001);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getDefaultVoiceSimId_CallBack_static_0100
     * @tc.number Telephony_Sim_getDefaultVoiceSimId_CallBack_0100
     * @tc.desc   Telephony_Sim_getDefaultVoiceSimId_CallBack_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getDefaultVoiceSimId_CallBack_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getDefaultVoiceSimId_CallBack_static_0100';
      try {
        let simState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, CASE_NAME + " failed, SIM STATE IS UNKNOWN");
          hilog.info(domain, tag, CASE_NAME + " test end");
          done();
        }
        sim.getDefaultVoiceSimId((err: BusinessError<void>|null, data: int|undefined) => {
          if(err?.code !== 0){
            hilog.error(domain, tag, CASE_NAME + " err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else{
            hilog.info(domain, tag, CASE_NAME + " callback: err = " + JSON.stringify(err) + " data = " +JSON.stringify(data));
            sim.hasSimCard(0, (err:BusinessError<void>|null, data: boolean|undefined) => {
              hilog.info(domain, tag, CASE_NAME + " hasSimCard callback: err = " + JSON.stringify(err) + " data = " +JSON.stringify(data));
              expect(data).assertFalse();
              done();
            });
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, CASE_NAME + " err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_Sim_getDefaultVoiceSimId_Promise_static_0100
     * @tc.number Telephony_Sim_getDefaultVoiceSimId_Promise_0100
     * @tc.desc   Telephony_Sim_getDefaultVoiceSimId_Promise_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_Sim_getDefaultVoiceSimId_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getDefaultVoiceSimId_Promise_static_0100';
      try {
        let simState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, CASE_NAME + " failed, SIM STATE IS UNKNOWN");
          hilog.info(domain, tag, CASE_NAME + " test end");
          done();
        }
        let promise = sim.getDefaultVoiceSimId();
        promise.then((data: int|undefined) => {
          hilog.info(domain, tag, CASE_NAME + " data = " + data?.toString());
          sim.hasSimCard(0, (err:BusinessError<void>|null, data: boolean|undefined) => {
            hilog.info(domain, tag, CASE_NAME + " hasSimCard callback: err = " + JSON.stringify(err) + " data = " +JSON.stringify(data));
            expect(data).assertFalse();
            done();
          });
        }).catch(err => {
          hilog.info(domain, tag, CASE_NAME + " err = " + err);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, CASE_NAME + " err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  })
}