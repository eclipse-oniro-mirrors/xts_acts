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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
import { waitAndClickComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerResumeAllTimers() {

 describe('webViewControllerResumeAllTimers', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerResumeAllTimers',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerResumeAllTimers state success " + JSON.stringify(pages));
        if (!("webViewControllerResumeAllTimers" == pages.name)) {
          console.info("get WebViewControllerResumeAllTimers state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerResumeAllTimers page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerResumeAllTimers page error: " + err);
      }
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

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0100
    * @tc.name       : testResumeAllTimers001
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
      it('resumeAllTimers0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0100", 132680)
      Utils.registerBaseEvent("resumeAllTimers0100", true, 132690, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0200
    * @tc.name       : testResumeAllTimers002
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0200", 132680)
      Utils.registerBaseEvent("resumeAllTimers0200", true, 132700, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0300
    * @tc.name       : testResumeAllTimers003
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0300", 132680)
      Utils.registerBaseEvent("resumeAllTimers0300", true, 132710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0400
    * @tc.name       : testResumeAllTimers004
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0400", 132680)
      Utils.registerBaseEvent("resumeAllTimers0400", true, 132720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0500
    * @tc.name       : testResumeAllTimers005
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0500", 132680)
      Utils.registerBaseEvent("resumeAllTimers0500", true, 132730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0600
    * @tc.name       : testResumeAllTimers006
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('resumeAllTimers0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0600", 132680)
      Utils.registerBaseEvent("resumeAllTimers0600", true, 132740, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0700
    * @tc.name       : testResumeAllTimers007
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('resumeAllTimers0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0700", 132680)
      Utils.registerBaseEvent("resumeAllTimers0700", true, 132750, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('WebViewControllerResumeAllTimers');
    })
  })
}
