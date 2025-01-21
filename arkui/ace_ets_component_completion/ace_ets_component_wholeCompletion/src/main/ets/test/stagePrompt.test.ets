/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';

export default function stagePrompt() {
  describe('stagePrompt', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/stagePrompt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stagePrompt state success " + JSON.stringify(pages));
        if (!("stagePrompt" == pages.name)) {
          console.info("get stagePrompt state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push stagePrompt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stagePrompt page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
   it('testPromptActionShowToast001', 0, async function (done) {
      console.info('testPromptActionShowToast001 START');
        try{
          var innerEventOne = {
            eventId: 60220,
            priority: events_emitter.EventPriority.LOW
          }
          var callback1 = (eventData) => {
            console.info("testPromptActionShowToast001 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testPromptActionShowToast001 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showToastText', 10, "")));
          console.info('testPromptActionShowToast001 END ');
        } catch(err) {
          expect().assertFail()
          console.info('testPromptActionShowToast001 ERR  '+ JSON.stringify(err));
        }
        done();
    });

    it('testPromptActionShowToast002', 0, async function (done) {
      console.info('testPromptActionShowToast002 START');
        try{
          var innerEventTwo = {
          eventId: 60221,
          priority: events_emitter.EventPriority.LOW
        }
          var callback1 = (eventData) => {
            console.info("testPromptActionShowToast002 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testPromptActionShowToast002 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testPromptActionShowToast002 END ');
        } catch(err) {
          expect().assertFail()
          console.info('testPromptActionShowToast002 ERR  '+ JSON.stringify(err));
        }
        done();
    });
    it('testPromptActionShowToast003', 0, async function (done) {
      console.info('testPromptActionShowToast003 START');
        try{
          var innerEventThree = {
            eventId: 60222,
            priority: events_emitter.EventPriority.LOW
          }
          var callback1 = (eventData) => {
            console.info("testPromptActionShowToast003 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testPromptActionShowToast003 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testPromptActionShowToast003 END ');
        } catch(err) {
          expect().assertFail()
          console.info('testPromptActionShowToast003 ERR  '+ JSON.stringify(err));
        }
        done();
    });
    it('testPromptActionShowToast004', 0, async function (done) {
      console.info('testPromptActionShowToast004 START');
        try{
          var innerEventFour = {
            eventId: 60223,
            priority: events_emitter.EventPriority.LOW
          }
          var callback1 = (eventData) => {
            console.info("testPromptActionShowToast004 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventFour, callback1);
          } catch (err) {
            console.info("testPromptActionShowToast004 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testPromptActionShowToast004 END ');
        } catch(err) {
          expect().assertFail()
          console.info('testPromptActionShowToast004 ERR  '+ JSON.stringify(err));
        }
        done();
    });
    it('testPromptActionShowToast005', 0, async function (done) {
      console.info('testPromptActionShowToast005 START');
        try{
          var innerEventFive = {
            eventId: 60224,
            priority: events_emitter.EventPriority.LOW
          }
          var callback1 = (eventData) => {
            console.info("testPromptActionShowToast005 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventFive, callback1);
          } catch (err) {
            console.info("testPromptActionShowToast005 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testPromptActionShowToast005 END ');
        } catch(err) {
          expect().assertFail()
          console.info('testPromptActionShowToast005  ERR  '+ JSON.stringify(err));
        }
        done();
    });
  })
}