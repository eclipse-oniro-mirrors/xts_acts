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
import { waitForComponent, waitAndClickComponent } from './WaitTest.test';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewAvoidArea() {
  describe('ActsAceWebViewAvoidArea', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewAvoidArea',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewAvoidArea state success ' + JSON.stringify(pages));
        if (!('webViewAvoidArea' == pages.name)) {
          console.info('get webViewAvoidArea state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewAvoidArea state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewAvoidArea page error:' + err);
      }
      await waitForComponent("webViewAvoidAreaButton");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })


    /**
     * @tc.name   testWebViewAvoidArea01
     * @tc.number SUB_ACE_WEB_AVOIDAREA_API_0001
     * @tc.desc   test onViewportFitChanged contain 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewAvoidArea01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewAvoidArea01'
      Utils.emitEvent(emitKey, 153550);
      Utils.registerEvent('testWebViewAvoidArea01', ViewportFit.CONTAINS, 153560, done);
      sendEventByKey('webViewAvoidAreaButton', 10, '');
    })
    /**
     * @tc.name   testWebViewAvoidArea02
     * @tc.number SUB_ACE_WEB_AVOIDAREA_API_0002
     * @tc.desc   test onViewportFitChanged auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewAvoidArea02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewAvoidArea02'
      Utils.emitEvent(emitKey, 153550);
      Utils.registerEvent("testWebViewAvoidArea02", ViewportFit.AUTO, 153570, done);
      sendEventByKey('webViewAvoidAreaButton', 10, '');
    })
    /**
     * @tc.name   testWebViewAvoidArea03
     * @tc.number SUB_ACE_WEB_AVOIDAREA_API_0003
     * @tc.desc   test onViewportFitChanged cover 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewAvoidArea03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewAvoidArea03'
      Utils.emitEvent(emitKey, 153550);
      Utils.registerEvent('testWebViewAvoidArea03', ViewportFit.COVER, 153580, done);
      sendEventByKey('webViewAvoidAreaButton', 10, '');
    })
    /**
     * @tc.name   testWebViewAvoidArea04
     * @tc.number SUB_ACE_WEB_AVOIDAREA_API_0004
     * @tc.desc   test onViewportFitChanged default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewAvoidArea04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewAvoidArea04'
      Utils.emitEvent(emitKey, 153550);
      Utils.registerEvent("testWebViewAvoidArea04", ViewportFit.AUTO, 153590, done);
      sendEventByKey('webViewAvoidAreaButton', 10, '');
    })

    /**
     * @tc.name   testWebViewAvoidAreaOther
     * @tc.number SUB_ACE_WEB_AVOIDAREA_API_0006
     * @tc.desc   test onAvoidAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewAvoidAreaOther', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewAvoidAreaOther'
      Utils.emitEvent(emitKey, 153550);
      Utils.registerEvent('testWebViewAvoidAreaOther', 'success', 153600, done);
      sendEventByKey('webViewAvoidAreaButton', 10, '');
    })
  })
}
