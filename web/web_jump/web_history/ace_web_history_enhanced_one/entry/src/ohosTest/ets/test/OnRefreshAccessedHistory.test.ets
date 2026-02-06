/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function onRefreshAccessedHistoryTest() {

  describe('onRefreshAccessedHistoryTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/OnRefreshAccessedHistory',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnRefreshAccessedHistory state success " + JSON.stringify(pages));
        if (!("OnRefreshAccessedHistory" == pages.name)) {
          console.info("get OnRefreshAccessedHistory state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push OnRefreshAccessedHistory page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnRefreshAccessedHistory page error: " + err);
      }
      await waitForComponent("OnRefreshAccessedHistoryButton");
      done()
    });

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
      console.info("OnRefreshAccessedHistory afterEach start");
      done();
    })


    /**
     * @tc.name   testOnRefreshAccessedHistoryEnhanced001
     * @tc.number SUB_WEB_ONREFRESHACCESSEDHISTORY_ISMAINFRAME_0100
     * @tc.desc   test onRefreshAccessedHistory isMainFrame true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEnhanced001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnRefreshAccessedHistoryEnhanced001", 141)
      Utils.registerBaseEvent("testOnRefreshAccessedHistoryEnhanced001", true, 25112101, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnRefreshAccessedHistoryButton', 10, '');
    })
    /**
     * @tc.name   testOnRefreshAccessedHistoryEnhanced002
     * @tc.number SUB_WEB_ONREFRESHACCESSEDHISTORY_ISMAINFRAME_0200
     * @tc.desc   test onRefreshAccessedHistory isMainFrame false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEnhanced002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnRefreshAccessedHistoryEnhanced002", 141)
      Utils.registerBaseEvent("testOnRefreshAccessedHistoryEnhanced002", false, 25112102, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnRefreshAccessedHistoryButton', 10, '');
    })
    /**
     * @tc.name   testOnRefreshAccessedHistoryEnhanced003
     * @tc.number SUB_WEB_ONREFRESHACCESSEDHISTORY_ISMAINFRAME_0300
     * @tc.desc   test refresh onRefreshAccessedHistory isMainFrame true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEnhanced003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnRefreshAccessedHistoryEnhanced003", 141)
      Utils.registerBaseEvent("testOnRefreshAccessedHistoryEnhanced003", true, 25112103, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnRefreshAccessedHistoryButton', 10, '');
    })
    /**
     * @tc.name   testOnRefreshAccessedHistoryEnhanced004
     * @tc.number SUB_WEB_ONREFRESHACCESSEDHISTORY_ISMAINFRAME_0400
     * @tc.desc   test refresh onRefreshAccessedHistory isMainFrame false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEnhanced004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnRefreshAccessedHistoryEnhanced004", 141)
      Utils.registerBaseEvent("testOnRefreshAccessedHistoryEnhanced004", false, 25112104, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnRefreshAccessedHistoryButton', 10, '');
    })


  })
}
