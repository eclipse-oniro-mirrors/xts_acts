/**
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
let emitKey = ''
const  driver = Driver.create();
export default function ActsAceWebViewSdkSchemeHandler2() {
  describe('ActsAceWebViewSdkSchemeHandler2', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandler2',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler2" == pages.name)) {
                console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandler state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandler page error:" + err);
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
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getHttpBodyStream_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getHttpBodyStream
     *@tc.desc test SdkSchemeHandler_getHttpBodyStream
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_getHttpBodyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getHttpBodyStream"
      Utils.emitEvent(emitKey, 142311);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getHttpBodyStream", true, 142370, done);
      Utils.waitAndClickComponent('webViewSdkSchemeHandler2',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /*
     *@tc.number SUB_ACE_WEB_SchemeHandler_getSize_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getSize
     *@tc.desc test SdkSchemeHandler_getSize
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_getSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getSize"
      Utils.emitEvent(emitKey, 142311);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getSize", true, 142380, done);
      Utils.waitAndClickComponent('webViewSdkSchemeHandler2',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getPosition_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getPosition
     *@tc.desc test SdkSchemeHandler_getPosition
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_getPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getPosition"
      Utils.emitEvent(emitKey, 10);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getPosition", true, 142390, done);
      Utils.waitAndClickComponent('webViewSdkSchemeHandler2',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isChunked_API_0001
     *@tc.name testWebViewSdkSchemeHandler_isChunked
     *@tc.desc test SdkSchemeHandler_isChunked
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_isChunked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isChunked"
      Utils.emitEvent(emitKey, 142311);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isChunked", true, 142400, done);
      Utils.waitAndClickComponent('webViewSdkSchemeHandler2',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isEof_API_0001
     *@tc.name testWebViewSdkSchemeHandler_isEof
     *@tc.desc test SdkSchemeHandler_isEof
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_isEof', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isEof"
      Utils.emitEvent(emitKey, 142311);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isEof", true, 142410, done);
      Utils.waitAndClickComponent('webViewSdkSchemeHandler2',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isInMemory_API_0001
     *@tc.name testWebViewSdkSchemeHandler_isInMemory
     *@tc.desc test SdkSchemeHandler_isInMemory
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_isInMemory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isInMemory"
      Utils.emitEvent(emitKey, 142311);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isInMemory", true, 142420, done);
      Utils.waitAndClickComponent('webViewSdkSchemeHandler2',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
  })
}
