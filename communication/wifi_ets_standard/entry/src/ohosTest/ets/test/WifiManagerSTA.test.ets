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
import wifiMg from '@ohos.wifiManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
function sleep(delay:number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay);
  }); 
}

async function tryToEnableWifi(){
    if(!wifiMg.isWifiActive()){
        console.info("wifi_test/enable wifi:" + wifiMg.enableWifi());
        await sleep(5000);
    }
    console.info("wifi_test/wifi status:" + wifiMg.isWifiActive());
}

async function tryToDisConnWifi(){
    if(wifiMg.isConnected()){
        console.info("wifi_test/ wifi is connect status :" + wifiMg.isConnected());
        try
        {
            wifiMg.disconnect()
        }
        catch(error)
        {
            console.info("wifi_test/wifi disconnect failed")
        }
        await sleep(1000);
    }
    console.info("wifi_test/wifi status:" + wifiMg.isWifiActive());
}


export default function wifiSta() {

    describe('wifiSta', async () => {

        beforeAll(async (done:Function) =>{
            console.info('beforeAll case');
            done();
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(async (done:Function)=>{
            console.info('AfterAll case');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0036
         * @tc.name testEnableWifi
         * @tc.desc Test enableWifi Sync API functionality.
         * @tc.size:LargeTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0036', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done:Function) =>{
            try {
		        let status = wifiMg.isWifiActive();
                console.info("isWifiActive result:" + status);
                if(!status) {
                    console.info("enableWifi start.");
                    wifiMg.enableWifi();
                    await sleep(1500);
                    let state = wifiMg.isWifiActive();
                    console.info("isWifiActive result:" + state);
                    expect(state).assertTrue();
                } else {
                    console.info("wifi is open.");
                }
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]enableWifi is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0034
         * @tc.name testIsMeteredHotspot
         * @tc.desc Test isMeteredHotspot Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
            try {
		        let isMeteredHotspot = wifiMg.isMeteredHotspot();
		        console.info("isMeteredHotspot:" + isMeteredHotspot);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0035
         * @tc.name testIsHotspotActive
         * @tc.desc Test isHotspotActive Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 1
         */
        it('SUB_Communication_WiFi_XTS_Sta_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) =>{
            try {
		        let isHotspotActive = wifiMg.isHotspotActive();
		        console.info("isHotspotActive:" + isHotspotActive);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0038
         * @tc.name testGetDeviceMacAddress
         * @tc.desc Test getDeviceMacAddress Sync API functionality.
         * @tc.size:MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_WiFi_XTS_Sta_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) =>{
            try {
		        let address = wifiMg.getDeviceMacAddress();
                console.info("getDeviceMacAddress result:" + JSON.stringify(address));
                expect(true).assertEqual(address != null);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0039
         * @tc.name testGetMultiLinkedInfo
         * @tc.desc Test getMultiLinkedInfo Sync API functionality.
         * @tc.size:MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
           try {
		        let mLInfo = wifiMg.getMultiLinkedInfo();
                console.info("getMultiLinkedInfo result:" + JSON.stringify(mLInfo));
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("getMultiLinkedInfo is not support");
                    expect(true).assertTrue();
                }else {
                    expect(Number(error.code)).assertEqual(2501000);
                }
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0040
         * @tc.name testGetLinkedInfoSync
         * @tc.desc Test getLinkedInfoSync Sync API functionality.
         * @tc.size:MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
           try {
		        let wifiLinkedInfo: wifiMg.WifiLinkedInfo = wifiMg.getLinkedInfoSync();
                console.info("[wifi_test]getLinkedInfoSync result : " + JSON.stringify(wifiLinkedInfo));
                console.info("[wifi_test]getLinkedInfoSync result wifiLinkType : " + JSON.stringify(wifiLinkedInfo.wifiLinkType));
                console.info("[wifi_test]getLinkedInfoSync result channelWidth : " + JSON.stringify(wifiLinkedInfo.channelWidth));
                expect(true).assertEqual(wifiLinkedInfo != null);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("getLinkedInfoSync is not support");
                    expect(true).assertTrue();
                }else {
                    expect().assertFail();
                }
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0041
         * @tc.name testWifiLinkType
         * @tc.desc Test WifiLinkType Sync API functionality.
         * @tc.size:MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
           try {
		        let DEFAULT_LINK = wifiMg.WifiLinkType.DEFAULT_LINK;
                console.info("[wifi_test]WifiLinkType DEFAULT_LINK result : " + JSON.stringify(DEFAULT_LINK));
                expect(DEFAULT_LINK).assertEqual(0);

                let WIFI7_SINGLE_LINK = wifiMg.WifiLinkType.WIFI7_SINGLE_LINK;
                console.info("[wifi_test]WifiLinkType WIFI7_SINGLE_LINK result : " + JSON.stringify(WIFI7_SINGLE_LINK));
                expect(WIFI7_SINGLE_LINK).assertEqual(1);

                let WIFI7_MLSR = wifiMg.WifiLinkType.WIFI7_MLSR;
                console.info("[wifi_test]WifiLinkType WIFI7_MLSR result : " + JSON.stringify(WIFI7_MLSR));
                expect(WIFI7_MLSR).assertEqual(2);

                let WIFI7_EMLSR = wifiMg.WifiLinkType.WIFI7_EMLSR;
                console.info("[wifi_test]WifiLinkType WIFI7_EMLSR result : " + JSON.stringify(WIFI7_EMLSR));
                expect(WIFI7_EMLSR).assertEqual(3);

                let WIFI7_STR = wifiMg.WifiLinkType.WIFI7_STR;
                console.info("[wifi_test]WifiLinkType WIFI7_STR result : " + JSON.stringify(WIFI7_STR));
                expect(WIFI7_STR).assertEqual(4);
	        }catch(error){
		        console.error("WifiLinkType failed:" + JSON.stringify(error));
                expect().assertFail();
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0044
         * @tc.name testConnectToNetwork
         * @tc.desc Test connectToNetwork Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
            try {
                wifiMg.connectToNetwork(null);
                expect().assertFail();
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0045
         * @tc.name testRemoveDevice
         * @tc.desc Test removeDevice Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
            try {
                wifiMg.removeDevice(null);
                expect().assertFail();
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0046
         * @tc.name SUB_Communication_WiFi_XTS_Sta_0046
         * @tc.desc Test DisableWifi Sync API functionality.
         * @tc.size:LARGETEST
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0046', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done:Function) =>{
            try {
		        let status = wifiMg.isWifiActive();
                console.info("isWifiActive result:" + status);
                if(!status) {
                    console.info("wifi is close,enableWifi start.");
                    wifiMg.enableWifi();
                    await sleep(2000);
                    let state1 = wifiMg.isWifiActive();
                    console.info("isWifiActive result:" + state1);
                    expect(state1).assertTrue();
                    console.info("enableWifi success.");
                }
                console.info("wifi is open,disableWifi start.");
                wifiMg.disableWifi();
                await sleep(2000);
                let state2 = wifiMg.isWifiActive();
                console.info("isWifiActive result:" + state2);
                expect(state2).assertFalse();
                console.info("disableWifi success.");
                console.info("wifi is close,enableWifi start.");
                wifiMg.enableWifi();
                await sleep(2000);
                let state3 = wifiMg.isWifiActive();
                console.info("isWifiActive result:" + state3);
                expect(state3).assertTrue();
                console.info("enableWifi success.");
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
	        }
	        done();
        })
  })
}