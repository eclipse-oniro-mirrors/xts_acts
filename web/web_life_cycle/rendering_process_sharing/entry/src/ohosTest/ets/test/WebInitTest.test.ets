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
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebInitTest afterEach end");
      done();
    })


    /*
     *@tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0003
     *@tc.name testWebViewGetRenderProcessModeMultiple
     *@tc.desc test getRenderProcessMode MULTIPLE 1
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewGetRenderProcessModeMultiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetAndSetRenderProcessMode03", 10);
      Utils.registerEvent("testWebViewGetRenderProcessModeMultiple", 'success', 62904, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0004
     *@tc.name testWebViewSetRenderProcessNull
     *@tc.desc test setRenderProcessMode null
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewSetRenderProcessNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewGetAndSetRenderProcessMode04', 10);
      Utils.registerEvent('testWebViewSetRenderProcessNull', 'success', 62905, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /*
    * @tc.number      : SUB_ACE_WEB_OnRenderProcessResponding_API_GROUP_0001
    * @tc.name        : testWebViewOnRenderProcessRespondingGroup
    * @tc.desc        : OnRenderProcessResponding
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebViewOnRenderProcessRespondingGroup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnRenderProcessResponding", 10);
      Utils.registerBaseEvent("testWebViewOnRenderProcessResponding", true, 1336,
        done, (backData: emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /*
    * @tc.number      : SUB_ACE_WEB_NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT_API_GROUP_0002
    * @tc.name        : testWebViewNotRespondingReasonGroup_NAVIGATION_COMMIT_TIMEOUT
    * @tc.desc        : NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebViewNotRespondingReasonGroup_NAVIGATION_COMMIT_TIMEOUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT", 10);
      Utils.registerBaseEvent("testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT", true, 1338,
        done, (backData: emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebInitTestButton', 10, '');
    })
  })
}
