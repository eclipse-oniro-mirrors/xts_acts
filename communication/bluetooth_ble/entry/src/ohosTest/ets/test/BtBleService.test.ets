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
import bluetoothManager from '@ohos.bluetoothManager'
import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import { BusinessError} from '@ohos.base';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let gattServer: bluetooth.GattServer;
let gattClient: bluetooth.GattClientDevice;
let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";

function sleep(delay : number) : Promise<void> {
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
function Connected(BLEConnectChangedState : bluetoothManager.BLEConnectChangedState) {
  let deviceId : string = BLEConnectChangedState.deviceId;
  let status : bluetooth.ProfileConnectionState = BLEConnectChangedState.state;
  console.info("[bluetooth_js] connectStateChange jsondata:"
  +'deviceId:' + deviceId + 'status:' + status);
  expect(true).assertEqual(BLEConnectChangedState != null);
}
function nCChanged() {
        let descriptors : Array<bluetooth.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor : bluetooth.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic : bluetooth.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic : bluetoothManager.NotifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: characteristic.characteristicValue, confirm: false};
  return new Promise<void>((resolve, reject) => {
    gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic, (err: BusinessError, data : void) => {
      if (err) {
        console.error('nCChanged failed' + err);
        reject(err.code);
      } else {
        console.info('[bluetooth_js]nCChanged value:' + JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve();
    });
  });
}
  export default function btBleServiceTest() {
    describe('btBleServiceTest', () => {

      beforeAll(async (done : Function) =>  {
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        await tryToEnableBt()
        gattServer = bluetooth.createGattServer();
        console.info('bluetooth ble create gattserver result:' + gattServer);
        gattClient = bluetooth.createGattClientDevice('04:30:02:01:00:00');
        console.info('bluetooth ble create gattclientdevice result:' + gattClient);
        console.info('beforeAll called')
        done();
      })
      beforeEach(async (done : Function) => {
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
      })
      afterEach(() => {
        console.info('afterEach called')
      })
      afterAll(async (done : Function) =>  {
        console.info('afterAll called')
        gattServer.close();
        console.info('bluetooth gattServer close success');
        gattClient.close();
        console.info('bluetooth gattClient close success');
        done();
      })


      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_0100
       * @tc.name test Server connectStateChange
       * @tc.desc Test on and off api10 .
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          gattServer.on("connectionStateChange", Connected);
        } catch (error) {
          console.error(`[bluetooth_js]connectionStateChange failed, code is ${error.code},message is ${error.message}`);
          if (error.code == 801) {
                console.info('[bluetooth_js]connectionStateChange is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        gattServer.off("connectionStateChange", Connected);
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_0200
       * @tc.name test Server connectStateChange
       * @tc.desc Test on and off api10 .
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        gattServer.on("connectionStateChange", Connected);
        try {
          gattServer.off("connectionStateChange", Connected);
        } catch (error) {
          console.error(`[bluetooth_js]connectionStateChange failed, code is ${error.code},message is ${error.message}`);
          if (error.code == 801) {
                console.info('[bluetooth_js]connectionStateChange is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADDSERVICE_0100
       * @tc.name testAddService
       * @tc.desc Test AddService api10.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_ADDSERVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        let descriptors : Array<bluetooth.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor : bluetooth.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics : Array<bluetooth.BLECharacteristic> = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic : bluetooth.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService : bluetooth.GattService = {
          serviceUuid:'00001810-0000-1000-8000-00805F9B34FB',
          isPrimary: false,
          characteristics:characteristics,
          includeServices:[]
        };
        try {
          gattServer.addService(gattService);
        } catch (error) {
          console.error(`[bluetooth_js]AddService2 failed, code is ${error.code},message is ${error.message}`);
          if (error.code == 801) {
                console.info('[bluetooth_js]addService is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADDSERVICE_0300
       * @tc.name testAddService
       * @tc.desc Test AddService api10.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_ADDSERVICE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          gattServer.addService(null);
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]AddService failed, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(401);
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADDSERVICE_0200
       * @tc.name testAddService
       * @tc.desc Test api10 401 - characteristics of service is null.
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_ADDSERVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        } catch (error) {
          console.error(`[bluetooth_js]removeService failed, code is ${error.code},message is ${error.message}`);
          if (error.code == 801 || error.code == 2900004) {
                console.info('[bluetooth_js]removeService is not support or profile not support');
                expect(true).assertTrue();
            } else {
                expect(true).assertEqual(Number(error.code) == 2900099 || Number(error.code) == 401);
            }
        }
        done();

      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0100
       * @tc.name testNotifyCharacteristicChanged callback
       * @tc.desc Test NotifyCharacteristicChanged api10.
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        let descriptors : Array<bluetooth.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor : bluetooth.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic : bluetooth.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic : bluetooth.NotifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: characteristic.characteristicValue, confirm: false};
        try {

          await nCChanged().then((data) => {
            console.info("[bluetooth_js]01 notifyCharacteristicChanged done");
            done();
          })
            .catch((e : BusinessError) => {
              console.info("[bluetooth_js]01 notifyCharacteristicChanged failed" + e);
              expect(2900099).assertEqual(Number(e));
              done();
            })
        } catch (error) {
          console.error(`[bluetooth_js]notifyCharacteristicChanged error, code is ${error.code},message is ${error.message}`);
          if (error.code == 801) {
                console.info('[bluetooth_js]notifyCharacteristicChanged is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0200
       * @tc.name testNotifyCharacteristicChanged promise
       * @tc.desc Test NotifyCharacteristicChanged api10.
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        let descriptors : Array<bluetooth.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor : bluetooth.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic : bluetooth.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic : bluetooth.NotifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: characteristic.characteristicValue, confirm: false};
        try {
          gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic).then(() => {
            console.info("notifyCharacteristicChanged");
            done();
          }, (err : BusinessError) => {
            console.error("notifyCharacteristicChanged:errCode" + err.code + ",errMessage:" + err.message);
            done();
          });
        } catch (error) {
          console.error('[bluetooth_js]notifyCharacteristicChanged2 failed, code:'
          +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
          if (error.code == 801) {
                console.info('[bluetooth_js]notifyCharacteristicChanged is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0300
       * @tc.name testNotifyCharacteristicChanged callback
       * @tc.desc Test NotifyCharacteristicChanged api10.
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          let testNotifyCharacteristicChanged = async ()=>{
            return new Promise<void>((resolve,reject)=>{
              gattServer.notifyCharacteristicChanged(null, null, (error)=>{
                if (error) {
                  reject(error)
                } else {
                  resolve();
                  }
              });
            })
          }
          await testNotifyCharacteristicChanged();
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]notifyCharacteristicChanged error, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(401);
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0400
       * @tc.name testNotifyCharacteristicChanged callback
       * @tc.desc Test NotifyCharacteristicChanged api10.
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_NOTIFYCHARACTERISTIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          await gattServer.notifyCharacteristicChanged(null, null);
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]notifyCharacteristicChanged error, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(401);
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0100
       * @tc.name testSendResponse success
       * @tc.desc Test SendResponse api10.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          let arrayBuffer = new ArrayBuffer(8);
          let value =  new Uint8Array(arrayBuffer);
          value[0] = 1;
          let ServerResponse : bluetooth.ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
            status: 0, offset: 0, value: arrayBuffer};
          gattServer.sendResponse(ServerResponse);
          expect(true).assertFalse();
          done();
        } catch (error) {
          console.error(`[bluetooth_js]sendResponse1 failed, code is ${error.code},
            message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]createA2dpSrcProfile is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
          done();
        }
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0200
       * @tc.name testSendResponse success
       * @tc.desc Test SendResponse api10.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          let arrayBuffer = new ArrayBuffer(8);
          let value =  new Uint8Array(arrayBuffer);
          value[0] = 1;
          let ServerResponse : bluetooth.ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
            status: -1, offset: 0, value: arrayBuffer};
          gattServer.sendResponse(ServerResponse);
          expect(true).assertFalse();
          done();
        } catch (error) {
          console.error(`[bluetooth_js]sendResponse2 failed, code is ${error.code},
            message is ${error.message}`);
          expect(Number(error.code)).assertEqual(2900099);
          done();
        }
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0300
       * @tc.name testSendResponse success
       * @tc.desc Test SendResponse 401 -null parameter.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          gattServer.sendResponse(null);
          expect(true).assertFalse();
          done();
        } catch (error) {
          console.error('[bluetooth_js]sendResponse3 error.code:'+JSON.stringify(error.code)+
          'error.message:'+JSON.stringify(error.message));
          expect(Number(error.code)).assertEqual(401);
          done();
        }
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0400
       * @tc.name testSendResponse success
       * @tc.desc Test SendResponse 401 -error parameter.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_SENDRESPONSE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          let arrayBuffer = new ArrayBuffer(8);
          let value =  new Uint8Array(arrayBuffer);
          value[0] = 1;
          let ServerResponse : bluetooth.ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
            status: -1, offset: 0, value: arrayBuffer};
          gattServer.sendResponse(ServerResponse);
          expect(true).assertFalse();
          done();
        } catch (error) {
          console.error(`[bluetooth_js]sendResponse4 failed, code is ${error.code},
            message is ${error.message}`);
          expect(Number(error.code)).assertEqual(2900099);
          done();
        }
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_0100
       * @tc.name test gattserver on blemtuchange
       * @tc.desc test gattserver on blemtuchange api10.
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          gattServer.on('BLEMtuChange', (mtu: number)=> {
            console.info('BLEMtuChange on value' + JSON.stringify(mtu));
          })
        } catch (err) {
          console.error("bluetooth mtu changed on errCode:" + err.code + ",bluetooth mtu changed on errMessage:" + err.message);
          if (err.code == 801) {
                console.info('[bluetooth_js]BLEMtuChange is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        gattServer.off('BLEMtuChange', (mtu: number)=> {
            console.info('BLEMtuChange on value' + JSON.stringify(mtu));
          });
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_0200
       * @tc.name test gattserver off blemtuchange
       * @tc.desc test gattserver off blemtuchange api10
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        gattServer.on('BLEMtuChange', (mtu: number)=> {
          console.info('BLEMtuChange on value' + JSON.stringify(mtu));
        })
        try {
          gattServer.off('BLEMtuChange', (mtu: number)=> {
            console.info('BLEMtuChange on value' + JSON.stringify(mtu));
          });
        } catch (err) {
          console.error("bluetooth mtu changed off errCode:" + err.code + ",bluetooth mtu changed off errMessage:" + err.message);
          if (err.code == 801) {
                console.info('[bluetooth_js]BLEMtuChange is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_CLOSE_0100
       * @tc.name testClose
       * @tc.desc test gattserver close
       * @tc.type Function
       * @tc.level Level 2
       */
      it('SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_CLOSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
          let gattService = bluetooth.createGattServer();
          gattService.close();
        } catch (err) {
          console.error("bluetooth gattServer close errCode:" + err.code + ",bluetooth gattServer close errMessage:" + err.message);
          if (err.code == 801) {
                console.info('[bluetooth_js]close is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
      })
    })
  }