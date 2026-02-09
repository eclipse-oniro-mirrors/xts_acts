/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnErrorReceive02Jsunit() {
    describe('ActsAceWebDevWebViewOnErrorReceive02Test',  () =>{
        beforeEach(async  (done: Function) =>{
            try {
                console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
                let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
                console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
                console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
                console.info('======> Internet chload : ' + JSON.stringify(data.chload));
                console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
                if (data.connState == wifiMg.ConnState.CONNECTED) {
                    console.info('======> WLAN connection established ');
                } else {
                    expect().message('======> WLAN Network error').assertFail();
                    done()
                }
                if (data.chload >= 800 || data.rssi <= -80) {
                    expect().message('======> WLAN Network error').assertFail();
                    done();
                } else if (data.chload >= 500) {
                    console.info('======> The internet connection is poor. ');
                }
            } catch (err) {
                console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
                throw (err as Error);
                done();
            }
            config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
                console.info(`enable success`);
                }).catch((err: object) => {
                console.error(`failed to enable, ${err}`);
            })
            let options: router.RouterOptions = {
                url: "testability/pages/onErrorReceive02"
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get onErrorReceive02 state success " + JSON.stringify(pages));
                if (!("onErrorReceive02" == pages.name)) {
                    console.info("get onErrorReceive02 state success " + JSON.stringify(pages.name));
                    await router.push(options);
                    console.info("push onErrorReceive02 page success");
                }
            } catch (err) {
                console.error("push onErrorReceive02 page error: " + err);
            }
            await driver.waitForComponent(ON.id("onErrorReceive02"), 10000);
            console.log("waitForComponent onErrorReceive02");
            done()
        })

        /**
         * @tc.name   testOnErrorReceive02
         * @tc.number SUB_ACE_BASIC_ETS_API_ONERRORRECEIVE_0200
         * @tc.desc   test api onErrorReceive  by load html which contain of "<iframe
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOnErrorReceive02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
            let isReturn = 0;
            Utils.registerEvent("testOnErrorReceive02", false, 201990, () => { isReturn = 1 });
            await Utils.waitAndClickComponent(driver, "onErrorReceive02");
            if (await Utils.waitForExist(() => isReturn, 'testOnErrorReceive02' + '_returnCheck', 1, 1000)) {
                done();
            }
        })
    })
}