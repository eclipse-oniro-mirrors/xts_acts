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

export default function wifiSta() {

    describe('wifiSta', function () {
        function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
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

        beforeAll(async function (done) {
            console.info('beforeAll case');
            done();
        })

        beforeEach(function() {})

        afterEach(function() {})

        afterAll(async function (done){
            console.info('AfterAll case');
            done();
        })
        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0034
         * @tc.name testgetScanResultsSync
         * @tc.desc Test getScanResults Sync API functionality.
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0034', 0, async function(done) {
            try {
		        let isMeteredHotspot = wifiMg.isMeteredHotspot();
		        console.info("isMeteredHotspot:" + isMeteredHotspot);
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
	        }
	        done();
        })
  })
}