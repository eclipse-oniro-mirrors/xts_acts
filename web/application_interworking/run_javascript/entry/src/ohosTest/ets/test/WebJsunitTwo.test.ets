/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest.test';

export default function webJsunitTwo() {
  describe('webJsunitTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webTwo state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webTwo state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push webTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webTwo page error: " + err);
      }
      await waitForComponent("webcomponent");
      done()
    });
    afterEach(async (done: Function) => {
      console.info("web afterEach start:");
      done();
    })
    /**
     * @tc.name   getLineNumber
     * @tc.number SUB_ACE_BASIC_ETS_API_076
     * @tc.desc   getLineNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLineNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnConsoleTwo", 171310)
      Utils.registerEvent("getLineNumber", "44", 171320, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getSourceId
     * @tc.number SUB_ACE_BASIC_ETS_API_077
     * @tc.desc   getSourceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSourceId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnConsoleTwo", 171310)
      Utils.registerEvent("getSourceId", "resource://rawfile/index.html", 171330, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}