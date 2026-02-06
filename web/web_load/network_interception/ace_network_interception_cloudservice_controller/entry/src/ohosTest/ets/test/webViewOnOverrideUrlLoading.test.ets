/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitWebViewOnOverrideUrlLoading"
const  driver = Driver.create();
export default function webViewOnOverrideUrlLoading() {
  describe('ActsAceWebViewOnOverrideUrlLoading', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewOnOverrideUrlLoading',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnOverrideUrlLoading state success " + JSON.stringify(pages));
            if (!("webViewOnOverrideUrlLoading" == pages.name)) {
                console.info("get webViewOnOverrideUrlLoading state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewOnOverrideUrlLoading page success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewOnOverrideUrlLoading page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })



    /*
    * @tc.number     : SUB_ACE_SUB_ONOVERRIDEURLLOADING_API_0600
    * @tc.name       : testWebViewwebViewOnOverrideUrlLoading
    * @tc.desc       : test interface of OnOverrideUrlLoading with runjavascript jump
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebViewwebViewOnOverrideUrlLoading', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent(emitKey, 142001)
        Utils.registerEvent("emitWebViewwebViewOnOverrideUrlLoading", "true",142010, done);
        Utils.waitAndClickComponent("webViewOnOverrideUrlLoading",driver)
    })
  })
}
