/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import call from '@ohos.telephony.call'
import radio from '@ohos.telephony.radio'
import sim from '@ohos.telephony.sim'

export default function telSyncTest() {
  describe('telSyncTest', () => {
    console.log("==========> Sync Test start ==========>");
    /*
     * @tc.number  SUB_Telephony_call_hasCallSync_0100
     * @tc.name    Call interface hasCallSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_call_hasCallSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Telephony_call_hasCallSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          console.info("SUB_Telephony_call_hasCallSync_0100 hasCallSync " + call.hasCallSync());
          expect(call.hasCallSync()).assertFalse();
          done();
        } catch (err) {
          console.info("SUB_Telephony_call_hasCallSync_0100 " + JSON.stringify(err));
          expect(true).assertFalse();
          done();
        }
      }
    });

    /*
     * @tc.number  SUB_Telephony_call_getCallStateSync_0100
     * @tc.name    Call interface getCallStateSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_call_getCallStateSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Telephony_call_getCallStateSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          console.info("SUB_Telephony_call_getCallStateSync_0100 getCallStateSync " + call.getCallStateSync());
          expect(call.getCallStateSync()).assertEqual(call.CallState.CALL_STATE_IDLE);
          done();
        } catch (err) {
          console.info("SUB_Telephony_call_getCallStateSync_0100 " + JSON.stringify(err));
          expect(true).assertFalse();
          done();
        }
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100
     * @tc.name    Call interface getISOCountryCodeForNetworkSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          if (data) {
            try {
              console.info("SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 " +
              radio.getISOCountryCodeForNetworkSync(slotId));
              expect(radio.getISOCountryCodeForNetworkSync(slotId) != "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              console.info("SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 " +
              radio.getISOCountryCodeForNetworkSync(slotId));
              done();
            } catch (err) {
              console.info("SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getSignalInformationSync_0100
     * @tc.name    Call interface getSignalInformationSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getSignalInformationSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Telephony_radio_getSignalInformationSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        radio.isRadioOn((err, data) => {
          if (err) {
            try {
              console.info("SUB_Telephony_radio_getSignalInformationSync_0100 111  " +
              radio.getSignalInformationSync(slotId));
              expect(radio.getSignalInformationSync(slotId).length).assertEqual(0);
              done();
            } catch (err) {
              console.info("SUB_Telephony_radio_getSignalInformationSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              console.info("SUB_Telephony_radio_getSignalInformationSync_0100 " +
              radio.getSignalInformationSync(slotId));
              expect(radio.getSignalInformationSync(slotId).length >= 0).assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_radio_getSignalInformationSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getOperatorNameSync_0100
     * @tc.name    Call interface getOperatorNameSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getOperatorNameSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Telephony_radio_getOperatorNameSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          if (data) {
            try {
              console.info("SUB_Telephony_radio_getOperatorNameSync_0100 " + radio.getOperatorNameSync(slotId));
              expect(radio.getOperatorNameSync(slotId) != "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_radio_getOperatorNameSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              console.info("SUB_Telephony_radio_getOperatorNameSync_0100 " + radio.getOperatorNameSync(slotId));
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_radio_getOperatorNameSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

        /*
 * @tc.number  SUB_Telephony_radio_getRadioTechSync_0100
 * @tc.name    Radio interface getRadioTechSync
 * @tc.desc    Function test
 */
    it('SUB_Telephony_radio_getRadioTechSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      try {
        let slotId = 0;
        console.info("SUB_Telephony_radio_getRadioTechSync_0100 " + radio.getRadioTechSync(slotId));
        expect(radio.getRadioTechSync(slotId).psRadioTech >= -1).assertTrue();
        done();
      } catch (err) {
        console.info("SUB_Telephony_radio_getRadioTechSync_0100 err " + JSON.stringify(err));
        expect(err != "").assertTrue();
        done();
      }
    });

    /*
* @tc.number  SUB_Telephony_radio_getRadioTechSync_0200
* @tc.name    Radio interface getRadioTechSync
* @tc.desc    Function test
*/
    it('SUB_Telephony_radio_getRadioTechSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      try {
        let slotId = 0;
        console.info("SUB_Telephony_radio_getRadioTechSync_0200 " + radio.getRadioTechSync(slotId));
        expect(radio.getRadioTechSync(slotId).csRadioTech >= -1).assertTrue();
        done();
      } catch (err) {
        console.info("SUB_Telephony_radio_getRadioTechSync_0200 err " + JSON.stringify(err));
        expect(err != "").assertTrue();
        done();
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_isSimActiveSync_0100
     * @tc.name    Call interface isSimActiveSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_isSimActiveSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_isSimActiveSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          if (data) {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_isSimActiveSync_0100 " + sim.isSimActiveSync(slotId));
              expect(sim.isSimActiveSync(slotId)).assertEqual(true);
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_isSimActiveSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_isSimActiveSync_0100 " + sim.isSimActiveSync(slotId));
              expect(sim.isSimActiveSync(slotId)).assertEqual(false);
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_isSimActiveSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getISOCountryCodeForSimSync_0100
     * @tc.name    Call interface getISOCountryCodeForSimSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getISOCountryCodeForSimSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_getISOCountryCodeForSimSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          if (data) {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getISOCountryCodeForSimSync_0100 " +
              sim.getISOCountryCodeForSimSync(slotId));
              expect(sim.getISOCountryCodeForSimSync(slotId) != "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getISOCountryCodeForSimSync_0100 err " + JSON.stringify(err));
              expect(err.code == 8300004).assertTrue();
              done();
            }
          } else {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getISOCountryCodeForSimSync_0100 " +
              sim.getISOCountryCodeForSimSync(slotId));
              expect(sim.getISOCountryCodeForSimSync(slotId) == "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getISOCountryCodeForSimSync_0100 err " + JSON.stringify(err));
              expect(err.code == 8300004).assertTrue();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getSimOperatorNumericSync_0100
     * @tc.name    Call interface getSimOperatorNumericSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getSimOperatorNumericSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_getSimOperatorNumericSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          if (data) {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getSimOperatorNumericSync_0100 " +
              sim.getSimOperatorNumericSync(slotId));
              expect(sim.getSimOperatorNumericSync(slotId) != "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getSimOperatorNumericSync_0100 err " + JSON.stringify(err));
              expect(err.code == 8300004).assertTrue();
              done();
            }
          } else {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getSimOperatorNumericSync_0100 " +
              sim.getSimOperatorNumericSync(slotId));
              expect(sim.getSimOperatorNumericSync(slotId) == "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getSimOperatorNumericSync_0100 err " + JSON.stringify(err));
              expect(err.code == 8300004).assertTrue();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getSimSpnSync_0100
     * @tc.name    Call interface getSimSpnSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getSimSpnSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_getSimSpnSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          if (data) {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getSimSpnSync_0100 " + sim.getSimSpnSync(slotId));
              expect(sim.getSimSpnSync(slotId) != "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getSimSpnSync_0100 err " + JSON.stringify(err));
              expect(err.code == 8300004).assertTrue();
              done();
            }
          } else {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getSimSpnSync_0100 " + sim.getSimSpnSync(slotId));
              expect(sim.getSimSpnSync(slotId) == "").assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getSimSpnSync_0100 err " + JSON.stringify(err));
              expect(err.code == 8300004).assertTrue();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getSimStateSync_0100
     * @tc.name    Call interface getSimStateSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getSimStateSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_getSimStateSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          console.info((`callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`));
          if (data) {
            try {
              console.info("SUB_Telephony_sim_getSimStateSync_0100 " + sim.getSimStateSync(slotId));
              expect(sim.getSimStateSync(slotId) >= sim.SimState.SIM_STATE_UNKNOWN).assertTrue();
              expect(sim.getSimStateSync(slotId) <= sim.SimState.SIM_STATE_LOADED).assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getSimStateSync_0100 err " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            }
          } else {
            try {
              console.info("SUB_Telephony_sim_getSimStateSync_0100 " + sim.getSimStateSync(slotId));
              expect(sim.getSimStateSync(slotId) == sim.SimState.SIM_STATE_NOT_PRESENT).assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getSimStateSync_0100 err " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getCardTypeSync_0100
     * @tc.name    Call interface getCardTypeSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getCardTypeSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_getCardTypeSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let slotId = 0;
          console.info("SUB_Telephony_sim_getCardTypeSync_0100 " + sim.getCardTypeSync(slotId));
          expect(sim.getCardTypeSync(slotId) >= -1).assertTrue();
          done();
        } catch (err) {
          console.info("SUB_Telephony_sim_getCardTypeSync_0100 err " + JSON.stringify(err));
          expect(err.code == 8300004).assertTrue();
          done();
        }
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_hasSimCardSync_0100
     * @tc.name    Call interface hasSimCardSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_hasSimCardSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_hasSimCardSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err, data) => {
          console.info((`callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`));
          if (data) {
            try {
              console.info("SUB_Telephony_sim_hasSimCardSync_0100 " + sim.hasSimCardSync(slotId));
              expect(sim.hasSimCardSync(slotId)).assertTrue();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_hasSimCardSync_0100 err " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            }
          } else {
            try {
              console.info("SUB_Telephony_sim_hasSimCardSync_0100 " + sim.hasSimCardSync(slotId));
              expect(sim.hasSimCardSync(slotId)).assertFalse();
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_hasSimCardSync_0100 err " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getOpKeySync_0100
     * @tc.name    Call interface getOpKeySync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getOpKeySync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_getOpKeySync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        sim.hasSimCard(0, (err, data: boolean) => {
          if (!data) {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getOpKeySync_0100 " + sim.getOpKeySync(slotId));
              expect(sim.getOpKeySync(slotId)).assertEqual("");
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getOpKeySync_0100 err " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            }
          } else {
            console.info(`SUB_Telephony_sim_getOpKeySync_0100 fail: has card`);
            console.info(`SUB_Telephony_sim_getOpKeySync_0100 test end `);
            done();
          }
        })
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getOpNameSync_0100
     * @tc.name    Call interface getOpNameSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getOpNameSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Telephony_sim_hasSimCardSync_0100';
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        sim.hasSimCard(0, (err, data: boolean) => {
          if (!data) {
            try {
              let slotId = 0;
              console.info("SUB_Telephony_sim_getOpNameSync_0100 " + sim.getOpKeySync(slotId));
              expect(sim.getOpNameSync(slotId)).assertEqual("");
              done();
            } catch (err) {
              console.info("SUB_Telephony_sim_getOpNameSync_0100 err " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            }
          } else {
            console.info(`SUB_Telephony_sim_getOpNameSync_0100 fail: has card`);
            console.info(`SUB_Telephony_sim_getOpNameSync_0100 test end `);
            done();
          }
        })
      }
    });
  });
}