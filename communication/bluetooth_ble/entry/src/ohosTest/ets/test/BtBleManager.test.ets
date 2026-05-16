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

import { BusinessError } from '@ohos.base';
import bluetoothBle from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import connection from '@ohos.bluetooth.connection';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
let gattS: bluetoothBle.GattServer;
let gattC: bluetoothBle.GattClientDevice;


let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let nLength:number=0;

function sleep(delay : number) :Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay))
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
function ConnectStateChanged(state : bluetoothBle.BLEConnectionChangeState) {
  console.log('bluetooth connect state changed');
  let connectState : bluetoothBle.ProfileConnectionState = state.state;
  console.info('[bluetooth_js] state changed' + connectState)
  expect(true).assertEqual(connectState != null);
  console.log('bluetooth BLEConnectionChangeState reason:' + state.reason);
}
function getRssi() {
  return new Promise<void>((resolve,reject) => {
    gattC.getRssiValue((err : BusinessError, data : number)=> {
      if (err) {
        console.error('getRssi failed' + err);
        reject(err.code);
      } else
      {
        console.info('[bluetooth_js]getRssi value:'+JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve();
    });
  });
}
function getName() {
  return new Promise<void>((resolve,reject) => {
    gattC.getDeviceName((err:BusinessError, data: string)=> {
      if (err) {
        console.error('getName failed' + err);
        reject(err.code);
      } else
      {
        console.info('[bluetooth_js]getName value:'+JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve();
    });
  });
}
function getService() {
  return new Promise<void>((resolve,reject) => {
    gattC.getServices((err: BusinessError, data: Array<bluetoothBle.GattService>)=> {
      if (err) {
        console.error('getService failed' + err);
        reject(err.code);
      } else
      {
        console.info('[bluetooth_js]getService value:'+JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve();
    });
  });
}
function ReadCharacteristicReq(CharacteristicReadRequest : bluetoothBle.CharacteristicReadRequest) {
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  cccValue[0] = 1123;
  let deviceId : string = CharacteristicReadRequest.deviceId;
  let transId : number = CharacteristicReadRequest.transId;
  let offset : number = CharacteristicReadRequest.offset;
  let characteristicUuid :string = CharacteristicReadRequest.characteristicUuid;
  let serviceUuid: string = CharacteristicReadRequest.serviceUuid;

  let serverResponse : bluetoothBle.ServerResponse = {deviceId: deviceId, transId: transId, status: 0, offset: offset, value:arrayBufferCCC};

  try {
    gattS.sendResponse(serverResponse);
  } catch (err) {
    console.error("sendResponese errCode:" + err.code + ",errMessage:" + err.message);
  }
}
function readDesc(code : BusinessError, BLEDescriptor : bluetoothBle.BLEDescriptor) {
  if (code.code != 0) {
    return;
  }
  console.log('bluetooth BLEDescriptor serviceUuid: ' + BLEDescriptor.serviceUuid);
  console.log('bluetooth BLEDescriptor characteristicUuid: ' + BLEDescriptor.characteristicUuid);
  console.log('bluetooth BLEDescriptor descriptorUuid: ' + BLEDescriptor.descriptorUuid);
  console.log('bluetooth BLEDescriptor descriptorValue: ' + BLEDescriptor.descriptorValue);
  let value = new Uint8Array(BLEDescriptor.descriptorValue);
  console.log('bluetooth descriptor value: ' + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
}
function ReadDescriptorReq(DescriptorReadReq : bluetoothBle.DescriptorReadRequest) {
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  cccValue[0] = 1011;
  let deviceId : string = DescriptorReadReq.deviceId;
  let transId : number = DescriptorReadReq.transId;
  let offset : number = DescriptorReadReq.offset;
  let characteristicUuid : string = DescriptorReadReq.characteristicUuid;
  let serverResponse : bluetoothBle.ServerResponse = {deviceId: deviceId, transId: transId,
    status: 0, offset: offset, value:arrayBufferCCC};
  gattS.sendResponse(serverResponse);
  console.info("[bluetooth_js] DesRedon jsondata:" +
  'deviceId:' + deviceId + 'transId:' +transId + 'offset:' +
  offset +'descriptorUuid:' + DescriptorReadReq.descriptorUuid +
  'characteristicUuid:' +characteristicUuid +
  'serviceUuid:' + DescriptorReadReq.serviceUuid);
  expect(true).assertEqual(DescriptorReadReq != null);
}
function wrCharacteristicVal() {
  let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
              characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
              descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
              descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 32;
    let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
  return new Promise<void>((resolve,reject) => {
    gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE, (err: BusinessError, data : void)=> {
      if (err) {
        console.info('wrCharacteristicVal failed' + err);
        reject(err.code);
      } else
      {
        console.info('[bluetooth_js]wrCharacteristicVal value:'+JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve();
    });
  });
}
function WriteCharacteristicReq(CharacteristicWriteRequest : bluetoothBle.CharacteristicWriteRequest) {
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  let deviceId : string = CharacteristicWriteRequest.deviceId;
  let transId : number = CharacteristicWriteRequest.transId;
  let offset : number = CharacteristicWriteRequest.offset;
  let isPrepared : boolean = CharacteristicWriteRequest.isPrepared;
  let needRsp : boolean = CharacteristicWriteRequest.needRsp;
  let value :  Uint8Array =  new Uint8Array(CharacteristicWriteRequest.value);
  let characteristicUuid : string = CharacteristicWriteRequest.characteristicUuid;
  let serviceUuid :string = CharacteristicWriteRequest.serviceUuid;
  console.info('CharacteristicWriteRequest deviceId:' + deviceId);
  console.info('CharacteristicWriteRequest transId:' + transId);
  console.info('CharacteristicWriteRequest offset:' + offset);
  console.info('CharacteristicWriteRequest isPrepared:' + isPrepared);
  console.info('CharacteristicWriteRequest needRsp:' + needRsp);
  console.info('CharacteristicWriteRequest value:' + value);
  console.info('CharacteristicWriteRequest characteristicUuid:' + characteristicUuid);
  console.info('CharacteristicWriteRequest serviceUuid:' + serviceUuid);
  cccValue[0] = value[0];
  let serverResponse : bluetoothBle.ServerResponse = {deviceId: deviceId, transId: transId,
    status: 0, offset: offset, value:arrayBufferCCC};
  gattS.sendResponse(serverResponse);
}
function wrDescriptorVal() {
  let bufferDesc = new ArrayBuffer(8);
  let descV = new Uint8Array(bufferDesc);
  descV[0] = 22;
  let descriptor : bluetoothBle.BLEDescriptor = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
            descriptorValue: bufferDesc
        };
  return new Promise<void>((resolve,reject) => {
    gattC.writeDescriptorValue(descriptor, (err:BusinessError, data:void)=> {
      if (err) {
        console.error('Descriptor failed' + err);
        reject(err.code);
      } else
      {
        console.info('[bluetooth_js]Descriptor value:'+JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve();
    });
  });
}
  function WriteDescriptorReq(DescriptorWriteRequest : bluetoothBle.DescriptorWriteRequest) {    //
    let arrayBufferDesc = new ArrayBuffer(8);
    let descValue = new Uint8Array(arrayBufferDesc);
    let deviceId : string = DescriptorWriteRequest.deviceId;
    let transId : number = DescriptorWriteRequest.transId;
    let offset : number = DescriptorWriteRequest.offset;
    let isPrepared : boolean = DescriptorWriteRequest.isPrepared;
    let needRsp : boolean = DescriptorWriteRequest.needRsp;
    let value : Uint8Array = new Uint8Array(DescriptorWriteRequest.value);
    let descriptorUuid : string = DescriptorWriteRequest.descriptorUuid;
    descValue[0] = value[0];
    let serverResponse : bluetoothBle.ServerResponse = {deviceId: deviceId, transId: transId,
      status: 0, offset: offset, value:arrayBufferDesc};
    gattS.sendResponse(serverResponse);
    console.info("[bluetooth_js] desWriOn jsondata: " +'deviceId: '
    + deviceId + 'transId:' + transId + 'offset:' + offset +'descriptorUuid:'
    + descriptorUuid + 'charUuid:' + DescriptorWriteRequest.characteristicUuid +
    'serviceUuid:' + DescriptorWriteRequest.serviceUuid +
    'value:' + DescriptorWriteRequest.value + 'needRsp' +
    needRsp + 'isPrepared:' +isPrepared );
    expect(true).assertEqual(DescriptorWriteRequest != null);
  }
  function CharacteristicChange(CharacteristicChangeReq : bluetoothBle.BLECharacteristic) { 
    let serviceUuid : string = CharacteristicChangeReq.serviceUuid;
    let characteristicUuid : string = CharacteristicChangeReq.characteristicUuid;
    let value : Uint8Array = new Uint8Array(CharacteristicChangeReq.characteristicValue);
    let characteristicValueHandle = CharacteristicChangeReq.characteristicValueHandle;
    expect(true).assertEqual(CharacteristicChangeReq != null);
  }
  function setCCN() {
    let descriptors : Array<bluetoothBle.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let characteristic: bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
    return new Promise<void>((resolve, reject) => {
      gattC.setCharacteristicChangeNotification(characteristic, false, (err: BusinessError, data: void) => {
        if (err) {
          console.error('setCCN failed' + err);
          reject(err.code);
        } else {
          console.info('[bluetooth_js]setCCN value:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
        }
        resolve();
      });
    });
  }
    function setCCI() { 
      let descriptors : Array<bluetoothBle.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor : bluetoothBle.BLEDescriptor= {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic : bluetoothBle.BLECharacteristic= {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
      return new Promise<void>((resolve, reject) => {
        gattC.setCharacteristicChangeIndication(characteristic, false, (err: BusinessError, data: void) => {
          if (err) {
            console.error('setCCI failed' + err);
            reject(err.code);
          } else {
            console.info('[bluetooth_js]setCCI value:' + JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
          resolve();
        });
      });
    }
    function readCcc(code : BusinessError, BLECharacteristic : bluetoothBle.BLECharacteristic) {
            if (code.code != 0) {
            return;
          }
            console.log('bluetooth characteristic uuid: ' + BLECharacteristic.characteristicUuid);
            let value = new Uint8Array(BLECharacteristic.characteristicValue);
            console.log('bluetooth characteristic value: ' + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
          }

    function WriteDC (err:BusinessError)  {
      if (err) {
        console.error('Descriptor failed' + err);
      } else {
        console.info('[bluetooth_js]Descriptor value:');
      }
    }

export default function btBleManagerTest() {
  describe('btBleManagerTest', () => {
    beforeAll(async (done : Function) =>  {
      await clickRequestPermission(PERMISSION_TEXT);
      await tryToEnableBt()
      gattS = bluetoothBle.createGattServer();
      console.info('bluetooth ble create gattserver result:' + gattS);
      gattC = bluetoothBle.createGattClientDevice('04:30:02:01:00:07');
      console.info('bluetooth ble create gattclientdevice result:' + gattC);
      try{
        let deviceName = connection.getLocalName()
        nLength = deviceName.length
        console.info(`deviceName.length = ${nLength}`)
      }catch (err){
        expect(Number(err.code)).assertEqual(801)
      }
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
      gattC.close();
      console.info('bluetooth gattC close success');
      gattS.close();
      console.info('bluetooth gattS close success');
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0100
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
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
      interface Setting{
        interval : number;
        txPower : number;
        connectable : boolean
      }
      let setting : Setting = {
        interval:32,
        txPower:1,
        connectable:true,
      }
      let manufactureDataUnit1: bluetoothBle.ManufactureData = {
        manufactureId:4567,
        manufactureValue:manufactureValueBuffer.buffer
      };
      let advData : bluetoothBle.AdvertiseData = {
        serviceUuids : ["00001888-0000-1000-8000-00805f9b34fb"],
        manufactureData : [manufactureDataUnit1],
        serviceData:[{
          serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
          serviceValue:serviceValueBuffer.buffer
        }],
        includeDeviceName:false
      }
      let manufactureDataUnit2 : bluetoothBle.ManufactureData = {
        manufactureId:1789,
        manufactureValue:manufactureValueBuffer.buffer
      }
      let serviceDataUnit : bluetoothBle.ServiceData = {
        serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
        serviceValue:serviceValueBuffer.buffer
      }
      let advResponse : bluetoothBle.AdvertiseData ={
        serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
        manufactureData : [manufactureDataUnit2],
        serviceData : [serviceDataUnit],
      }
      try {
        bluetoothBle.startAdvertising(setting,advData,advResponse);
        console.info('[bluetooth_js]startAdvertising1 success');
        bluetoothBle.stopAdvertising();
      }catch(error) {
        console.error(`[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]createA2dpSrcProfile is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0200
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        bluetoothBle.startAdvertising(null, null ,null);
        console.info('[bluetooth_js]startAdvertising1 success');
        expect().assertFail();
      }catch(error) {
        console.error(`[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0100
     * @tc.desc   Test api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.connect();
      } catch(error) {
        console.error(`[bluetooth_js]connect failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]connect is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTDISCONNECT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTDISCONNECT_0100
     * @tc.desc   Test api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTDISCONNECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.disconnect();
      } catch(error) {
        console.error(`[bluetooth_js]disconnect failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]disconnect is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0200
     * @tc.desc   Test api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let result = bluetoothBle.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnDev:" + JSON.stringify(result)
          + "length:" +result.length);
        expect(result != null).assertTrue();
      } catch (error) {
        console.error(`[bluetooth_js]getConnDev failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getConnectedBLEDevices is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0300
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.on('BLEConnectionStateChange', ConnectStateChanged);
      } catch (error) {
        console.error(`[bluetooth_js]GattConnect failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLEConnectionStateChange is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      gattC.off("BLEConnectionStateChange", ConnectStateChanged);
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0400
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      gattC.on('BLEConnectionStateChange', ConnectStateChanged);
      try {
        gattC.off("BLEConnectionStateChange", ConnectStateChanged);
      } catch (error) {
        console.error(`[bluetooth_js]GattConnect failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLEConnectionStateChange is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0100
     * @tc.desc   Test getRssiValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await gattC.getRssiValue().then((data) => {
          console.info('[bluetooth_js] BLE read rssi: ' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch((err : BusinessError) => {
          console.info('bluetooth getRssiValue has error: '+ JSON.stringify(err));
          let b=false;
          if(err.code==2901003||err.code==-1)
          {
            b=true
          }
          expect(true).assertEqual(b);
          done();
        });
      } catch (error) {
        console.error(`[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getRssiValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2901003);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0200
     * @tc.desc   Test testGetDeviceName api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await getRssi().then((data) => {
          console.info("[bluetooth_js]02 getRssiValue done");
          done();
        })
          .catch((e : BusinessError) => {
            console.info("[bluetooth_js]02 getRssiValue failed" + e);
            expect(2901003).assertEqual(Number(e));
            done();
          })
      } catch (error) {
        console.error(`[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getRssiValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2901003);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0100
     * @tc.desc   Test GetDeviceName api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await gattC.getDeviceName().then((data) => {
          console.info('[bluetooth_js] device name:' + JSON.stringify(data))
          expect(true).assertEqual(data != null);
          done();
        }).catch((err : BusinessError) => {
          console.error('[bluetooth_js] bluetooth getDeviceName has error: '+ JSON.stringify(err));
          expect(Number(err.code)).assertEqual(2900099);
          done();
        });
      } catch (error) {
        console.error(`[bluetooth_js]GetDeviceName failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getDeviceName is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0200
     * @tc.desc   Test testGetDeviceName api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await getName().then((data) => {
          console.info("[bluetooth_js]02 getDeviceName done");
          done();
        })
          .catch((e : BusinessError)=> {
            console.info("[bluetooth_js]02 getDeviceName failed" + e);
            expect(2900099).assertEqual(Number(e));
            done();
          })
      } catch (error) {
        console.error(`[bluetooth_js]getDeviceName error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getDeviceName is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0100
     * @tc.desc   Test GetServices api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await gattC.getServices().then((GattService) => {
          console.info('[bluetooth_js] getServices successfully:'+JSON.stringify(GattService));
          expect(GattService).assertNull();
          done();
        }).catch((err : BusinessError) => {
          console.error('[bluetooth_js] getServices has error:'+ JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.error(`[bluetooth_js]GetService_0100 failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getServices is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0200
     * @tc.desc   Test GetServices api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        await getService().then((data) => {
          console.info("[bluetooth_js]02 getServices done");
          done();
        }).catch((e : BusinessError) => {
          console.info("[bluetooth_js]02 getServices failed" + e);
          expect(2900099).assertEqual(Number(e));
          done();
        })
      } catch (error) {
        console.error(`[bluetooth_js]getServices error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]getServices is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0100
     * @tc.desc   Test SetBLEMtuSize api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(500);
        console.info("[bluetooth_js]setBLEMtuSize success");
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]createA2dpSrcProfile is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0200
     * @tc.desc   Test SetBLEMtuSize api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(null);
        console.info("[bluetooth_js]setBLEMtuSize success");
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0300
     * @tc.desc   Test SetBLEMtuSize api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(23);
        console.info("[bluetooth_js]setBLEMtuSize success");
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize 3 failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(2900099);
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0400
     * @tc.desc   Test SetBLEMtuSize api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(517);
        console.info("[bluetooth_js]setBLEMtuSize success");
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize 4 failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(2900099);
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0500
     * @tc.desc   Test SetBLEMtuSize api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(22);
        console.info("[bluetooth_js]setBLEMtuSize success");
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize 5 failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(2900099);
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0600
     * @tc.desc   Test SetBLEMtuSize api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(518);
        console.info("[bluetooth_js]setBLEMtuSize success");
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize 6 failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(2900099);
      }
      done();
    })
    /**
           * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_ADD_0100
           * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_ADD_0100
           * @tc.desc   Test SetBLEMtuSize api10.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done : Function) =>  {
      try {
        gattC.setBLEMtuSize(undefined);
        console.info("[bluetooth_js]setBLEMtuSize success");
      } catch (error) {
        console.error(`[bluetooth_js]MtuSize 6 failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })
    
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_1900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors};
      try {
        gattC.readCharacteristicValue(characteristic);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2000
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors};
      try {
        gattC.readCharacteristicValue(characteristic, readCcc);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2100
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.on("characteristicRead", ReadCharacteristicReq);
        done();
      } catch (err) {
        console.info("characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]characteristicRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(2900099);
        }
      }
      gattS.off("characteristicRead", ReadCharacteristicReq);
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2200
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      gattS.on("characteristicRead", ReadCharacteristicReq);
      try {
        gattS.off("characteristicRead", ReadCharacteristicReq);
        done();
      } catch (err) {
        console.info("characteristicReadOff errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]characteristicRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(2900099);
        }
      }

      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1300
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc
      };
      try {
        gattC.readDescriptorValue(descriptor);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error("errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1400
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc
      };
      try {
        gattC.readDescriptorValue(descriptor, readDesc);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error("errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1500
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.on("descriptorRead", ReadDescriptorReq);
      } catch (error) {
        console.error(`[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      gattS.off("descriptorRead", ReadDescriptorReq);
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1600
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      gattS.on("descriptorRead", ReadDescriptorReq);
      try {
        gattS.off("descriptorRead", ReadDescriptorReq);
      } catch (error) {
        console.error(`[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1800
     * @tc.desc   Test Client WriteCharacteristicValue api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let arrayBuffer = new ArrayBuffer(8);
      let desValue =  new Uint8Array(arrayBuffer);
      desValue[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
        descriptorValue: arrayBuffer};
      descriptors[0] = descriptor;
      let arrayBufferCCC = new ArrayBuffer(8);
      let cccValue = new Uint8Array(arrayBufferCCC);
      cccValue[0] = 32;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: arrayBufferCCC, descriptors:descriptors};
      try {
        await wrCharacteristicVal().then((data) => {
          console.info("[bluetooth_js]18 writeCharacteristicValue done");
          done();
        })
          .catch((e : BusinessError) => {
            console.info("[bluetooth_js]18 writeCharacteristicValue failed" + e);
            expect(401).assertEqual(Number(e.code));
            done();
          })
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1900
     * @tc.desc   Test Client WriteCharacteristicValue api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
          descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: arrayBufferCCC, descriptors:descriptors};
        gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE).then(() => {
          console.info("writeCharacteristicValue");
          done();
        }, (err : BusinessError) => {
          console.error("writeCharacteristicValue:errCode" + err.code + ",errMessage:" + err.message);
          done();
        });
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2000
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.on("characteristicWrite", WriteCharacteristicReq);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]characteristicWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      gattS.off("characteristicWrite", WriteCharacteristicReq);
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2100
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      gattS.on("characteristicWrite", WriteCharacteristicReq);
      try {
        gattS.off("characteristicWrite", WriteCharacteristicReq);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]characteristicWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1000
     * @tc.desc   Test Client WriteDescriptorValue promsie api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 22;
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc
      };
      try {
        gattC.writeDescriptorValue(descriptor).then(() => {
          console.info("writeDescriptorValue");
          done();
        }, (err : BusinessError) => {
          console.error("writeDescriptorValue:errCode" + err.code + ",errMessage:" + err.message);
          done();
        });
      } catch (error) {
        console.error(`[bluetooth_js]writeDescriptorValue failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]createA2dpSrcProfile is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1100
     * @tc.desc   Test Client WriteDescriptorValue callback api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 22;
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc
      };
      try {

        await wrDescriptorVal().then((data) => {
          console.info("[bluetooth_js]11 writeDescriptorValue done");
          done();
        })
          .catch((e : BusinessError) => {
            console.info("[bluetooth_js]11 writeDescriptorValue failed" + e);
            expect(401).assertEqual(Number(e.code));
            done();
          })
      } catch (error) {
        console.error(`[bluetooth_js]writeDescriptorValue error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]createA2dpSrcProfile is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1200
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        gattS.on("descriptorWrite", WriteDescriptorReq);
      } catch (error) {
        console.error(`[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      gattS.off("descriptorWrite", WriteDescriptorReq);
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1300
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      gattS.on("descriptorWrite", WriteDescriptorReq);
      try {
        gattS.off("descriptorWrite", WriteDescriptorReq);
      } catch (error) {
        console.error(`[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1400
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.on('BLECharacteristicChange', CharacteristicChange);
      } catch (error) {
        console.error(`[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLECharacteristicChangeON is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      gattC.off('BLECharacteristicChange', CharacteristicChange);
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1500
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      gattC.on('BLECharacteristicChange', CharacteristicChange);
      try {
        gattC.off('BLECharacteristicChange', CharacteristicChange);
      } catch (error) {
        console.error(`[bluetooth_js]BLECharacteristicChangeOFF failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLECharacteristicChangeOFF is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0100
     * @tc.desc   Test setCharacteristicChangeNotification api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let arrayBuffer = new ArrayBuffer(8);
      let descV = new Uint8Array(arrayBuffer);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
      descriptors[0] = descriptor;
      let arrayBufferC = new ArrayBuffer(8);
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
      try {

        await setCCN().then((data) => {
          console.info("[bluetooth_js]01 setCharacteristicChangeNotification done");
          done();
        })
          .catch((e : BusinessError) => {
            console.info("[bluetooth_js]01 setCharacteristicChangeNotification failed" + e);
            expect(401).assertEqual(Number(e.code));
            done();
          })
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0200
     * @tc.desc   Test setCharacteristicChangeNotification api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let arrayBuffer = new ArrayBuffer(8);
      let descV = new Uint8Array(arrayBuffer);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
      descriptors[0] = descriptor;
      let arrayBufferC = new ArrayBuffer(8);
      let characteristic : bluetoothBle.BLECharacteristic= {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
      try {
        gattC.setCharacteristicChangeNotification(characteristic, true).then(() => {
          console.info("setCharacteristicChangeNotification");
        });
        done();
      } catch (err) {
        console.error('setCharacteristicChangeNotification failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0300
     * @tc.desc   Test setCharacteristicChangeIndication api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let arrayBuffer = new ArrayBuffer(8);
      let descV = new Uint8Array(arrayBuffer);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
      descriptors[0] = descriptor;
      let arrayBufferC = new ArrayBuffer(8);
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
      try {
        await setCCI().then((data) => {
          console.info("[bluetooth_js]03 setCharacteristicChangeIndication done");
          done();
        })
          .catch((e : BusinessError) => {
            console.info("[bluetooth_js]03 setCharacteristicChangeIndication failed" + e);
            expect(401).assertEqual(Number(e.code));
            done();
          })
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0400
     * @tc.desc   Test setCharacteristicChangeIndication api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let descriptors : Array<bluetoothBle.BLEDescriptor> = [];
      let arrayBuffer = new ArrayBuffer(8);
      let descV = new Uint8Array(arrayBuffer);
      descV[0] = 11;
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
      descriptors[0] = descriptor;
      let arrayBufferC = new ArrayBuffer(8);
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
      try {
        gattC.setCharacteristicChangeIndication(characteristic, true).then(() => {
          console.info("setCharacteristicChangeIndication");
          done();
        });
        done();
      } catch (err) {
        console.error('setCharacteristicChangeIndication failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0100
     * @tc.desc   test GattClientDevice on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        gattC.on('BLEMtuChange', (mtu: number) => {
          console.info('BLEMtuChange, mtu: ' + mtu);
        });
      } catch (err) {
        console.info("bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]BLEMtuChange is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      gattC.off('BLEMtuChange', (mtu: number) => {
        console.info('BLEMtuChange, mtu: ' + mtu);
      });
      done();

    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0200
     * @tc.desc   test GattClientDevice off blemtuchange api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      gattC.on('BLEMtuChange', (mtu: number) => {
        console.info('BLEMtuChange, mtu: ' + mtu);
      });
      try {
        gattC.off('BLEMtuChange', (mtu: number) => {
          console.info('BLEMtuChange, mtu: ' + mtu);
        });
      } catch (err) {
        console.info("bluetooth mtu changed off errCode:" + err.code + ",bluetooth mtu changed off errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]BLEMtuChange is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLE_CREATECLIENT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_CREATECLIENT_0100
     * @tc.desc   testCreateGattClientDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_CREATECLIENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
      try {
        bluetoothBle.createGattClientDevice(null);
      } catch (err) {
        console.info("bluetooth mtu changed off errCode:" + err.code + ",bluetooth mtu changed off errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]createGattClientDevice is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GATTCLIENT_CLOSE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTCLIENT_CLOSE_0100
     * @tc.desc   test gattClient close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTCLIENT_CLOSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let gattClients = bluetoothBle.createGattClientDevice("99:99:99:99:99:99");
        gattClients.close();
      } catch (err) {
        console.error("bluetooth gattClient close errCode:" + err.code + ",bluetooth gattClient close errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]close is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLECONSTANT_GATTDISCONNECTREASON_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLECONSTANT_GATTDISCONNECTREASON_0100
     * @tc.desc   Test BLE Constant Api20 GattDisconnectReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLECONSTANT_GATTDISCONNECTREASON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        let CONN_TIMEOUT = bluetoothBle.GattDisconnectReason.CONN_TIMEOUT;
        console.info("CONN_TIMEOUT:" + CONN_TIMEOUT);
        expect(CONN_TIMEOUT).assertEqual(1);
        let CONN_TERMINATE_PEER_USER = bluetoothBle.GattDisconnectReason.CONN_TERMINATE_PEER_USER;
        console.info("CONN_TERMINATE_PEER_USER:" + CONN_TERMINATE_PEER_USER);
        expect(CONN_TERMINATE_PEER_USER).assertEqual(2);
        let CONN_TERMINATE_LOCAL_HOST = bluetoothBle.GattDisconnectReason.CONN_TERMINATE_LOCAL_HOST;
        console.info("CONN_TERMINATE_LOCAL_HOST:" + CONN_TERMINATE_LOCAL_HOST);
        expect(CONN_TERMINATE_LOCAL_HOST).assertEqual(3);
        let CONN_UNKNOWN = bluetoothBle.GattDisconnectReason.CONN_UNKNOWN;
        console.info("CONN_UNKNOWN:" + CONN_UNKNOWN);
        expect(CONN_UNKNOWN).assertEqual(4);
      } catch (error) {
        console.error("GattDisconnectReason get error:" + JSON.stringify(error));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0100
     * @tc.desc   Test the function that the first parameter of the characteristicReadOn interface is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.on(null, ReadCharacteristicReq);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]characteristicRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0200
     * @tc.desc   Test the function that the first parameter of the characteristicReadOn interface is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.on(undefined, ReadCharacteristicReq);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]characteristicReadOn is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0300
     * @tc.desc   Test the function that the first parameter of the characteristicReadOff interface is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.off(null, ReadCharacteristicReq);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]characteristicReadOn is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0400
     * @tc.desc   Test the function that the first parameter of the characteristicReadOn interface is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattS.off(undefined, ReadCharacteristicReq);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]characteristicReadOn is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0500
     * @tc.desc   Test ReadDescriptorValue (null) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.readCharacteristicValue(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0600
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.readCharacteristicValue(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.readCharacteristicValue(characteristic);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.readCharacteristicValue(characteristic);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.readCharacteristicValue(characteristic, readCcc);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_1000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.readCharacteristicValue(characteristic, readCcc);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0100
     * @tc.desc   Test the function that the first parameter of the characteristicWriteOn interface is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0100"
      try {
        console.info(`${caseName} test start`);
        gattS.on(null, WriteCharacteristicReq);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]characteristicWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0200
     * @tc.desc   Test the function that the first parameter of the characteristicWriteOn interface is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0200"
      try {
        console.info(`${caseName} test start`);
        gattS.on(undefined, WriteCharacteristicReq);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]characteristicWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0300
     * @tc.desc   Test the function that the first parameter of the characteristicWriteOff interface is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0300"
      try {
        console.info(`${caseName} test start`);
        gattS.off(null, WriteCharacteristicReq);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]characteristicWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0400
     * @tc.desc   Test the function that the first parameter of the characteristicWriteOff interface is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0400"
      try {
        console.info(`${caseName} test start`);
        gattS.off(undefined, WriteCharacteristicReq);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]characteristicWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0100
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0100"
      try {
        console.info(`${caseName} test start`);
        gattS.on(null, ReadDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0200
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0200"
      try {
        console.info(`${caseName} test start`);
        gattS.on(undefined, ReadDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0300
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0300"
      try {
        console.info(`${caseName} test start`);
        gattS.off(null, ReadDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0400
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0400"
      try {
        console.info(`${caseName} test start`);
        gattS.off(null, ReadDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorRead is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0500
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName =  "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0500"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.readDescriptorValue(descriptor);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0600
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0600"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.readDescriptorValue(descriptor);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0700"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.readDescriptorValue(descriptor, readDesc);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0800
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0800"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.readDescriptorValue(descriptor, readDesc);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName}` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName}` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0900
     * @tc.desc   Test ReadDescriptorValue (null) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_0900"
      try {
        gattC.readDescriptorValue(null);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1000
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1000"
      try {
        gattC.readDescriptorValue(undefined);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1100
     * @tc.desc   Test ReadDescriptorValue (null) api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1100"
      try {
        gattC.readDescriptorValue(null, readDesc);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1200
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {let bufferDesc = new ArrayBuffer(8);
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_ADD_1200"
      try {
        gattC.readDescriptorValue(undefined, readDesc);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0100
     * @tc.desc   Test the function that the first parameter of the descriptorWriteOn interface is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0100"
      try {
        console.info(`${caseName} test start`);
        gattS.on(null, WriteDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0200
     * @tc.desc   Test the function that the first parameter of the descriptorWriteOn interface is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0200"
      try {
        console.info(`${caseName} test start`);
        gattS.on(undefined, WriteDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0300
     * @tc.desc   Test the function that the first parameter of the descriptorWriteOff interface is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0300"
      try {
        console.info(`${caseName} test start`);
        gattS.off(null, WriteDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0400
     * @tc.desc   Test the function that the first parameter of the descriptorWriteOff interface is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0400"
      try {
        console.info(`${caseName} test start`);
        gattS.off(undefined, WriteDescriptorReq);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]descriptorWrite is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })


    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0100
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0100"
      try {
        console.info(`${caseName} test start`);
        gattC.on(null, CharacteristicChange);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLECharacteristicChangeON is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0200
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0200"
      try {
        console.info(`${caseName} test start`);
        gattC.on(undefined, CharacteristicChange);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLECharacteristicChangeON is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0300
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0300"
      try {
        console.info(`${caseName} test start`);
        gattC.off(null, CharacteristicChange);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLECharacteristicChangeON is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0400
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_ADD_0400"
      try {
        console.info(`${caseName} test start`);
        gattC.off(undefined, CharacteristicChange);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code},
            message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLECharacteristicChangeON is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0100
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName  = "SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0100"
      try {
        console.info(`${caseName} test start`);
        gattC.on(null, ConnectStateChanged);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]ConnectStateChangedOn failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]ConnectStateChangedOn is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0200
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0200"
      try {
        console.info(`${caseName} test start`);
        gattC.on(undefined, ConnectStateChanged);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLEConnectionStateChange failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLEConnectionStateChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0300
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0300"
      try {
        console.info(`${caseName} test start`);
        gattC.off(null, ConnectStateChanged);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLEConnectionStateChange failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLEConnectionStateChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0400
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_ADD_0400"
      try {
        console.info(`${caseName} test start`);
        gattC.off(null, ConnectStateChanged);
        expect().assertFail();
      } catch (error) {
        console.error(`[bluetooth_js]BLEConnectionStateChange failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]BLEConnectionStateChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0100
     * @tc.desc   test GattClientDevice on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0100"
      try {
        console.info(`${caseName} test start`);
        gattC.on(null, (mtu: number) => {
          console.info('BLEMtuChange, mtu: ' + mtu);
        });
        expect().assertFail();
      } catch (err) {
        console.info("bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]BLEMtuChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();

    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0200
     * @tc.desc   test GattClientDevice on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0200"
      try {
        console.info(`${caseName} test start`);
        gattC.on(undefined, (mtu: number) => {
          console.info('BLEMtuChange, mtu: ' + mtu);
        });
        expect().assertFail();
      } catch (err) {
        console.info("bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]BLEMtuChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();

    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0300
     * @tc.desc   test GattClientDevice on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0300"
      try {
        console.info(`${caseName} test start`);
        gattC.off(null, (mtu: number) => {
          console.info('BLEMtuChange, mtu: ' + mtu);
        });
        expect().assertFail();
      } catch (err) {
        console.info("bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]BLEMtuChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();

    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0400
     * @tc.desc   test GattClientDevice on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_ADD_0400"
      try {
        console.info(`${caseName} test start`);
        gattC.off(undefined, (mtu: number) => {
          console.info('BLEMtuChange, mtu: ' + mtu);
        });
        expect().assertFail();
      } catch (err) {
        console.info("bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
        if (err.code == 801) {
          console.info('[bluetooth_js]BLEMtuChange is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      }
      done();

    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0100
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = 'SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0100'
      interface Setting{
        interval : number;
        txPower : number;
        connectable : boolean
      }
      let setting : Setting = {
        interval:32,
        txPower:1,
        connectable:false,
      }

      let advData : bluetoothBle.AdvertiseData = {
        serviceUuids : [],
        manufactureData : [],
        serviceData:[],
        includeDeviceName:true,
        includeTxPower:true
      }

      let advResponse : bluetoothBle.AdvertiseData ={
        serviceUuids:[],
        manufactureData : [],
        serviceData : [],
        includeDeviceName:true,
        includeTxPower:true
      }
      try {
        console.info(`${caseName} test start`)
        console.info(`${caseName} deviceName.length = ${nLength}`)
        bluetoothBle.startAdvertising(setting,advData,advResponse);
        console.info('[bluetooth_js]startAdvertising1 success');
        bluetoothBle.stopAdvertising();
      }catch(error) {
        console.error(`[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]startAdvertising1 is not support');
          expect(true).assertTrue();
        } else {
          if (nLength > 24) {
            expect(Number(error.code) === 2902054).assertTrue();
          }else{
            expect(Number(error.code)).assertEqual(2900099);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0200
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
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
      interface Setting{
        interval : number;
        txPower : number;
        connectable : boolean
      }
      let setting : Setting = {
        interval:32,
        txPower:1,
        connectable:false,
      }
      let advData : bluetoothBle.AdvertiseData = {
        serviceUuids : [""],
        manufactureData : [],
        serviceData:[],
        includeDeviceName:true,
        includeTxPower:true
      }
      let advResponse : bluetoothBle.AdvertiseData ={
        serviceUuids:[""],
        manufactureData : [],
        serviceData : [],
        includeDeviceName:false,
        includeTxPower:false
      }
      try {
        bluetoothBle.startAdvertising(setting,advData,advResponse);
        console.info('[bluetooth_js]startAdvertising1 success');
        bluetoothBle.stopAdvertising();
      }catch(error) {
        console.error(`[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]startAdvertising1 is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0300
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        bluetoothBle.startAdvertising(undefined,undefined,undefined);
        console.info('[bluetooth_js]startAdvertising success');
        bluetoothBle.stopAdvertising();
      }catch(error) {
        console.error(`[bluetooth_js]startAdvertising failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]startAdvertising is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0500
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName =  "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0500"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.writeDescriptorValue(descriptor);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0600
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0600"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.writeDescriptorValue(descriptor);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0700"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.writeDescriptorValue(descriptor, WriteDC);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0800
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0800"
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let descriptor : bluetoothBle.BLEDescriptor = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
        descriptorValue: bufferDesc,
        permissions: gattPermissions
      };
      try {
        gattC.writeDescriptorValue(descriptor, WriteDC);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName}` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName}` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0900
     * @tc.desc   Test ReadDescriptorValue (null) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_0900"
      try {
        gattC.writeDescriptorValue(null);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1000
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1000"
      try {
        gattC.writeDescriptorValue(undefined);
        expect(true).assertFalse();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1100
     * @tc.desc   Test ReadDescriptorValue (null) api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1100"
      try {
        gattC.writeDescriptorValue(null, WriteDC);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
        
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1200
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {let bufferDesc = new ArrayBuffer(8);
      let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_1200"
      try {
        gattC.writeDescriptorValue(undefined, WriteDC);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          console.info(`${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(401);
        }
      
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0500
     * @tc.desc   Test ReadDescriptorValue (null) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.readCharacteristicValue(null, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0600
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.readCharacteristicValue(undefined, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]readCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('wrCharacteristicVal failed' + err);
          } else
          {
            console.info('[bluetooth_js]wrCharacteristicVal value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('wrCharacteristicVal failed' + err);
          } else
          {
            console.info('[bluetooth_js]wrCharacteristicVal value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1100
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.writeCharacteristicValue(null, null, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('wrCharacteristicVal failed' + err);
          } else
          {
            console.info('[bluetooth_js]wrCharacteristicVal value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1200
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.writeCharacteristicValue(undefined, undefined, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('wrCharacteristicVal failed' + err);
          } else
          {
            console.info('[bluetooth_js]wrCharacteristicVal value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]writeCharacteristicValue is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0500
     * @tc.desc   Test ReadDescriptorValue (null) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeNotification(null, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0600
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeNotification(undefined, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeNotification(characteristic, false);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeNotification(characteristic, true);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeNotification(characteristic, false, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeNotification failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeNotification value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeNotification(characteristic, true, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeNotification failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeNotification value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1100
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeNotification(null, null, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeNotification failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeNotification value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_ADD_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_ADD_1200
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_ADD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeNotification(undefined, undefined, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeNotification failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeNotification value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeNotification is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1300
     * @tc.desc   Test ReadDescriptorValue (null) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeIndication(null, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1400
     * @tc.desc   Test ReadDescriptorValue (undefined) api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeIndication(undefined, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1500
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeIndication(characteristic, false);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1600
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeIndication(characteristic, true);
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: true,
        readEncrypted: true,
        readEncryptedMitm: true,
        write: true,
        writeEncrypted: true,
        writeEncryptedMitm: true,
        writeSigned: true,
        writeSignedMitm: true
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: true,
        writeNoResponse: true,
        read: true,
        notify: true,
        indicate: true,
        broadcast: true,
        authenticatedSignedWrite: true,
        extendedProperties: true
      };
      let descriptor : bluetoothBle.BLEDescriptor = {serviceUuid: '',
        characteristicUuid: '',
        descriptorUuid: '', descriptorValue: bufferDesc, descriptorHandle: 0, permissions: gattPermissions};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '',
        characteristicUuid: '',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeIndication(characteristic, false, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeIndication failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeIndication value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      let descriptors :  Array<bluetoothBle.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let gattPermissions: bluetoothBle.GattPermissions = {
        read: false,
        readEncrypted: false,
        readEncryptedMitm: false,
        write: false,
        writeEncrypted: false,
        writeEncryptedMitm: false,
        writeSigned: false,
        writeSignedMitm: false
      }
      let gattProperties: bluetoothBle.GattProperties = {
        write: false,
        writeNoResponse: false,
        read: false,
        notify: false,
        indicate: false,
        broadcast: false,
        authenticatedSignedWrite: false,
        extendedProperties: false
      };

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : bluetoothBle.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors, properties: gattProperties, permissions: gattPermissions};
      try {
        gattC.setCharacteristicChangeIndication(characteristic, true, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeIndication failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeIndication value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeIndication(null, null, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeIndication failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeIndication value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_ADD_2000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_ADD_2000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_ADD_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        gattC.setCharacteristicChangeIndication(undefined, undefined, (err: BusinessError, data : void)=> {
          if (err) {
            console.info('setCharacteristicChangeIndication failed' + err);
          } else
          {
            console.info('[bluetooth_js]setCharacteristicChangeIndication value:'+JSON.stringify(data));
            expect(true).assertEqual(data != null);
          }
        });
        done();
      } catch (error) {
        console.error(`[bluetooth_js]setCharacteristicChangeIndication failed, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
          console.info('[bluetooth_js]setCharacteristicChangeIndication is not support');
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
      done();
    })
  })
}