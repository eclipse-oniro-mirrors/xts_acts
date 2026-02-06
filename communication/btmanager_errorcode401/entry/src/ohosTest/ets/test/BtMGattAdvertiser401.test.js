
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

import bluetooth from '@ohos.bluetoothManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let gattServer = null;

function sleep(delay) {
     return new Promise(resovle => setTimeout(resovle, delay));
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

let OPEN_BT_TEXT = "开启";

async function clickTheWindow(text) {
     console.info('[bluetooth_js] clickTheWindow start');
     let driver = Driver.create();
     await driver.delayMs(3000);
     try {
          let button = await driver.findComponent(ON.text(text));
          await button.click();
          await driver.delayMs(3000);
          console.info('[bluetooth_js] click sucess');
     } catch (err) {
          console.info('[bluetooth_js] click failed. ' + JSON.stringify(err));
     }
}

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await clickTheWindow(OPEN_BT_TEXT);
                await sleep(10000);
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await clickTheWindow(OPEN_BT_TEXT);
                await sleep(10000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
export default function btManagerAdvertError401Test() {
     describe('btManagerAdvertError401Test', function() {
          beforeAll(async function (done) {
               console.info('beforeAll start');
               let PERMISSION_TEXT = "允许";
               await sleep(2000);
               await openPhone();
               await clickTheWindow(PERMISSION_TEXT);
               gattServer = bluetooth.BLE.createGattServer();
               console.info('beforeAll end');
               done();
          })
          beforeEach(async function (done) {
               console.info('beforeEach start');
               await tryToEnableBt();
               console.info('beforeAll end');
               done();
          })
          afterEach(function () {
               console.info('afterEach called')
          })
          afterAll(async function (done) {
               console.info('afterAll start');
               await sleep(900);
               gattServer.close();
               console.info('afterAll end');
               done();
          })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3000
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3000
           * @tc.desc   Test api 401 - parameters setting is null.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:4567,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    let advResponse ={
                         serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:1789,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(advData,advResponse);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error('[bluetooth_js]startAdvertising30 error.code:'+JSON.stringify(error.code)+
                         'error.message:'+JSON.stringify(error.message));
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3100
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3100
           * @tc.desc   Test api 401 - parameters setting is error type.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:4567,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    let advResponse ={
                         serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:1789,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(null,advData,advResponse);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error('[bluetooth_js]startAdvertising31 error.code:'+JSON.stringify(error.code)+
                         'error.message:'+JSON.stringify(error.message));
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3200
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3200
           * @tc.desc   Test api 401 - interval of setting is error type.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let setting={
                         interval:'sss',
                         txPower:-10,
                         connectable:true,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:4567,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising32 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

               /**
                * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3300
                * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3300
                * @tc.desc   Test api 401 - txPower of setting is error type.
                * @tc.type   FUNCTION
                * @tc.size   MEDIUMTEST
                * @tc.level  LEVEL2
                */
               it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let setting={
                         interval:10385,
                         txPower:'ttt',
                         connectable:true,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:4567,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising33 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

               /**
                * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3400
                * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3400
                * @tc.desc   Test api 401 - connectable of setting is error type.
                * @tc.type   FUNCTION
                * @tc.size   MEDIUMTEST
                * @tc.level  LEVEL2
                */
               it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:123123,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:4567,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising34 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3500
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3500
           * @tc.desc   Test api 401 - parameters advData is null.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) { 
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
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:true,
                    }
                    try {
                         gattServer.startAdvertising(setting);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising35 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3600
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3600
           * @tc.desc   Test api 401 - serviceUuids of advData is null.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:true,
                    }
                    let advData={
                         manufactureData:[{
                              manufactureId:4567,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising36 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3700
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3700
           * @tc.desc   Test api 401 - manufactureData of advData is null.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:true,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising37 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

          /**
           * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3800
           * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3800
           * @tc.desc   Test api 401 - serviceData of advData is null.
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:true,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:1789,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising38 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

               /**
                * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3900
                * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3900
                * @tc.desc   Test api 401 - manufactureValue of advData is error type.
                * @tc.type   FUNCTION
                * @tc.size   MEDIUMTEST
                * @tc.level  LEVEL2
                */
               it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
                    let serviceValueBuffer = new Uint8Array(4);
                    serviceValueBuffer[0] = 4;
                    serviceValueBuffer[1] = 6;
                    serviceValueBuffer[2] = 7;
                    serviceValueBuffer[3] = 8;
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:true,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:1789,
                              manufactureValue:123
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:serviceValueBuffer.buffer
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising39 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })

               /**
                * @tc.name   SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_4000
                * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_4000
                * @tc.desc   Test api 401 - serviceValue of advData is error type.
                * @tc.type   FUNCTION
                * @tc.size   MEDIUMTEST
                * @tc.level  LEVEL2
                */
               it('SUB_COMMUNICATION_BTMANAGER_GATTADVERT_ERROR_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
                    let manufactureValueBuffer = new Uint8Array(4);
                    manufactureValueBuffer[0] = 1;
                    manufactureValueBuffer[1] = 2;
                    manufactureValueBuffer[2] = 3;
                    manufactureValueBuffer[3] = 4;
                    let setting={
                         interval:10385,
                         txPower:-10,
                         connectable:true,
                    }
                    let advData={
                         serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                         manufactureData:[{
                              manufactureId:1789,
                              manufactureValue:manufactureValueBuffer.buffer
                         }],
                         serviceData:[{
                              serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                              serviceValue:123123
                         }],
                    }
                    try {
                         gattServer.startAdvertising(setting,advData);
                         gattServer.stopAdvertising();
                         expect(true).assertFalse();
                    }catch(error) {
                         console.error(`[bluetooth_js]startAdvertising40 failed, code is ${error.code},
                         message is ${error.message}`);
                         expect(Number(error.code)).assertEqual(401);
                    }
                    done();
               })
})

}
