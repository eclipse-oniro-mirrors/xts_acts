/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import { BusinessError } from '@ohos.base';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";

function sleep(delay : number) :Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay))
}

async function openPhone() {
  try{
    let drivers = Driver.create();
    console.info('[bluetooth_js] bt driver create:'+ drivers);
    await drivers.delayMs(1000);
    await drivers.wakeUpDisplay();
    await drivers.delayMs(5000);
    await drivers.swipe(1500, 1000, 1500, 100);
    await drivers.delayMs(10000);
  } catch (error) {
    console.info('[bluetooth_js] driver error info:'+ error);
  }
}

async function clickRequestPermission(text:string) {
  console.info('[bluetooth_js] clickRequestPermission start');
  let PERMISSION_TEXT:string = "允许";
    let driver = Driver.create();
    await driver.delayMs(3000);
    try {
        let button = await driver.findComponent(ON.text(text));
        await button.click();
        await driver.delayMs(3000);
        console.info('[bluetooth_js] clickRequestPermission end');
    } catch (err) {
        console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
    }
    try {
        let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
        await button1.click();
        await driver.delayMs(3000);
        console.info('[bluetooth_js] click PERMISSION_TEXT end');
    } catch (err) {
        console.info('[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
    }
}

async function tryToEnableBt() {
  let sta = btAccess.getState();
  switch(sta){
    case 0:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta1));
      break;
    case 1:
      console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
      await sleep(3000);
      break;
    case 2:
      console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
      break;
    case 3:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
      break;
    default:
      console.info('[bluetooth_js] enable success');
  }
}

