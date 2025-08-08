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
// import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// import router from '@system.router';
export default function webViewOnErrorReceive02Jsunit() {
    describe('ActsAceWebDevWebViewOnErrorReceive02Test',  () =>{
        beforeEach(async  (done: Function) =>{
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
                    let result = await router.push(options);
                    await Utils.sleep(2000);
                    console.info("push onErrorReceive02 page success " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push onErrorReceive02 page error: " + err);
            }
            await Utils.sleep(2000);
            done()
        })
        afterEach(async  (done: Function) => {
            done();
        })
        /*
        *tc.number SUB_ACE_BASIC_ETS_API_ONERRORRECEIVE_0200
        *tc.name testOnErrorReceive02
        *tc.desc test api onErrorReceive  by load html which contain of "<iframe
                 src="https://wrong.host.badssl.com"></iframe>"
        */
        it('testOnErrorReceive02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
            let isMainFrame = false;
            Utils.registerEvent("testOnErrorReceive02", isMainFrame, 7120, done);
            sendEventByKey('onErrorReceive02',10,'');
        })
    })
}