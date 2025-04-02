
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

import bluetooth from '@ohos.bluetooth';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btGattAdvertTest() {
describe('btGattAdvertTest', function() {
    let gattServer = null;
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

 async function clickTheWindow() {
     console.info('[bluetooth_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        try {
            let button = await driver.findComponent(ON.text("开启"));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click 开启 end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
        }
        try {
            let button1 = await driver.findComponent(ON.text("允许"));
            await button1.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click 允许 end');
        } catch (err) {
            console.info('[bluetooth_js] click 允许 failed. ' + err);
        }
 }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(1000);
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
                await clickTheWindow();
                await sleep(1000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await openPhone();
        await tryToEnableBt();
        gattServer = bluetooth.BLE.createGattServer();
        console.info('bluetooth ble create gattserver result:' + gattServer);
        done();
    })
    beforeEach(async function (done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()

    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(async function (done) {
        console.info('afterAll called')
        gattServer.close();
        console.info('bluetooth gattServer close success');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0100
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0100', 0, async function (done) {
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
               interval:150,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0200
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0200', 0, async function (done) {
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
               interval:20,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0300
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0300', 0, async function (done) { 
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
               interval:10485,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0400
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0400', 0, async function (done) {
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
               interval:10500,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0500
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0500', 0, async function (done) {
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
               interval:19,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0800
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0800', 0, async function (done) {
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
               interval:1000,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0900
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_0900', 0, async function (done) {
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
               interval:1000,
               txPower:-127,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1000
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1000', 0, async function (done) {
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
               interval:1000,
               txPower:1,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1100
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1100', 0, async function (done) {
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
               interval:1000,
               txPower:10,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1200
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1200', 0, async function (done) {
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
               interval:1000,
               txPower:-130,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1400
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1400', 0, async function (done) {
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
               interval:1000,
               txPower:1,
               connectable:false,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1500
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1500', 0, async function (done) {
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
               interval:1000,
               txPower:-7,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1600
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1600', 0, async function (done) {
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
               interval:1000,
               txPower:-7,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1800
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1800', 0, async function (done) {
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
               interval:1000,
               txPower:1,
               connectable:true,
          }
          let advData={
               serviceUuids:[""],
               manufactureData:[{
                    manufactureId:4567,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          let advResponse ={
               serviceUuids:[""],
               manufactureData:[{
                    manufactureId:1789,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          try {
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1900
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_1900', 0, async function (done) {
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
               interval:1000,
               txPower:1,
               connectable:true,
          }
          let advData={
               serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:4567,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[],
          }
          let advResponse ={
               serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:1789,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[],
          }
          try {
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })


    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_2100
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_2100', 0, async function (done) {
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
               interval:1000,
               txPower:1,
               connectable:true,
          }
          let advData={
               serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
               manufactureData:[],
               serviceData:[{
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          let advResponse ={
               serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
               manufactureData:[],
               serviceData:[{
                    serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          try {
               gattServer.startAdvertising(setting,advData,advResponse);
               gattServer.stopAdvertising();
          }catch(e) {
               expect(null).assertFail();
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_2200
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTADVERT_2200', 0, function () {
        let isRet = true;
        try{
            gattServer.stopAdvertising();
            expect(isRet).assertTrue();
        }catch(error){
            console.info("[bluetooth_js] GattclientClose err:" + JSON.stringify(error));
            let isRet = false;
            expect(isRet).assertFalse();
        } 
    })

})

}