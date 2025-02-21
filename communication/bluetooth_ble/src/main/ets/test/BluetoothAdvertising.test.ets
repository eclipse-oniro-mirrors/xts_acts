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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function bluetoothAdvertisingTest() {
  describe('bluetoothAdvertisingTest', function() {
    function sleep(delay) {
      return new Promise(resovle => setTimeout(resovle, delay))
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

    async function clickRequestPermission() {
      try {
        console.info('[bluetooth_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        let button = await driver.findComponent(ON.text("允许"));
        await button.click();
        await driver.delayMs(3000);
        console.info('[bluetooth_js] clickRequestPermission end');
      } catch (err) {
        console.info('[bluetooth_js] clickRequestPermission failed');
      }
    }

    async function tryToEnableBt() {
      let sta = btAccess.getState();
      switch(sta){
        case 0:
          btAccess.enableBluetooth();
          await clickRequestPermission();
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
          await clickRequestPermission();
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
    };
    let advResponse: bluetooth.AdvertiseData = {
      serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
      manufactureData:[manufactureDataUnit],
      serviceData:[serviceDataUnit],
    };

    beforeAll(async function (done) {
      await clickRequestPermission();
      await openPhone();
      console.info('beforeAll called');
      done();
    })
    beforeEach(async function(done) {
      await tryToEnableBt();
      console.info('beforeEach called');
      done();
    })
    afterEach(function () {
      console.info('afterEach called')
    })
    afterAll(function () {
      console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0100
     * @tc.name start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0100', 0, async function (done) {
      let advStatus = null;
      function onReceiveEvent(AdvertisingStateChangeInfo) {
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
        function startAdv() {
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
        expect().assertFail();
      }
      await bluetooth.off('advertisingStateChange', onReceiveEvent);
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0200
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0200', 0, async function (done) {
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
        function stopAdv() {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0300
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0300', 0, async function (done) {
      let advertisingParams = {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0400
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0400', 0, async function (done) {
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
        expect(err.code).assertEqual('401');
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0500
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0500', 0, async function (done) {
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
        expect(err.code).assertEqual('401');
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0700
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0700', 0, async function (done) {
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: null,
      }
      let advHandle = 0xFF;
      try {
        bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
          console.info('[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          console.info('[bluetooth_js]startAdvertising promise info2:'+JSON.stringify(advHandle));
        });
        await sleep(3000);
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
        });
      } catch (err) {
        console.info("07errCode:" + err.code + ",07errMessage:" + err.message);
        expect(err.code).assertEqual('401');
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0900
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0900', 0, async function (done) {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1000
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1000', 0, async (done) => {
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

        function enableAdv() {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1100
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1100', 0, async (done) => {
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

        function disableAdv() {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1200
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1200', 0, async (done) => {
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
        expect(err.code).assertEqual('401');
      }
      await bluetooth.stopAdvertising(advHandle).then((data) => {
        console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
      });
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1300
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1300', 0, async (done) => {
      let advStatus: Number = 0;
      function onReceiveEvent(AdvertisingStateChangeInfo) {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1400
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1400', 0, async (done) => {
      let advStatus: Number = 0;
      function onReceiveEvent(AdvertisingStateChangeInfo) {
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
        expect().assertFail();
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1500
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1500', 0, async (done) => {
      btAccess.disableBluetooth();
      await clickRequestPermission();
      await sleep(10000);
      let closeSt = btAccess.getState();
      console.info('[bluetooth_js] bluetooth disable state =' + JSON.stringify(closeSt));
      expect(closeSt).assertEqual(btAccess.BluetoothState.STATE_OFF);
      let advertisingParams: bluetooth.AdvertisingParams = {
        advertisingSettings: setting,
        advertisingData: advData,
        advertisingResponse: advResponse,
        duration: 100,
      };
      let advHandle = 0xFF;
      try {
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
        expect(err.code).assertEqual(2900003);
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1600
     * @tc.name test start/stopAdvertising enable/disableAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1600', 0, async (done) => {
      let advHandle = 0xFF;
      try {
        let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
          advertisingId: advHandle,
          duration: 0,
        };
        await bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
          console.info('[bluetooth_js] enableAdvertising promise result16:' + JSON.stringify(data));
        }).catch(err => {
          console.info('bluetooth enableAdvertising has error: ' + JSON.stringify(err));
          expect(err.code).assertEqual(2900099);
        });
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          console.info('[bluetooth_js] stopAdvertising promise result16:' + JSON.stringify(data));
        });
      }
      catch (err) {
        console.info("16errCode:" + err.code + ",16errMessage:" + err.message);
      }
      await sleep(2000);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1700
     * @tc.name test AdvertisingState
     * @tc.desc Test AdvertisingState constant api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1700', 0, async (done) => {
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
  })
}