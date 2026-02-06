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
import { describe, beforeAll, afterAll, it, expect , Level, TestType, Size} from '@ohos/hypium'
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';


const SLOT_0: number = 0;
const SLOT_1: number = 1;
const SLOT_2: number = -1;
const SLOT_3: number = 1000000;
const SLOT_4: number = 0.0000001;
const SLOT_5: null = null;

let isSim0Active: Boolean = false;
let isSim1Active: Boolean = false;
let hasCard0: Boolean = false;
let hasCard1: Boolean = false;

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

const sleep = (numberMillis: number) => {
  let now = new Date();
  let exitTime = now.getTime() + numberMillis;
  while (true) {
    now = new Date();
    if (now.getTime() > exitTime) return;
  }
}

const checkPermissions = (async (done: Function) => {
  let list: Array<Permissions> = ['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context: Context = AppStorage.get('context') as Context;
  atManager.requestPermissionsFromUser(context, list, (err: BusinessError, result:PermissionRequestResult) => {
    if (err) {
      console.info(`getPermission err ${JSON.stringify(err)}`)
    } else {
      console.info(`getPermission result ${JSON.stringify(result)}`);
    }
    done();
  });
  sleep(5000);
  done();
});

export default function telephonyRadioPublicNeedCardTest() {
  describe('telephonyRadioPublicNeedCardTest', () => {
    /**
     * @tc.name   testTelephonyRadioGetRadioTech0100
     * @tc.number SUB_Telephony_Radio_GetRadioTech_0100
     * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyRadioGetRadioTech0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0100';
      console.info(`${caseName} test start`);
      sim.hasSimCard(SLOT_0, (err: BusinessError, data: boolean) => {
        if (data === true) {
          radio.getRadioTech(SLOT_0, (err: BusinessError, data: radio.NetworkRadioTech) => {
            if (err) {
              console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            }
          });
        } else {
          console.info(`${caseName}: No SIM card`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });
    /**
     * @tc.name   testTelephonyRadioGetRadioTech0700
     * @tc.number SUB_Telephony_Radio_GetRadioTech_0700
     * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyRadioGetRadioTech0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0700';
      console.info(`${caseName} test start`);
      sim.hasSimCard(SLOT_0, (err: BusinessError, data: boolean) => {
        if (data === true) {
          try {
            let data = radio.getRadioTech(SLOT_0);
            console.info(`${caseName} success, Promise: data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } catch (err) {
            console.info(`${caseName} failed, Promise: err->${err}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        } else {
          console.info(`${caseName}: No SIM card`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });
    /**
     * @tc.name   testTelephonyRadioGetNetworkState0100
     * @tc.number SUB_Telephony_Radio_GetNetworkState_0100
     * @tc.desc   Get the current network status; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyRadioGetNetworkState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0100';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          sim.isSimActive(SLOT_0).then((data: boolean) => {
            console.info(`${caseName} isSimCard success, promise: data->${JSON.stringify(data)}`);
            if (data) {
              radio.getNetworkState((err: BusinessError, data: radio.NetworkState) => {
                if (err) {
                  console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
                  ExpectTrue(false);
                  console.info(`${caseName} test end`);
                  done();
                } else {
                  console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
                  ExpectTrue(typeof data.longOperatorName === 'string'
                    && typeof data.shortOperatorName === 'string'
                    && typeof data.plmnNumeric === 'string'
                    && typeof data.isRoaming === 'boolean'
                    && typeof data.isCaActive === 'boolean'
                    && typeof data.isEmergency === 'boolean');
                }
                console.info(`${caseName} test end`);
                done();
              });
            }
            else {
              ExpectTrue(data);
              console.info(`${caseName} test end`);
              done();
              console.info(`${caseName} isSimCard unactivated `);
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} isSimCard failed, promise: err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
          });
        } catch {
          console.info(`${caseName} failed`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        }
      }


    });
    /**
     * @tc.name   testTelephonyRadioGetNetworkState0200
     * @tc.number SUB_Telephony_Radio_GetNetworkState_0200
     * @tc.desc   Parameter 0 is used to obtain the network status; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyRadioGetNetworkState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0200';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          sim.isSimActive(SLOT_0).then((data: boolean) => {
            console.info(`${caseName} isSimActive success, promise: data->${JSON.stringify(data)}`);
            if (data) {
              radio.getNetworkState(SLOT_0, (err: BusinessError, data: radio.NetworkState) => {
                if (err) {
                  console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
                  ExpectTrue(false);
                  console.info(`${caseName} test end`);
                  done();
                } else {
                  console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
                  ExpectTrue(typeof data.longOperatorName === 'string'
                    && typeof data.shortOperatorName === 'string'
                    && typeof data.plmnNumeric === 'string'
                    && typeof data.isRoaming === 'boolean'
                    && typeof data.isCaActive === 'boolean'
                    && typeof data.isEmergency === 'boolean');
                  console.info(`${caseName} test end`);
                  done();
                }
              });
            } else {
              ExpectTrue(data);
              console.info(`${caseName} test end`);
              done();
              console.info(`${caseName} isSimCard unactivated `);
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} isSimActive failed, promise: err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
          });
        } catch {
          console.info(`${caseName} failed`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        }
      }

    });
    /**
     * @tc.name   testTelephonyRadioGetNetworkState0600
     * @tc.number SUB_Telephony_Radio_GetNetworkState_0600
     * @tc.desc   Parameter 0 is used to obtain the network status; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyRadioGetNetworkState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0600';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          sim.isSimActive(SLOT_0).then((data: boolean) => {
            console.info(`${caseName} isSimActive success, promise: data->${JSON.stringify(data)}`);
            if (data) {
              radio.getNetworkState(SLOT_0).then((data: radio.NetworkState) => {
                console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
                ExpectTrue(typeof data.longOperatorName === 'string'
                  && typeof data.shortOperatorName === 'string'
                  && typeof data.plmnNumeric === 'string'
                  && typeof data.isRoaming === 'boolean'
                  && typeof data.isCaActive === 'boolean'
                  && typeof data.isEmergency === 'boolean');
                console.info(`${caseName} test end`);
                done();
              }).catch((err: BusinessError) => {
                console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                console.info(`${caseName} test end`);
                done();
              });
            } else {
              console.info(`${caseName} sim unactivated`);
              ExpectTrue(false);
              console.info(`${caseName} test end`);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} isSimActive failed, promise: err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
          });
        } catch {
          console.info(`${caseName} failed`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        }
      }

    });
    /**
     * @tc.name   testTelephonyRadioGetNetworkState1000
     * @tc.number SUB_Telephony_Radio_GetNetworkState_1000
     * @tc.desc   Get network status without passing parameters; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyRadioGetNetworkState1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState1000';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          sim.isSimActive(SLOT_0).then((data: boolean) => {
            console.info(`${caseName} isSimActive success, promise: data->${JSON.stringify(data)}`);
            if (data) {
              radio.getNetworkState().then((data: radio.NetworkState) => {
                console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
                ExpectTrue(typeof data.longOperatorName === 'string'
                  && typeof data.shortOperatorName === 'string'
                  && typeof data.plmnNumeric === 'string'
                  && typeof data.isRoaming === 'boolean'
                  && typeof data.isCaActive === 'boolean'
                  && typeof data.isEmergency === 'boolean');
                console.info(`${caseName} test end`);
                done();
              }).catch((err: BusinessError) => {
                console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                console.info(`${caseName} test end`);
                done();
              });
            } else {
              console.info(`${caseName} sim unactivated`);
              ExpectTrue(false);
              console.info(`${caseName} test end`);
              done();
            }
          }).catch((err: BusinessError) => {
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
            console.info(`${caseName} isSimActive failed, promise: err->${JSON.stringify(err)}`);
          });
        } catch {
          console.info(`${caseName} failed`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        }
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetNetworkSelectionModeAsync0100
     * @tc.number SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetNetworkSelectionModeAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync0100';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        if (isSim0Active) {
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
        else {
          radio.getNetworkSelectionMode(SLOT_0, (err: BusinessError, data: radio.NetworkSelectionMode) => {
            if (err) {
              console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
            else {
              console.info(`${caseName} success, data->${JSON.stringify(data)}`);
              ExpectTrue(data >= 0);
              console.info(`${caseName} test end`);
              done();
            }
          });
        }
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetNetworkSelectionModePromise0100
     * @tc.number SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise0100';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        if (isSim0Active) {
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
        else {
          radio.getNetworkSelectionMode(SLOT_0).then((data: radio.NetworkSelectionMode) => {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(data >= 0);
            console.info(`${caseName} test end`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        }
      }

    });
    /**
     * @tc.name   testTelephonyRadioGetISOCountryCodeForNetworkAsync0100
     * @tc.number SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync0100';
      console.info(`${caseName} test start`);
      if (isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        radio.getISOCountryCodeForNetwork(SLOT_0, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
          else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data === 'string');
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetISOCountryCodeForNetworkPromise0100
     * @tc.number SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise0100';
      console.info(`${caseName} test start`);
      if (isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        radio.getISOCountryCodeForNetwork(SLOT_0).then((data: string) => {
          console.info(`${caseName} success, data->${JSON.stringify(data)}`);
          ExpectTrue(typeof data === 'string');
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        });
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetISOCountryCodeForNetworkSync0100
     * @tc.number SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Sync_0100
     * @tc.desc   slotId parameter input is 0,isSim0Active is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkSync0100';
      console.info(`${caseName} test start`);
      if (isSim0Active) {
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      else {
        try {
          let data = radio.getISOCountryCodeForNetworkSync(SLOT_0);
          console.info(`${caseName} success, data->${JSON.stringify(data)}`);
          ExpectTrue(typeof data === 'string');
          console.info(`${caseName} test end`);
          done();
        }
        catch (err) {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetPrimarySlotId0100
     * @tc.number SUB_Telephony_Radio_GetPrimarySlotId_0100
     * @tc.desc   Obtain the index number of the slot where the main card is located. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetPrimarySlotId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0100';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        radio.setPrimarySlotId(SLOT_0, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} success.`);
            radio.getPrimarySlotId((err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end`);
                done();
              } else {
                console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
                ExpectTrue(data === SLOT_0);
                console.info(`${caseName} test end`);
                done();
              }
            });
          }
        });
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetPrimarySlotId0400
     * @tc.number SUB_Telephony_Radio_GetPrimarySlotId_0400
     * @tc.desc   Obtain the index number of the slot where the main card is located. Use Promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetPrimarySlotId0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0400';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        radio.setPrimarySlotId(SLOT_0, (err: BusinessError) => {
          if (err) {
            console.info(`setPrimarySlotId failed, callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`setPrimarySlotId success.`);
            radio.getPrimarySlotId().then((data: number) => {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(data === SLOT_0);
              done()
            }).catch((err: BusinessError) => {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            });
          }
        });
      }
    });
    /**
     * @tc.name   testTelephonyRadioGetSignalInformation0100
     * @tc.number SUB_Telephony_Radio_GetSignalInformation_0100
     * @tc.desc   Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetSignalInformation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation0100';
      console.info(`${caseName} test start`);
      sim.hasSimCard(SLOT_0, (err: BusinessError, data: boolean) => {
        if (data === true) {
          radio.getSignalInformation(SLOT_0, (err: BusinessError, data: Array<radio.SignalInformation>) => {
            if (err) {
              console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            }
          });
        } else {
          console.info(`${caseName}: No SIM card`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });
    /**
     * @tc.name   testTelephonyRadioGetSignalInformation0700
     * @tc.number SUB_Telephony_Radio_GetSignalInformation_0700
     * @tc.desc   Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use Promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetSignalInformation0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation0700';
      console.info(`${caseName} test start`);
      sim.hasSimCard(SLOT_0, (err: BusinessError, data: boolean) => {
        if (data === true) {
          radio.getSignalInformation(SLOT_0).then((data: Array<radio.SignalInformation>) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        } else {
          console.info(`${caseName}: No SIM card`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });
    /**
     * @tc.name   testTelephonyRadioIsRadioOn0100
     * @tc.number SUB_Telephony_Radio_IsRadioOn_0100
     * @tc.desc   Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioIsRadioOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0100';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        radio.setPrimarySlotId(SLOT_0, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} success.`);
            radio.isRadioOn((err: BusinessError, data: boolean) => {
              if (err) {
                console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end`);
                done();
              } else {
                console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              }
            });
          }
        });
      }
    });
    /**
     * @tc.name   testTelephonyRadioIsRadioOn0900
     * @tc.number SUB_Telephony_Radio_IsRadioOn_0900
     * @tc.desc   Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioIsRadioOn0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0900';
      console.info(`${caseName} test start`);
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let isSimActive = sim.isSimActiveSync(SLOT_0);
        if (isSimActive === true) {
          radio.isRadioOn(SLOT_0).then((data: boolean) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        } else {
          console.info(`${caseName} SIM not activated`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });
  });
}