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
import { describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

export function toString(data:object) {
  if (typeof data === 'object') {
    return JSON.stringify(data);
  } else {
    return data;
  }
};

export default function callJsunit() {
  describe('callTest', ()=> {
    console.log("==========> call Test start ==========>");

    /**
     * @tc.name   Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.number Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.desc   Return type test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_HasVoiceCapability_HasVoiceCapability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = 'Telephony_Call_HasVoiceCapability_HasVoiceCapability';
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let voiceCapablity = call.hasVoiceCapability();
        if (voiceCapablity) {
          expect(voiceCapablity).assertEqual(true);
          console.info(`${caseName}  :voiceCapablity is ${JSON.stringify(voiceCapablity)}`);
        } else {
          expect(voiceCapablity).assertEqual(false);
          console.info(`${caseName}  :voiceCapablity is ${JSON.stringify(voiceCapablity)}`);
        }
        console.log(`==========> ${caseName} Test end ==========>`);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0700
     * @tc.number Telephony_Call_Call_MakeCall_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0700";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let context: Context = AppStorage.get('context') as Context;
          call.makeCall(context,"").then((data) => {
            console.log("Telephony_Call_Call_MakeCall_0700 makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_0700 makeCall callback: error->" + JSON.stringify(error.code));
            expect(false).assertTrue();
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_0700 makeCall callback: err->" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0500
     * @tc.number Telephony_Call_Call_MakeCall_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0500";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(null).then(() => {
            console.log("Telephony_Call_Call_MakeCall_0500 makeCall callback success");
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_0500 makeCall callback: err->" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_0500 makeCall callback: err->" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0300
     * @tc.number Telephony_Call_Call_MakeCall_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0300";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(null, (error) => {
            if (error) {
              console.log("makeCall callback: err->" + JSON.stringify(error));
              done();
            }
            console.log("makeCall callback success");
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0400
     * @tc.number Telephony_Call_Call_MakeCall_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0400";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(undefined, (error) => {
            if (error) {
              console.log("makeCall callback: err->" + JSON.stringify(error));
              done();
            }
            console.log("makeCall callback success");
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0800
     * @tc.number Telephony_Call_Call_MakeCall_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0800";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(null,"").then((data) => {
            console.log("makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("makeCall callback: err->" + JSON.stringify(error.code));
            expect(false).assertTrue();
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0900
     * @tc.number Telephony_Call_Call_MakeCall_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0900";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(undefined,"").then((data) => {
            console.log("makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("makeCall callback: err->" + JSON.stringify(error.code));
            expect(false).assertTrue();
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_1000
     * @tc.number Telephony_Call_Call_MakeCall_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_1000";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let context: Context = AppStorage.get('context') as Context;
          call.makeCall(context,null).then((data) => {
            console.log("Telephony_Call_Call_MakeCall_1000 makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_1000 makeCall callback: error->" + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_1000 makeCall callback: err->" + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(401);
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_1100
     * @tc.number Telephony_Call_Call_MakeCall_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_1100";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let context: Context = AppStorage.get('context') as Context;
          call.makeCall(context,undefined).then((data) => {
            console.log("Telephony_Call_Call_MakeCall_1100 makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_1100 makeCall callback: error->" + JSON.stringify(error.code));
            expect(Number(error.code)).assertEqual(401);
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_1100 makeCall callback: err->" + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(401);
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

  });
}