let manufactureValueBuffer = new Uint8Array(4);
manufactureValueBuffer[0] = 1;
manufactureValueBuffer[1] = 2;
manufactureValueBuffer[2] = 3;
manufactureValueBuffer[3] = 4;
let serviceValueBuffer = new Uint8Array(4);
serviceValueBuffer[0] = 4;
serviceValueBuffer[1] = 6;
serviceValueBuffer[2] = 7;
serviceValueBuffer[3] = 8;
let setting: bluetooth.AdvertiseSetting = {
  interval:32,
  txPower:1,
  connectable:true,
};
let manufactureDataUnit: bluetooth.ManufactureData = {
  manufactureId:4567,
  manufactureValue:manufactureValueBuffer.buffer
};
let serviceDataUnit: bluetooth.ServiceData = {
  serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
  serviceValue:serviceValueBuffer.buffer
};
let advData: bluetooth.AdvertiseData = {
  serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
  manufactureData:[manufactureDataUnit],
  serviceData:[serviceDataUnit],
  includeDeviceName:false,
  includeTxPower:false
};
let advResponse: bluetooth.AdvertiseData = {
  serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
  manufactureData:[manufactureDataUnit],
  serviceData:[serviceDataUnit],
};
export default function bluetoothAdvertisingTest() {
  describe('bluetoothAdvertisingTest', () => {

    beforeAll(async (done : Function) =>  {
      await clickRequestPermission(PERMISSION_TEXT);
      await openPhone();
      console.info('beforeAll called');
      done();
    })
    beforeEach(async (done : Function) => {
      await tryToEnableBt();
      console.info('beforeEach called');
      done();
    })
    afterEach(() => {
      console.info('afterEach called')
    })
    afterAll(() => {
      console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0100
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advStatus: Number = 0;
      let onReceiveEvent = (AdvertisingStateChangeInfo :bluetooth.AdvertisingStateChangeInfo) => {
        console.info('bluetooth advertising state01 = ' + JSON.stringify(AdvertisingStateChangeInfo));
        console.info('bluetooth advertising state01 = ' + AdvertisingStateChangeInfo.state);
        advStatus = AdvertisingStateChangeInfo.state;
        console.info('bluetooth advertising state01 = ' + advStatus);
      }
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 0,
      }
      let advHandle = 0xFF;
      try {
        await bluetooth.on('advertisingStateChange', onReceiveEvent);
        let startAdv = () => {
          return new Promise<void>((resolve,reject) => {
            bluetooth.startAdvertising(advertisingParams, (err, outAdvHandle)=> {
              if (err) {
                console.info('startAdvertising callback failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]startAdvertising callback info01:'+JSON.stringify(outAdvHandle));
                advHandle = outAdvHandle;
                console.info('[bluetooth_js]startAdvertising callback info01:'+JSON.stringify(advHandle));
              }
              resolve();
            });
          });
        }
        await startAdv().then((data) => {
          console.info('[bluetooth_js] startAdv promise result01:' + JSON.stringify(data));
        });
        await sleep(300);
        expect(advStatus).assertEqual(1);
        await sleep(5000);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result01: ' + JSON.stringify(data));
        });
        let count = 0;
        while(advStatus == 1) {
          await sleep(100);
          count = count+=1;
        }
        console.info('[bluetooth_js] advStatus change count promise result01: ' + count);
        expect(advStatus).assertEqual(4);
      } catch (err) {
        console.info("01errCode:" + err.code + ",01errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
      }
      await bluetooth.off('advertisingStateChange', onReceiveEvent);
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0200
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 100,
      }
      let advHandle = 0xFF;
      try {
        bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info02:'+JSON.stringify(advHandle));
        });
        await sleep(500);
        await sleep(900);
        let stopAdv = () => {
          return new Promise<void>((resolve,reject) => {
            bluetooth.stopAdvertising(advHandle, (err, data)=> {
              if (err) {
                console.info('stopAdvertising callback failed' + JSON.stringify(err));
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]stopAdvertising callback info02:'+JSON.stringify(data));
              }
              resolve();
            });
          });
        }
        await stopAdv().then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result02: ' + JSON.stringify(data));
        });
      }catch (err) {
        console.info("02errCode:" + err.code + ",02errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0300
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 65535,
      }
      let advHandle = 0xFF;
      try {
        bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info03:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info03:'+JSON.stringify(advHandle));
        });
        await sleep(655350);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result03:' + JSON.stringify(data));
        });
      } catch (err) {
        console.info("03errCode:" + err.code + ",03errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0400
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 65540,
      }
      let advHandle = 0xFF;
      try {
        bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info2:'+JSON.stringify(advHandle));
        });
        await sleep(655350);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
        });
      } catch (err) {
        console.info("04errCode:" + err.code + ",04errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect(Number(err.code)).assertEqual(401);
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0500
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: -10,
      }
      let advHandle = 0xFF;
      try {
        bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info2:'+JSON.stringify(advHandle));
        });
        await sleep(1000);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
        });
      } catch (err) {
        console.info("05errCode:" + err.code + ",05errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect(Number(err.code)).assertEqual(401);
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0900
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
      }
      let advHandle = 0xFF;
      try {
        bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info09:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info09:'+JSON.stringify(advHandle));
        });
        await sleep(3000);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result09:' + JSON.stringify(data));
        });
      }catch (err) {
        console.info("09errCode:" + err.code + ",09errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1000
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 300,
      };
      let advHandle = 0xFF;
      try {
        await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info10:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info10:' + JSON.stringify(advHandle));
        });
        await sleep(3000);
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: 0,
        };

        let enableAdv = () => {
          return new Promise<void>((resolve, reject) => {
            bluetooth.enableAdvertising(advertisingEnableParams, (err, data) => {
              if (err) {
                console.info('enableAdvertising callback failed' + err);
                reject(err.code);
              }
              else {
                console.info('[bluetooth_js]enableAdvertising callback info10:' + JSON.stringify(data));
              }
              resolve();
            });
          });
        }

        await enableAdv().then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result10:' + JSON.stringify(data));
        });
        let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: advHandle,
        };
        await bluetooth.disableAdvertising(advertisingDisableParams).then((data) => {
          console.info('[bluetooth_js] disableAdvertising promise result10:' + JSON.stringify(data));
        });
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result10:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info(":10errCode" + err.code + ",10errMessage10:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1100
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 300,
      };
      let advHandle = 0xFF;
      try {
        await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info11:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info11:' + JSON.stringify(advHandle));
        });
        await sleep(3000);
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: 100,
        };
        await bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result11:' + JSON.stringify(data));
        });
        await sleep(2000);
        let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: advHandle,
        };

        let disableAdv = () => {
          return new Promise<void>((resolve, reject) => {
            bluetooth.disableAdvertising(advertisingDisableParams, (err, data) => {
              if (err) {
                console.info('disableAdvertising callback failed11' + err);
                reject(err.code);
              }
              else {
                console.info('[bluetooth_js]disableAdvertising callback info11:' + JSON.stringify(data));
              }
              resolve();
            });
          });
        }

        await disableAdv().then((data) => {
          console.info('[bluetooth_js] disableAdvertising promise result11:' + JSON.stringify(data));
        });
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result11:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("11errCode:" + err.code + ",11errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1200
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 300,
      };
      let advHandle = 0xFF;
      try {
        await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info12:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info12:' + JSON.stringify(advHandle));
        });
        await sleep(3000);
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: -100,
        };
        await bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("12errCode:" + err.code + ",12errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect(Number(err.code)).assertEqual(401);
        }
      }
      await bluetooth.stopAdvertising(advHandle).then((data) => {
        console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
      });
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1300
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advStatus: Number = 0;
      let onReceiveEvent = (AdvertisingStateChangeInfo :bluetooth.AdvertisingStateChangeInfo) => {
        console.info('bluetooth advertising state13 = ' + JSON.stringify(AdvertisingStateChangeInfo));
        console.info('bluetooth advertising state13 = ' + AdvertisingStateChangeInfo.state);
        console.info('bluetooth advertising state13 = ' + AdvertisingStateChangeInfo.advertisingId);
        advStatus = AdvertisingStateChangeInfo.state;
        console.info('bluetooth advertising state13 = ' + advStatus);
      }

      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 100,
      };
      let advHandle = 0xFF;
      try {
        await bluetooth.on('advertisingStateChange', onReceiveEvent);
        await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info13:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info13:' + JSON.stringify(advHandle));
        });
        await sleep(500);
        expect(advStatus).assertEqual(1);
        await sleep(1000);
        await bluetooth.off('advertisingStateChange', onReceiveEvent);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result13:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("13errCode:" + err.code + ",13errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1400
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advStatus: Number = 0;
      let onReceiveEvent = (AdvertisingStateChangeInfo :bluetooth.AdvertisingStateChangeInfo) => {
        console.info('bluetooth advertising state14 = ' + JSON.stringify(AdvertisingStateChangeInfo));
        console.info('bluetooth advertising state14 = ' + AdvertisingStateChangeInfo.state);
        advStatus = AdvertisingStateChangeInfo.state;
        console.info('bluetooth advertising state14 = ' + advStatus);
      }

      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 100,
      };
      let advHandle = 0xFF;
      try {
        await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info14:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info14:' + JSON.stringify(advHandle));
        });
        await sleep(1000);
        await bluetooth.on('advertisingStateChange', onReceiveEvent);
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: 0,
        };
        await bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result14:' + JSON.stringify(data));
        });
        await sleep(500);
        expect(true).assertEqual(advStatus == 2 || advStatus == 0);
        let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: advHandle,
        };
        await bluetooth.disableAdvertising(advertisingDisableParams).then((data) => {
          console.info('[bluetooth_js] disableAdvertising promise result14:' + JSON.stringify(data));
        });
        await sleep(500);
        expect(true).assertEqual(advStatus == 3 || advStatus == 0);
        await bluetooth.off('advertisingStateChange', onReceiveEvent);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result14:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("14errCode:" + err.code + ",14errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect().assertFail();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1500
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 100,
      };
      let advHandle = 0xFF;
      try {
        btAccess.disableBluetooth();
        await clickRequestPermission(CLOSE_BT_TEXT);
        await sleep(10000);
        let closeSt = btAccess.getState();
        console.info('[bluetooth_js] bluetooth disable state =' + JSON.stringify(closeSt));
        expect(closeSt).assertEqual(btAccess.BluetoothState.STATE_OFF);
        await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info2:' + JSON.stringify(advHandle));
        });
        await sleep(1000);
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: 0,
        };
        await bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("15errCode:" + err.code + ",15errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
           expect(Number(err.code)).assertEqual(2900003);
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1600
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let advHandle = 0xFF;
      try {
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: 0,
        };
        await bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result16:' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.info('bluetooth enableAdvertising has error: ' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(2900099);
        });
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result16:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("16errCode:" + err.code + ",16errMessage:" + err.message);
        if (err.code == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        }
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1800
     * @tc.name testDisableAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await bluetooth.disableAdvertising(null).then((data) => {
          console.info('[bluetooth_js] disableAdvertising promise success:' + JSON.stringify(data));
        });
        expect().assertFail();
      }catch (err) {
        console.info("errCode:" + err.code + ",errMessage:" + err.message);
        expect(Number(err.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1900
     * @tc.name testDisableAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let disableAdv = () => {
          return new Promise<void>((resolve, reject) => {
            bluetooth.disableAdvertising(null, (err, data) => {
              if (err) {
                console.info('disableAdvertising callback failed' + err);
                reject(err.code);
              }
              else {
                console.info('[bluetooth_js]disableAdvertising callback info:' + JSON.stringify(data));
              }
              resolve();
            });
          });
        }

        await disableAdv().then((data) => {
          console.info('[bluetooth_js] disableAdvertising promise result:' + JSON.stringify(data));
        });
        expect().assertFail();
      }catch (err) {
        console.info("errCode:" + err.code + ",errMessage:" + err.message);
        expect(Number(err.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1700
     * @tc.name testStartAdvertising
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let STARTED = bluetooth.AdvertisingState.STARTED;
        expect(STARTED).assertEqual(1);

        let ENABLED = bluetooth.AdvertisingState.ENABLED;
        expect(ENABLED).assertEqual(2);

        let DISABLED = bluetooth.AdvertisingState.DISABLED;
        expect(DISABLED).assertEqual(3);

        let STOPPED = bluetooth.AdvertisingState.STOPPED;
        expect(STOPPED).assertEqual(4);
      }
      catch (err) {
        console.info("17errCode:" + err.code + ",17errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2000
     * @tc.name testStartAdvertising
     * @tc.desc Test errorCode 2900010
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
      }
      try {
          for (let count = 0; count < 17; count++) {
              await bluetooth.startAdvertising(advertisingParams);
              console.info('[bluetooth_js]startAdvertising count:' + count);
              if (count == 16) {
                console.info('[bluetooth_js]startAdvertising count success');
                expect().assertFail();
              }
          }
      } catch (err) {
        console.info("startAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2900010).assertEqual(Number(err.code));
        }
      }

      try {
          bluetooth.stopAdvertising();
      } catch (err) {
        console.info("stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2100
     * @tc.name testStartAdvertisingPromise
     * @tc.desc Test errorCode 2900010
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
      }
      try {
          for (let count = 0; count < 17; count++) {
              await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
              console.info('[bluetooth_js]startAdvertising return outAdvHandle:' + JSON.stringify(outAdvHandle));
              });
              console.info('[bluetooth_js]startAdvertising count:' + count);
              if (count == 16) {
                console.info('[bluetooth_js]startAdvertising count success');
                expect().assertFail();
              }
          }
      } catch (err) {
        console.info("startAdvertising promise errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2900010).assertEqual(Number(err.code));
        }
      }

      try {
          bluetooth.stopAdvertising();
      } catch (err) {
        console.info("stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2200
     * @tc.name testStartAdvertisingCallback
     * @tc.desc Test errorCode 2900010
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
      }
      let startAdvertisingCallback = () => {
          return new Promise<void>((resolve,reject) => {
            bluetooth.startAdvertising(advertisingParams, (err, outAdvHandle)=> {
              if (err) {
                console.info('startAdvertising failed' + JSON.stringify(err));
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]startAdvertising result:'+JSON.stringify(outAdvHandle));
              }
              resolve();
            });
          });
        }
      try {
          for (let count = 0; count < 17; count++) {
              await startAdvertisingCallback().then((data) => {
                console.info('[bluetooth_js] startAdvertisingCallback result:' + JSON.stringify(data));
                console.info('[bluetooth_js]startAdvertising count:' + count);
                if (count == 16) {
                  console.info('[bluetooth_js]startAdvertising count success');
                  expect().assertFail();
                  done();
                }
              }).catch((error : BusinessError) => {
                console.info("startAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error) == 801) {
                    console.info('[bluetooth_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(2900010).assertEqual(Number(error));
                }
              });
          }
      } catch (err) {
        console.info("startAdvertising errCode:" + err.code + ",errMessage:" + err.message);}

      try {
          bluetooth.stopAdvertising();
      } catch (err) {
        console.info("stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2300
     * @tc.name testEnableAdvertisingCallback
     * @tc.desc Test errorCode 2902055
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: 0XFF
        };

      let enableAdvertisingCallback = () => {
        return new Promise<void>((resolve, reject) => {
          bluetooth.enableAdvertising(advertisingEnableParams, (err, data) => {
            if (err) {
              console.info('enableAdvertising failed' + err);
              reject(err.code);
            }
            else {
              console.info('[bluetooth_js]enableAdvertising info:' + JSON.stringify(data));
            }
            resolve();
          });
        });
      }

      await enableAdvertisingCallback().then((data) => {
        console.info('[bluetooth_js] enableAdvertising result:' + JSON.stringify(data));
        console.info('[bluetooth_js] enableAdvertising use Invalid advertising id success');
        expect().assertFail();
      }).catch((error : BusinessError) => {
        console.info("enableAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
          console.info('[bluetooth_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect(2902055).assertEqual(Number(error.code));
        }
      });
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2400
     * @tc.name testEnableAdvertisingPromise
     * @tc.desc Test errorCode 2902055
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: 0XFF
        };

      try {
          await bluetooth.enableAdvertising(advertisingEnableParams).then(() => {});
          console.info('[bluetooth_js]enableAdvertising use Invalid advertising id success');
          expect().assertFail();
      } catch (err) {
        console.info("enableAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2902055).assertEqual(Number(err.code));
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2500
     * @tc.name testDisableAdvertisingCallback
     * @tc.desc Test errorCode 2902055
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: 0XFF
        };

      let disableAdvertisingCallback = () => {
        return new Promise<void>((resolve, reject) => {
          bluetooth.disableAdvertising(advertisingDisableParams, (err, data) => {
            if (err) {
              console.info('disableAdvertising failed' + err);
              reject(err.code);
            }
            else {
              console.info('[bluetooth_js]disableAdvertising info:' + JSON.stringify(data));
            }
            resolve();
          });
        });
      }

      await disableAdvertisingCallback().then((data) => {
        console.info('[bluetooth_js] disableAdvertising result:' + JSON.stringify(data));
        console.info('[bluetooth_js] disableAdvertising use Invalid advertising id success');
        expect().assertFail();
      }).catch((error : BusinessError) => {
        console.info("disableAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
          console.info('[bluetooth_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect(2902055).assertEqual(Number(error.code));
        }
      });
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2600
     * @tc.name testDisableAdvertisingPromise
     * @tc.desc Test errorCode 2902055
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: 0XFF
        };

      try {
          await bluetooth.disableAdvertising(advertisingDisableParams).then(() => {});
          console.info('[bluetooth_js]disableAdvertising use Invalid advertising id success');
          expect().assertFail();
      } catch (err) {
        console.info("disableAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2902055).assertEqual(Number(err.code));
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2700
     * @tc.name testStopAdvertisingCallback
     * @tc.desc Test errorCode 2902055
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let stopAdvertisingCallback = () => {
        return new Promise<void>((resolve, reject) => {
          bluetooth.stopAdvertising(0XFF, (err, data) => {
            if (err) {
              console.info('stopAdvertising failed' + err);
              reject(err.code);
            }
            else {
              console.info('[bluetooth_js]stopAdvertising info:' + JSON.stringify(data));
            }
            resolve();
          });
        });
      }

      await stopAdvertisingCallback().then((data) => {
        console.info('[bluetooth_js] stopAdvertising result:' + JSON.stringify(data));
        console.info('[bluetooth_js] stopAdvertising use Invalid advertising id success');
        expect().assertFail();
        done();
      }).catch((error : BusinessError) => {
        console.info("disableAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
          console.info('[bluetooth_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect(2902055).assertEqual(Number(error.code));
        }
      });
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2800
     * @tc.name testStopAdvertisingPromise
     * @tc.desc Test errorCode 2902055
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
          await bluetooth.stopAdvertising(0XFF).then(() => {});
          console.info('[bluetooth_js]stopAdvertising use Invalid advertising id success');
          expect().assertFail();
      } catch (err) {
        console.info("stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2902055).assertEqual(Number(err.code));
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2900
     * @tc.name testStartAdvertising
     * @tc.desc Test errorCode 2902054
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let manufactureValueBuffers = new Uint8Array(32);
      for (let count = 0; count < 32; count++) {
        manufactureValueBuffers[count] = (count+1);
      }
      let manufactureDataUnits: bluetooth.ManufactureData = {
        manufactureId:4567,
        manufactureValue:manufactureValueBuffers.buffer
      };
      let advDatas: bluetooth.AdvertiseData = {
          serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData:[manufactureDataUnits],
          serviceData:[serviceDataUnit],
          includeDeviceName:false,
          includeTxPower:false
      };
      let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advDatas,
          advertisingResponse: advResponse,
          duration: 0,
      }
      try {
          await bluetooth.startAdvertising(advertisingParams);
          console.info('[bluetooth_js]startAdvertising The length of the advertising data exceeds the upper limit success');
          expect().assertFail();
      } catch (err) {
        console.info("startAdvertising errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2902054).assertEqual(Number(err.code));
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_3000
     * @tc.name testStartAdvertisingPromise
     * @tc.desc Test errorCode 2902054
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let manufactureValueBuffers = new Uint8Array(32);
      for (let count = 0; count < 32; count++) {
        manufactureValueBuffers[count] = (count+1);
      }
      let manufactureDataUnits: bluetooth.ManufactureData = {
        manufactureId:4567,
        manufactureValue:manufactureValueBuffers.buffer
      };
      let advDatas: bluetooth.AdvertiseData = {
          serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData:[manufactureDataUnits],
          serviceData:[serviceDataUnit],
          includeDeviceName:false,
          includeTxPower:false
      };
      let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advDatas,
          advertisingResponse: advResponse,
          duration: 0,
      }
      try {
          await bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
              console.info('[bluetooth_js]startAdvertising return outAdvHandle:' + JSON.stringify(outAdvHandle));
          });
          console.info('[bluetooth_js]startAdvertising The length of the advertising data exceeds the upper limit success');
          expect().assertFail();
      } catch (err) {
        console.info("startAdvertising promise errCode:" + err.code + ",errMessage:" + err.message);
        if (Number(err.code) == 801) {
            console.info('[bluetooth_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(2902054).assertEqual(Number(err.code));
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_3100
     * @tc.name testStartAdvertisingCallback
     * @tc.desc Test errorCode 2902054
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      let manufactureValueBuffers = new Uint8Array(32);
      for (let count = 0; count < 32; count++) {
        manufactureValueBuffers[count] = (count+1);
      }
      let manufactureDataUnits: bluetooth.ManufactureData = {
        manufactureId:4567,
        manufactureValue:manufactureValueBuffers.buffer
      };
      let advDatas: bluetooth.AdvertiseData = {
          serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData:[manufactureDataUnits],
          serviceData:[serviceDataUnit],
          includeDeviceName:false,
          includeTxPower:false
      };
      let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advDatas,
          advertisingResponse: advResponse,
          duration: 0,
      }
      let startAdvertisingCallback = () => {
          return new Promise<void>((resolve,reject) => {
            bluetooth.startAdvertising(advertisingParams, (err, outAdvHandle)=> {
              if (err) {
                console.info('startAdvertising failed' + JSON.stringify(err));
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]startAdvertising result:'+JSON.stringify(outAdvHandle));
              }
              resolve();
            });
          });
        }
      try {
          await startAdvertisingCallback().then((data) => {
              console.info('[bluetooth_js] startAdvertising result:' + JSON.stringify(data));
              console.info('[bluetooth_js]startAdvertising The length of the advertising data exceeds the upper limit success');
              expect().assertFail();
              done();
          }).catch((error: BusinessError) => {
              console.info("startAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
              if (Number(error) == 801) {
                  console.info('[bluetooth_js]api is not support');
                  expect(true).assertTrue();
              } else {
                  expect(2902054).assertEqual(Number(error));
                }
            });
      } catch (err) {console.info("startAdvertising errCode:" + err.code + ",errMessage:" + err.message);}
      done();
    })
  })
}