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

let Btname = {
    NUM_TEST :'012345678901234'+'456789012345678',
    NUM_TEST1 :'01234567'+'234567890'+'3456789012'+'012',
    LETTERS_TEST :'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    CHINESES_TEST :'测试蓝牙名称是否正常测试蓝牙名称是否试蓝牙',
    CHINESES_TEST2 :'测试蓝牙名称正常',
    SYMBOL_TEST:'*^_^* 、。·ˉˇ¨〃々—',
    MIXES:'测试蓝牙名称\'[6]aw',
    MIXES2:'——◎◇◆□测试蓝牙',
    MIXES3:'78453-、、。。◎◇',
    MIXES4:'hhhfdf-、、。。◎◇',
    MIXES5:'#01-5@<?;:’“”测试=\'[6]',
    MIXES6:'#01-567890@<>?/;:5675ASDF0!@b',
    MIXES7:'01234'+'23901'+'3456789'+'012345678'
}
export default function btLocalNameTest() {
describe('btLocalNameTest', function() {
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
        try {
            console.info('[bluetooth_js] clickRequestPermission start');
            let driver = Driver.create();
            await driver.delayMs(3000);
            let button = await driver.findComponent(ON.text("开启"));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] clickRequestPermission end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed');
        }
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta1 = bluetooth.getState();
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
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta2 = bluetooth.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await openPhone();
        done();
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0100
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 1 
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0100', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.LETTERS_TEST);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0100 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.LETTERS_TEST == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0200
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0200', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.CHINESES_TEST2);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0200 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.CHINESES_TEST2 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0300
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0300', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.NUM_TEST);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0300 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.NUM_TEST == getNewName);
        done();
    })

   /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0400
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0400', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.SYMBOL_TEST);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0400 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.SYMBOL_TEST == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0500
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0500', 0, async function (done) {
        let newName = 'my bluetooth';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0500 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0600
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0600', 0, async function (done) {
        let newName = 'bluetooth1234ABCDEFGH';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0600 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0700
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0700', 0, async function (done) {
        let newName = '蓝牙设备bluetooth';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0700 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0800
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0800', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES4);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0800 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES4 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0900
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_0900', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES2);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0900 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES2 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1000
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1000', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES3);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1000 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES3 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1100
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1100', 0, async function (done) {
        let newName = '蓝牙设备123';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1100 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1200
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1200', 0, async function (done) {
        let newName = '蓝牙设备bluetooth12';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName1200 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1300
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1300', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES6);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1300 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES6 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1400
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1400', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1400 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES == getNewName);
        
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1500
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1500', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES5);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1500 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES5 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1600
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1600', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.NUM_TEST1);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1600 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.NUM_TEST1 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1700
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1700', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.MIXES7);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1700 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES7 == getNewName);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1800
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1800', 0, async function (done) {
        let name = bluetooth.getLocalName();
        let set = bluetooth.setLocalName('');
        expect(set).assertFalse();
        await sleep(1000);
        let localName = bluetooth.getLocalName();
        expect(localName == name).assertTrue();
        console.info('[bluetooth_js] getLocalName1800=' + JSON.stringify(localName));
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1900
     * @tc.name set LocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_LOCALNAME_1900', 0, async function (done) {
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1900 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = 'bluetoothtest';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1900 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        let result1=bluetooth.setLocalName(localName);
        expect(result1).assertTrue();
        await sleep(1000);
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalNam1900 localName ='+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
    })

})
}