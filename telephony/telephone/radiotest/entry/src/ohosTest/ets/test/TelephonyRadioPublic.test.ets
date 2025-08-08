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

export default function telephonyRadioPublicTest() {

  describe('telephonyRadioPublicTest', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      try {
        hasCard0 = sim.hasSimCardSync(SLOT_0);
        hasCard1 = sim.hasSimCardSync(SLOT_1);
        isSim0Active = sim.isSimActiveSync(SLOT_0);
        isSim1Active = sim.isSimActiveSync(SLOT_1);
        if (hasCard0) {
          console.info(`RTS--hasSimCard 0`);
        }
        if (hasCard1) {
          console.info(`RTS--hasSimCard 1`);
        }
        if (isSim0Active) {
          console.info(`RTS--isSimActiveSync 0`);
        }
        if (isSim1Active) {
          console.info(`RTS--isSimActiveSync 1`);
        }
        done();
      } catch (err) {
        console.info(`an error occurred to check SIM card activation status, ${JSON.stringify(err)}`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0300
     * @tc.name  : testTelephonyRadioGetRadioTech0300
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetRadioTech0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0300';
      console.info(`${caseName} test start`);
      radio.getRadioTech(SLOT_2, (err: BusinessError, data: radio.NetworkRadioTech) => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`)
          ExpectTrue(err.code === 8300001)
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0400
     * @tc.name  : testTelephonyRadioGetRadioTech0400
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetRadioTech0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0400';
      console.info(`${caseName} test start`);
      radio.getRadioTech(SLOT_3, (err: BusinessError, data: radio.NetworkRadioTech) => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001)
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0600
     * @tc.name  : testTelephonyRadioGetRadioTech0600
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetRadioTech0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0600';
      console.info(`${caseName} test start`);
      try {
        radio.getRadioTech(SLOT_5, (err: BusinessError, data: radio.NetworkRadioTech) => {
          if (err) {
            console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0900
     * @tc.name  : testTelephonyRadioGetRadioTech0900
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetRadioTech0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech0900';
      console.info(`${caseName} test start`);
      try {
        let data = await radio.getRadioTech(SLOT_2);
        console.info(`${caseName} success, Promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed, Promise: err->${err}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_1000
     * @tc.name  : testTelephonyRadioGetRadioTech1000
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetRadioTech1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech1000';
      console.info(`${caseName} test start`);
      try {
        let data = await radio.getRadioTech(SLOT_3);
        console.info(`${caseName} success, Promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed, Promise: err->${err}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_1200
     * @tc.name  : testTelephonyRadioGetRadioTech1200
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetRadioTech1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetRadioTech1200';
      console.info(`${caseName} test start`);
      try {
        let data = await radio.getRadioTech(SLOT_5);
        console.info(`${caseName} success, Promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed, Promise: err->${err}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_0400
     * @tc.name  : testTelephonyRadioGetNetworkState0400
     * @tc.desc  : Parameter -1 is used to obtain the network status; callback
     * @tc.size  : Medium
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('testTelephonyRadioGetNetworkState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0400';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkState(SLOT_2, (err: BusinessError, data: radio.NetworkState) => {
          if (err) {
            console.info(`${caseName} success, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 8300001);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, callback: data->${JSON.stringify(data)}`);
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
      catch (err) {
        console.info(`${caseName} failed`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_0500
     * @tc.name  : testTelephonyRadioGetNetworkState0500
     * @tc.desc  : Parameter null is used to obtain the network status; callback
     * @tc.size  : Medium
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('testTelephonyRadioGetNetworkState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0500';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkState(SLOT_5, (err: BusinessError, data: radio.NetworkState) => {
          if (err) {
            console.info(`GetNetworkStateSlotIdCallback0400 success, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`GetNetworkStateSlotIdCallback0400 failed, callback: data->${JSON.stringify(data)}`);
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} failed`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_0800
     * @tc.name  : testTelephonyRadioGetNetworkState0800
     * @tc.desc  : Parameter -1 is used to obtain the network status; promise
     * @tc.size  : Medium
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('testTelephonyRadioGetNetworkState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0800';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkState(SLOT_2).then((data: radio.NetworkState) => {
          console.info(`${caseName} failed ,promise: data->${JSON.stringify(data)}`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} success, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} failed`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkState_0900
     * @tc.name  : testTelephonyRadioGetNetworkState0900
     * @tc.desc  : Parameter null is used to obtain the network status; promise
     * @tc.size  : Medium
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('testTelephonyRadioGetNetworkState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkState0900';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkState(SLOT_5).then((data: radio.NetworkState) => {
          console.info(`${caseName} failed ,promise: data->${JSON.stringify(data)}`);
          ExpectTrue(typeof data.longOperatorName === 'string'
            && typeof data.shortOperatorName === 'string'
            && typeof data.plmnNumeric === 'string'
            && typeof data.isRoaming === 'boolean'
            && typeof data.isCaActive === 'boolean'
            && typeof data.isEmergency === 'boolean');
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} success, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} failed`);
        ExpectTrue(false);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0500
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModeAsync0500
     * @tc.desc  : slotId parameter input is -1
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModeAsync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync0500';
      console.info(`${caseName} test start`);
      radio.getNetworkSelectionMode(SLOT_2, (err: BusinessError, data: radio.NetworkSelectionMode) => {
        if (err) {
          console.info(`${caseName} success, err->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }
        else {
          console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0600
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModeAsync0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModeAsync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync0600';
      console.info(`${caseName} test start`);
      radio.getNetworkSelectionMode(SLOT_3, (err: BusinessError, data: radio.NetworkSelectionMode) => {
        if (err) {
          console.info(`${caseName} success, err->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }
        else {
          console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0800
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModeAsync0800
     * @tc.desc  : slotId parameter input is null
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModeAsync0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync0800';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkSelectionMode(SLOT_5, (err: BusinessError, data: radio.NetworkSelectionMode) => {
          if (err) {
            console.info(`${caseName} success, err->${JSON.stringify(data)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          }
          else {
            console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0500
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModePromise0500
     * @tc.desc  : slotId parameter input is -1
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise0500';
      console.info(`${caseName} test start`);
      radio.getNetworkSelectionMode(SLOT_2).then((data: radio.NetworkSelectionMode) => {
        console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0600
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModePromise0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise0600';
      console.info(`${caseName} test start`);
      radio.getNetworkSelectionMode(SLOT_3).then((data: radio.NetworkSelectionMode) => {
        console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0800
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModePromise0800
     * @tc.desc  : slotId parameter input is null
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise0800';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkSelectionMode(SLOT_5).then((data: radio.NetworkSelectionMode) => {
          console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} success, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName} test end`);
          done();
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0500
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkAsync0500
     * @tc.desc  : slotId parameter input is -1
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkAsync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync0500';
      console.info(`${caseName} test start`);
      radio.getISOCountryCodeForNetwork(SLOT_2, (err: BusinessError, data: string) => {
        if (err) {
          console.info(`${caseName} success, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        }
        else {
          console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0600
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkAsync0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkAsync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync0600';
      console.info(`${caseName} test start`);
      radio.getISOCountryCodeForNetwork(SLOT_3, (err: BusinessError, data: string) => {
        if (err) {
          console.info(`${caseName} success, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        }
        else {
          console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0800
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkAsync0800
     * @tc.desc  : slotId parameter input is null
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkAsync0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync0800';
      console.info(`${caseName} test start`);
      try {
        radio.getISOCountryCodeForNetwork(SLOT_5, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} success, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          }
          else {
            console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0500
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkPromise0500
     * @tc.desc  : slotId parameter input is 0
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkPromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise0500';
      console.info(`${caseName} test start`);
      radio.getISOCountryCodeForNetwork(SLOT_2).then((data: string) => {
        console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0600
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkPromise0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkPromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise0600';
      console.info(`${caseName} test start`);
      radio.getISOCountryCodeForNetwork(SLOT_3).then((data: string) => {
        console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0800
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkPromise0800
     * @tc.desc  : slotId parameter input is null
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetISOCountryCodeForNetworkPromise0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise0800';
      console.info(`${caseName} test start`);
      try {
        radio.getISOCountryCodeForNetwork(SLOT_5).then((data: string) => {
          console.info(`${caseName} failed, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} success, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName} test end`);
          done();
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetPrimarySlotId_0300
     * @tc.name  : testTelephonyRadioGetPrimarySlotId0300
     * @tc.desc  : Obtain the index number of the slot where the main card is located. Use callback for asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetPrimarySlotId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0300';
      console.info(`${caseName} test start`);
      radio.getPrimarySlotId((err: BusinessError, data: number) => {
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
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetPrimarySlotId_0600
     * @tc.name  : testTelephonyRadioGetPrimarySlotId0600
     * @tc.desc  : Obtain the index number of the slot where the main card is located. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetPrimarySlotId0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0600';
      console.info(`${caseName} test start`);
      radio.getPrimarySlotId().then((data: number) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        done()
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetSignalInformation_0300
     * @tc.name  : testTelephonyRadioGetSignalInformation0300
     * @tc.desc  : Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetSignalInformation0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation0300';
      console.info(`${caseName} test start`);
      radio.getSignalInformation(SLOT_2, (err: BusinessError, data: Array<radio.SignalInformation>) => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetSignalInformation_0400
     * @tc.name  : testTelephonyRadioGetSignalInformation0400
     * @tc.desc  : Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use callback for asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetSignalInformation0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation0400';
      console.info(`${caseName} test start`);
      radio.getSignalInformation(SLOT_3, (err: BusinessError, data: Array<radio.SignalInformation>) => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetSignalInformation_0600
     * @tc.name  : testTelephonyRadioGetSignalInformation0600
     * @tc.desc  : Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetSignalInformation0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation0600';
      console.info(`${caseName} test start`);
      try {
        radio.getSignalInformation(SLOT_5, (err: BusinessError, data: Array<radio.SignalInformation>) => {
          if (err) {
            console.info(`testGetSignalInformation0600 failed, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`testGetSignalInformation0600 success, callback: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetSignalInformation_0900
     * @tc.name  : testTelephonyRadioGetSignalInformation0900
     * @tc.desc  : Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use Promise for asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetSignalInformation0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation0900';
      console.info(`${caseName} test start`);
      radio.getSignalInformation(SLOT_2).then((data: Array<radio.SignalInformation>) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetSignalInformation_1000
     * @tc.name  : testTelephonyRadioGetSignalInformation1000
     * @tc.desc  : Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use Promise for asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetSignalInformation1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation1000';
      console.info(`${caseName} test start`);
      radio.getSignalInformation(SLOT_3).then((data: Array<radio.SignalInformation>) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetSignalInformation_1200
     * @tc.name  : testTelephonyRadioGetSignalInformation1200
     * @tc.desc  : Obtain a list of registered network signal strength information corresponding to the specified SIM card slot. Use Promise for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetSignalInformation1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetSignalInformation1200';
      console.info(`${caseName} test start`);
      try {
        radio.getSignalInformation(SLOT_5).then((data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName} test end`);
          done();
        });
      }
      catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0100
     * @tc.name  : testTelephonyRadioIsNRSupported0100
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioIsNRSupported0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0100';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported();
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0200
     * @tc.name  : testTelephonyRadioIsNRSupported0200
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0200';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported(SLOT_0);
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0300
     * @tc.name  : testTelephonyRadioIsNRSupported0300
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0300';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported(SLOT_1);
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0700
     * @tc.name  : testTelephonyRadioIsNRSupported0700
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0700';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported(SLOT_5);
        console.info(`${caseName} success: " + result`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + ${err}`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0800
     * @tc.name  : testTelephonyRadioIsNRSupported0800
     * @tc.desc  : Deprecated.  Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0800';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNrSupported();
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0900
     * @tc.name  : testTelephonyRadioIsNRSupported0900
     * @tc.desc  : Deprecated. Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0900';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNrSupported(SLOT_0);
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_1000
     * @tc.name  : testTelephonyRadioIsNRSupported1000
     * @tc.desc  : Deprecated. Determine if the current device supports 5G (NR).
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsNRSupported1000';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNrSupported(SLOT_1);
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0500
     * @tc.name  : testTelephonyRadioIsRadioOn0500
     * @tc.desc  : Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsRadioOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0500';
      console.info(`${caseName} test start`);
      radio.isRadioOn(SLOT_2, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0600
     * @tc.name  : testTelephonyRadioIsRadioOn0600
     * @tc.desc  : Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsRadioOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0600';
      console.info(`${caseName} test start`);
      radio.isRadioOn(SLOT_3, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0800
     * @tc.name  : testTelephonyRadioIsRadioOn0800
     * @tc.desc  : Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioIsRadioOn0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn0800';
      console.info(`${caseName} test start`);
      try {
        radio.isRadioOn(SLOT_5, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} success, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_1100
     * @tc.name  : testTelephonyRadioIsRadioOn1100
     * @tc.desc  : Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioIsRadioOn1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn1100';
      console.info(`${caseName} test start`);
      radio.isRadioOn(SLOT_2).then((data: boolean) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_1200
     * @tc.name  : testTelephonyRadioIsRadioOn1200
     * @tc.desc  : Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioIsRadioOn1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioIsRadioOn1200';
      console.info(`${caseName} test start`);
      radio.isRadioOn(SLOT_3).then((data: boolean) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetOperatorName_1000
     * @tc.name  : testTelephonyRadioGetOperatorName1000
     * @tc.desc  : Pass the parameter null to get the carrier name; callback
     * @tc.size  : Medium
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('testTelephonyRadioGetOperatorName1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetOperatorName1000';
      console.info(`${caseName} test start`);
      try {
        radio.getOperatorName(SLOT_5, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            console.info(`${caseName} test end`);
            done();
          }
          else {
            console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
            ExpectTrue(false);
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} failed`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetOperatorName_2000
     * @tc.name  : testTelephonyRadioGetOperatorName2000
     * @tc.desc  : Pass the parameter null to get the carrier name; promise
     * @tc.size  : Medium
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('testTelephonyRadioGetOperatorName2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyRadioGetOperatorName2000';
      console.info(`${caseName} test start`);
      try {
        radio.getOperatorName(SLOT_5).then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(false);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} failed`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      let mode0: radio.PreferredNetworkMode = radio.PreferredNetworkMode.PREFERRED_NETWORK_MODE_NR_LTE_TDSCDMA_WCDMA_GSM_EVDO_CDMA;
      await radio.setPreferredNetwork(SLOT_0, mode0);
      await radio.setPreferredNetwork(SLOT_1, mode0);
    });
  });

}