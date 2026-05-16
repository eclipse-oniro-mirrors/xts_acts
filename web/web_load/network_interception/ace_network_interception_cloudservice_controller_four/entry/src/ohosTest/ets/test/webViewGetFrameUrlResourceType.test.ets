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
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""
const  driver = Driver.create();
export default function ActsAceWebViewGetFrameUrlResourceType() {
  describe('ActsAceWebViewGetFrameUrlResourceType', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewGetFrameUrlResourceType',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewGetFrameUrlResourceType state success " + JSON.stringify(pages));
            if (!("webViewGetFrameUrlResourceType" == pages.name)) {
                console.info("get webViewGetFrameUrlResourceType state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewGetFrameUrlResourceType state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewGetFrameUrlResourceType page error:" + err);
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

    /**
     * @tc.name   testWebViewGetFrameUrlResourceType
     * @tc.number SUB_ACE_WEB_getFrameUrl_resourceType_API_0001
     * @tc.desc   test getFrameUrl getResourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetFrameUrlResourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewGetFrameUrlResourceType"
      Utils.emitEvent(emitKey, 124501);
      let isReturn = false;
      Utils.registerEvent("testWebViewGetFrameUrlResourceType", true, 124490, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewGetFrameUrlResourceType",driver)
      await waitForExist(() => isReturn, "emitWebViewGetFrameUrlResourceType", true, 1000);
      done();
    })
  })
}
