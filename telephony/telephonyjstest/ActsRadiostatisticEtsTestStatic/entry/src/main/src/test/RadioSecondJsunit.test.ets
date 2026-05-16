/**
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';

const NETWORK_TYPES = [
  radio.NetworkType.NETWORK_TYPE_UNKNOWN,
  radio.NetworkType.NETWORK_TYPE_GSM,
  radio.NetworkType.NETWORK_TYPE_CDMA,
  radio.NetworkType.NETWORK_TYPE_WCDMA,
  radio.NetworkType.NETWORK_TYPE_TDSCDMA,
  radio.NetworkType.NETWORK_TYPE_LTE,
  radio.NetworkType.NETWORK_TYPE_NR,
];
const NETWORK_SIGNAL = [0, 1, 2, 3, 4, 5];
let domain: int = 0x0000;
let tag: string = 'testTag';

function assertCellInformation(data:Array<radio.CellInformation>) {
  expect(data != undefined && data != null).assertTrue();
  expect(data.length).assertLarger(0);
  for (let i = 0; i < data.length; i++) {
    expect(NETWORK_TYPES).assertContain(data[i].networkType);
    expect(NETWORK_TYPES).assertContain(data[i].signalInformation.signalType);
    expect(NETWORK_SIGNAL).assertContain(data[i].signalInformation.signalLevel);
    expect(NETWORK_SIGNAL).assertContain(data[i].signalInformation.dBm);
    if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_LTE) {
      console.log("radio.NetworkType.NETWORK_TYPE_LTE:" + radio.NetworkType.NETWORK_TYPE_LTE);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_WCDMA) {
      console.log("radio.NetworkType.NETWORK_TYPE_WCDMA:" + radio.NetworkType.NETWORK_TYPE_WCDMA);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_GSM) {
      console.log("radio.NetworkType.NETWORK_TYPE_GSM:" + radio.NetworkType.NETWORK_TYPE_GSM);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_TDSCDMA) {
      console.log("radio.NetworkType.NETWORK_TYPE_TDSCDMA:" + radio.NetworkType.NETWORK_TYPE_TDSCDMA);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_NR) {
      console.log("radio.NetworkType.NETWORK_TYPE_NR:" + radio.NetworkType.NETWORK_TYPE_NR);
    } else {
      console.log("radio.NetworkType.NETWORK_TYPE_UNKNOWN:" + radio.NetworkType.NETWORK_TYPE_UNKNOWN);
    }
  }
}

async function getPermissions() {
  console.info('getPermission start');
  let list: Array<string> = ['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
  try {
    let userId: int = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: int = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = bundleManager.getApplicationInfoSync('com.example.actsradiostatisticetstest.static', applicationFlags, userId);
    let tokenId: long = applicationInfo.accessTokenId;
    let tokenValue: int = tokenId.toInt();
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenValue, list[index] as Permissions, 1);
      console.info(`getPermission succeed `);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function radioSecondJsunit() {
  describe('radioSecondTest', ()=> {
    console.log("************* radio Test start*************");


    beforeAll(async (done: () => void) => {
      console.info('getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Async_0500
     * @tc.number Telephony_NetworkSearch_getSignalInformation_Async_0500
     * @tc.desc   SlotId parameter input is 0, test getSignalInformation() api by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      radio.getSignalInformation(0, (err, data) => {
        if (err?.code !== 0) {
          console.log("Telephony_NetworkSearch_getSignalInformation_Async_0500 fail err:" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(
          "Telephony_NetworkSearch_getSignalInformation_Async_0500 finish data:" + JSON.stringify(data));
        expect(data == undefined).assertFalse();
        done();
      });
    });

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Async_0100
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      radio.getNetworkState((err, data) => {
        if (err?.code !== 0) {
          console.error("Network unavailable");
          expect(false).assertTrue();
          done();
          return;
        } else {
          console.log("Telephony_NetworkSearch_NetworkState_Async_0100 end data:" + JSON.stringify(data));
          expect(data?.longOperatorName === "longOperatorName").assertFalse();
          expect(data?.shortOperatorName === "shortOperatorName").assertFalse();
          expect(data?.plmnNumeric === "plmnNumeric").assertFalse();
          expect(data?.isRoaming === true || data?.isRoaming === false).assertTrue();
          expect(data?.isCaActive === true || data?.isCaActive === false).assertTrue();
          expect(data?.isEmergency === true || data?.isEmergency === false).assertTrue();
          expect(data?.cfgTech.toString() == "-1").assertFalse();
          expect(data?.nsaState.toString() == "-1").assertFalse();
          expect(data?.regState.toString() == "-1").assertFalse();
          done();
        }
      });
    })

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Promise_0100
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0300
     * @tc.desc   Test getNetworkState api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        const result = await radio.getNetworkState();
        console.log("Telephony_NetworkSearch_NetworkState_Promise_0100 result:" + JSON.stringify(result));
        expect(result.longOperatorName === "longOperatorName").assertFalse();
        expect(result.shortOperatorName === "shortOperatorName").assertFalse();
        expect(result.plmnNumeric === "plmnNumeric").assertFalse();
        expect(result.isRoaming === true || result.isRoaming === false).assertTrue();
        expect(result.isCaActive === true || result.isCaActive === false).assertTrue();
        expect(result.isEmergency === true || result.isEmergency === false).assertTrue();
        expect(result.cfgTech.toString() == "-1").assertFalse();
        expect(result.nsaState.toString() == "-1").assertFalse();
        expect(result.regState.toString() == "-1").assertFalse();
        done();
      } catch (error) {
        console.error("Network unavailable");
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Async_0200
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0200
     * @tc.desc   Test getNetworkState() api by callback, slotId is 0, to check the callback result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      radio.getNetworkState(0, (err, data) => {
        if (err?.code !== 0) {
          console.error("Network unavailable");
          expect(false).assertTrue();
          done();
          return;
        } else {
          console.log("Telephony_NetworkSearch_NetworkState_Async_0200 end data:" + JSON.stringify(data));
          expect(data?.longOperatorName === "longOperatorName").assertFalse();
          expect(data?.shortOperatorName === "shortOperatorName").assertFalse();
          expect(data?.plmnNumeric === "plmnNumeric").assertFalse();
          expect(data?.isRoaming === true || data?.isRoaming === false).assertTrue();
          expect(data?.isCaActive === true || data?.isCaActive === false).assertTrue();
          expect(data?.isEmergency === true || data?.isEmergency === false).assertTrue();
          expect(data?.cfgTech.toString() == "-1").assertFalse();
          expect(data?.nsaState.toString() == "-1").assertFalse();
          expect(data?.regState.toString() == "-1").assertFalse();
          done();
        }
      });
    })

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Promise_0200
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0400
     * @tc.desc   Test getNetworkState() api by promise, slotId is 0, to check the callback result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        const result = await radio.getNetworkState(0);
        console.log("Telephony_NetworkSearch_NetworkState_Promise_0200 result:" + JSON.stringify(result));
        expect(result.longOperatorName === "longOperatorName").assertFalse();
        expect(result.shortOperatorName === "shortOperatorName").assertFalse();
        expect(result.plmnNumeric === "plmnNumeric").assertFalse();
        expect(result.isRoaming === true || result.isRoaming === false).assertTrue();
        expect(result.isCaActive === true || result.isCaActive === false).assertTrue();
        expect(result.isEmergency === true || result.isEmergency === false).assertTrue();
        expect(result.cfgTech.toString() == "-1").assertFalse();
        expect(result.nsaState.toString() == "-1").assertFalse();
        expect(result.regState.toString() == "-1").assertFalse();
        done();
      } catch (error) {
        console.error("Network unavailable");
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getRadioTech_Async_static_0500
     * @tc.number SUB_Telephony_NetworkSearch_getRadioTech_Async_0500
     * @tc.desc   Test getRadioTech() api by callback .SlotId parameter input is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_NetworkSearch_getRadioTech_Async_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let slotId: int = 0;
        radio.getRadioTech(slotId, (err: BusinessError<void> | null, data: radio.NetworkRadioTech | undefined) => {
          if (err?.code !== 0) {
            hilog.error(domain, tag,
              "Telephony_NetworkSearch_getRadioTech_Async_static_0500 err:" + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          hilog.info(domain, tag,
            "Telephony_NetworkSearch_getRadioTech_Async_static_0500 data:" + JSON.stringify(data));
          expect(data?.psRadioTech?.toString() === "-1").assertFalse();
          expect(data?.csRadioTech?.toString() === "-1").assertFalse();
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag,
          "Telephony_NetworkSearch_getRadioTech_try_catch_async_0500 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getRadioTech_Promise_static_0500
     * @tc.number SUB_Telephony_NetworkSearch_getRadioTech_Promise_0500
     * @tc.desc   SlotId parameter input is 0 ,Test getRadioTech() api by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_NetworkSearch_getRadioTech_Promise_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let slotId: int = 0;
        let promise = radio.getRadioTech(slotId);
        promise.then((data: radio.NetworkRadioTech) => {
          hilog.info(domain, tag,
            "Telephony_NetworkSearch_getRadioTech_Promise_static_0500 data:" + JSON.stringify(data));
          expect(data?.psRadioTech?.toString() == "-1").assertFalse();
          expect(data?.csRadioTech?.toString() == "-1").assertFalse();
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag,
            "Telephony_NetworkSearch_getRadioTech_Promise_static_0500 err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag,
          "Telephony_NetworkSearch_getRadioTech_try_catch_promise_0500 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0500
     * @tc.number SUB_Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0500
     * @tc.desc   SlotId parameter input is 0, test getISOCountryCodeForNetwork() api by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        radio.getISOCountryCodeForNetwork(0, (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,
              "Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0500 fail err:" + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(domain, tag,
              "Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0500 finish data:" + data);
            expect(data === undefined).assertFalse();
            done();
          }
        });
      } catch(error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, "Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0500 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0500
     * @tc.number SUB_Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0600
     * @tc.desc   SlotId parameter input is 0, test getISOCountryCodeForNetwork() api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await radio.getISOCountryCodeForNetwork(0);
        hilog.info(domain, tag, "Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0500 finish data:" + JSON.stringify(data));
        expect(data === undefined).assertFalse();
        done();
      } catch (err) {
        hilog.info(domain, tag, "Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0500 fail err:" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0600
     * @tc.number SUB_Telephony_NetworkSearch_getNetworkSelectionMode_Async_0600
     * @tc.desc   SlotId parameter input is 0, test getNetworkSelectionMode() api by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let slotId: int = 0;
        radio.getNetworkSelectionMode(slotId,
          (err: BusinessError<void> | null, data: radio.NetworkSelectionMode | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, "Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0600 err:" + JSON.stringify(err));
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, "Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0600 data: " + data);
              expect(data == radio.NetworkSelectionMode.NETWORK_SELECTION_AUTOMATIC ||
                data == radio.NetworkSelectionMode.NETWORK_SELECTION_MANUAL ||
                data == radio.NetworkSelectionMode.NETWORK_SELECTION_UNKNOWN).assertTrue();
              done();
            }
          });
      } catch(error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, "Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0600 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0700
     * @tc.number SUB_Telephony_NetworkSearch_getNetworkSelectionMode_Async_0700
     * @tc.desc   SlotId parameter input is 0, test getNetworkSelectionMode() api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let slotId: int = 0;
      try {
        let promise = radio.getNetworkSelectionMode(slotId);
        promise.then((data: radio.NetworkSelectionMode) => {
          hilog.info(domain, tag, "Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0700 success, promise: data:" + data);
          expect(data == radio.NetworkSelectionMode.NETWORK_SELECTION_AUTOMATIC ||
            data == radio.NetworkSelectionMode.NETWORK_SELECTION_MANUAL ||
            data == radio.NetworkSelectionMode.NETWORK_SELECTION_UNKNOWN).assertTrue();
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, "Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0700 failed, promise: err:" +
          JSON.stringify(err));
          done();
        });
      } catch(error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, "Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0700 err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Promise_static_0500
     * @tc.number SUB_Telephony_NetworkSearch_getSignalInformation_Async_0500
     * @tc.desc   SlotId parameter input is 0, test getSignalInformation() api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Promise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await radio.getSignalInformation(0);
        hilog.info(domain, tag,
          "Telephony_NetworkSearch_getSignalInformation_Promise_static_0500 finish data:" + JSON.stringify(data));
        expect(data === undefined).assertFalse();
        radio.getCellInformation(0, (err: BusinessError<void> | null, data: Array<radio.CellInformation> | undefined) => {
          hilog.info(domain, tag,
            "Telephony_NetworkSearch_getSignalInformation_Promise_static_0500 getCellInformation finish data is: " + data);
          if (err?.code === 0 && data !== undefined) {
            assertCellInformation(data!);
          } else {
            expect(false).assertTrue();
          }
        });
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_NetworkSearch_getSignalInformation_Promise_static_0500 fail err:" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Async_0600
     * @tc.number SUB_Telephony_NetworkSearch_getSignalInformation_Async_0600
     * @tc.desc   SlotId parameter input is 0, test getSignalInformation() api by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      radio.getSignalInformation(0, (err, data) => {
        if (err?.code !== 0) {
          console.log("Telephony_NetworkSearch_getSignalInformation_Async_0600 fail err:" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(
          "Telephony_NetworkSearch_getSignalInformation_Async_0600 finish data:" + JSON.stringify(data));
        expect(data !== null).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Promise_static_0700
     * @tc.number SUB_Telephony_NetworkSearch_getSignalInformation_Async_0700
     * @tc.desc   SlotId parameter input is 0, test getSignalInformation() api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Promise_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await radio.getSignalInformation(0);
        hilog.info(domain, tag, "Telephony_NetworkSearch_getSignalInformation_Promise_static_0700 finish data:" + JSON.stringify(data));
        expect(data !== null).assertTrue();
        radio.getCellInformation(0, (err: BusinessError<void> | null, data: Array<radio.CellInformation> | undefined) => {
          hilog.info(domain, tag, "Telephony_NetworkSearch_getSignalInformation_Promise_static_0700 getCellInformation finish data is: " + data);
          if (err?.code === 0 && data !== undefined) {
            assertCellInformation(data!);
          } else {
            expect(false).assertTrue();
          }
        });
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "Telephony_NetworkSearch_getSignalInformation_Promise_static_0500 fail err:" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    console.log("************* radio Test end*************");
  });
}