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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
         * @tc.size:MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0036', 0, async (done:Function) =>{
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
                expect().assertFail();
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0034
         * @tc.name testgetScanResultsSync
         * @tc.desc Test getScanResults Sync API functionality.
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0034', 0, async (done:Function) =>{
            try {
		        let isMeteredHotspot = wifiMg.isMeteredHotspot();
		        console.info("isMeteredHotspot:" + isMeteredHotspot);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0035
         * @tc.name testIsHotspotActive
         * @tc.desc Test isHotspotActive Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0035', 0, async (done:Function) =>{
            try {
		        let isHotspotActive = wifiMg.isHotspotActive();
		        console.info("isHotspotActive:" + isHotspotActive);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                expect(true).assertFalse();
	        }
	        done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0037
         * @tc.name testAddDeviceConfig
         * @tc.desc Test addDeviceConfig Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_Sta_0037', 0, async (done:Function) =>{
            try {
		        let wifiDeviceConfig:wifiMg.WifiDeviceConfig = {
                "ssid": "publicTest",
                "bssid": "00:11:22:33:44:55",
                "bssidType": wifiMg.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN
            };
            let networkNum =-1;
            await wifiMg.addDeviceConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add OPEN DeviceConfig promise result : " + JSON.stringify(netWorkId));
                    networkNum = netWorkId;
                }).catch((err : BusinessError) => {
                    console.info("[wifi_test]add OPEN DeviceConfig failed : " + JSON.stringify(err));
                    expect().assertFail();
                });
                expect(true).assertEqual(networkNum != -1);
                let configs1 = wifiMg.getDeviceConfigs();
                console.info("[wifi_test]getDeviceConfigs1 result : " + JSON.stringify(configs1));
                if (configs1.length != 0) {
                    expect(configs1[((configs1.length)-1)].ssid).assertEqual("publicTest");
                } else {
                    console.info("[wifi_test]addDeviceConfig fail");
                }
                console.info("[wifi_test]connectToNetwork start.");
                wifiMg.connectToNetwork(networkNum);
                await sleep(2000);
                console.info("[wifi_test]disconnect start.");
                wifiMg.disconnect();
                await sleep(2000);
                console.info("[wifi_test]removeDevice start.");
                wifiMg.removeDevice(networkNum);
                await sleep(2000);
                let configs2 = wifiMg.getDeviceConfigs();
                console.info("[wifi_test]getDeviceConfigs2 result : " + JSON.stringify(configs2));
                if (configs2.length != 0) {
                    expect(true).assertEqual(configs2[((configs2.length)-1)].ssid != "publicTest");
                } else {
                    expect(true).assertEqual(configs2.length == 0);
                }
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                expect().assertFail();
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
        it('SUB_Communication_WiFi_XTS_Sta_0038', 0, async (done:Function) =>{
            try {
		        let address = wifiMg.getDeviceMacAddress();
                console.info("getDeviceMacAddress result:" + JSON.stringify(address));
                expect(true).assertEqual(address != null);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                expect().assertFail();
	        }
	        done();
        })
  })
}