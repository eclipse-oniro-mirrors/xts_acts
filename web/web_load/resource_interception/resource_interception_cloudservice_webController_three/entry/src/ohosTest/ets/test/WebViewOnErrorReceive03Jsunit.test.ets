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
import { describe, beforeEach, it, TestType, Size, Level, expect } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewOnErrorReceive03Jsunit() {
    describe('ActsAceWebDevWebViewOnErrorReceive03Test',  () =>{
        beforeEach(async  (done: Function) => {
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
                url: "testability/pages/onErrorReceive03"
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get onErrorReceive03 state success " + JSON.stringify(pages));
                if (!("onErrorReceive03" == pages.name)) {
                    console.info("get onErrorReceive03 state success " + JSON.stringify(pages.name));
                    await router.push(options);
                    console.info("push onErrorReceive03 page success");
                }
            } catch (err) {
                console.error("push onErrorReceive03 page error: " + err);
            }
            await driver.waitForComponent(ON.id("onErrorReceive03"), 10000);
            console.log("waitForComponent onErrorReceive03");
            done()
        })

        /**
         * @tc.name   testOnErrorReceive03
         * @tc.number SUB_ACE_BASIC_ETS_API_ONERRORRECEIVE_0300
         * @tc.desc   test api onErrorReceive  by load 'https://wrong.host.badssl.com/'
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOnErrorReceive03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
            let errorIfo = 'ERR_CERT_COMMON_NAME_INVALID';
            let errorCode = -200;
            let url = 'https://wrong.host.badssl.com/';
            let isMainFrame = true;
            let isRedirect = false;
            let isRequestGesture = false;
            Utils.registerEvent("testOnErrorReceive03", errorIfo, 202000, null);
            Utils.registerEvent("testOnErrorReceive03", errorCode, 202010, null);
            Utils.registerEvent("testOnErrorReceive03", url, 202020, null);
            Utils.registerEvent("testOnErrorReceive03", isMainFrame, 202030, null);
            Utils.registerEvent("testOnErrorReceive03", isRedirect, 202040, null);
            Utils.registerEvent("testOnErrorReceive03", isRequestGesture, 202050, null);

            let a:Header[] =[
                {"headerKey":"Accept","headerValue":"text/html,application/xhtml+xml,application/xml;q=0.9,image/heif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"},
                {"headerKey":"Accept-Encoding","headerValue":"gzip, deflate, br, zstd"},
                {"headerKey":"Accept-Language","headerValue":"zh-CN,zh;q=0.9"},
                {"headerKey":"Sec-Fetch-Dest","headerValue":"document"},
                {"headerKey":"Sec-Fetch-Mode","headerValue":"navigate"},
                {"headerKey":"Sec-Fetch-Site","headerValue":"none"},
                {"headerKey":"Sec-Fetch-User","headerValue":"?1"},
                {"headerKey":"Upgrade-Insecure-Requests","headerValue":"1"},
                {"headerKey":"User-Agent","headerValue":"Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27"}]
            Utils.registerEvent("testOnErrorReceive03", JSON.stringify(a), 202060, done);
            await Utils.waitAndClickComponent(driver, "onErrorReceive03");
        })
    })
}