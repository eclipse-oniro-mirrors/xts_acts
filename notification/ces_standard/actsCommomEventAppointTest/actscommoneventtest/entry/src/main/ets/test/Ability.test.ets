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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const TIMEOUT_ONE_SECOND = 1000;
const TIMEOUT_TWO_SECONDS = 2500;
const TIMEOUT_THREE_SECONDS = 3000;
const TIMEOUT_SEVEN_SECONDS = 7000;
const ERROR_CODE_ZERO = 0;

let ACTS_Event = {
  events: ['Acts_CommonEvent_Test'],
  publisherBundleName: 'com.example.commoneventfirstrely'
};

let ACTS_EventTest = {
  events: ['Acts_CommonEventTest'],
  publisherBundleName: 'com.example.commoneventtest'
};

let ACTS_EventInfo = {
  events: ['Acts_CommonEvent_Test'],
};

let ACTS_EventSame = {
  events: ['Acts_CommonEventSame_Test'],
  publisherBundleName: 'com.example.commoneventfirstrely'
};

export default function abilityTest() {
  describe('ActsCommonEventTest', function () {
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    afterEach(async function () {
      sleep(TIMEOUT_ONE_SECOND);
    })

    /*
     * @tc.number: Acts_CommonEventTest_0100
     * @tc.name: Support specifying app subscriptions for custom events.
     * @tc.desc: Verify that the specified PublisherBundlerName receives multiple events published by the specified
     *           publisher (testing the ability of the application itself, depending on the application ability).
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('Acts_CommonEventTest_0100', 0, async function (done) {
      let subscriber1;
      let subscriber2;
      let msg = {
        'Acts_CommonEvent_First': false, 'Acts_CommonEvent_Second': false
      };

      function subscribeCallBack(err, data) {
        console.info('====>Acts_CommonEventTest_0100 data: ' + JSON.stringify(data));
        if (data.event == 'Acts_CommonEvent_Test') {
          console.info('====>Acts_CommonEventTest_0100 data.event=====' + data.event);
          msg['Acts_CommonEvent_First'] = true;
        }
      }

      function subscribeTestCallBack(err, data) {
        console.info('====>Acts_CommonEventTest_0100 Test data: ' + JSON.stringify(data));
        if (data.event == 'Acts_CommonEventTest') {
          console.info('====>Acts_CommonEventTest_0100 Test data.event=====' + data.event);
          msg['Acts_CommonEvent_Second'] = true;
        }
      }

      commonEvent.createSubscriber(ACTS_Event).then((data) => {
        console.info('====>Acts_CommonEventTest_0100 Create Subscribe');
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log('====>publisherFirst_0100====>'+ JSON.stringify(SubscribeInfo.publisherBundleName));
          expect(SubscribeInfo.publisherBundleName).assertEqual('com.example.commoneventfirstrely');
          subscriber1 = data;
          commonEvent.subscribe(subscriber1, subscribeCallBack);
          let want = {
            'bundleName': 'com.example.commoneventfirstrely',
            'abilityName': 'EntryAbility',
            'action': 'Acts_CommonEventTest_0100'
          }
          setTimeout(() => {
            globalThis.abilityContext.startAbility(want, (error) => {
              console.info('Acts_CommonEventTest_0100 error.code = ' + error.code);
              expect(error.code).assertEqual(ERROR_CODE_ZERO);
            })
          }, TIMEOUT_ONE_SECOND)
        })
      })

      commonEvent.createSubscriber(ACTS_EventTest).then((data) => {
        console.info('====>Acts_CommonEventTest_0100 ACTS_EventTest Subscribe');
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.log('====>publisherSecond_0100====>' + JSON.stringify(SubscribeInfo.publisherBundleName));
          expect(SubscribeInfo.publisherBundleName).assertEqual('com.example.commoneventtest');
          subscriber2 = data;
          commonEvent.subscribe(subscriber2, subscribeTestCallBack);
          let want = {
            'bundleName': 'com.example.commoneventtest',
            'abilityName': 'TestAbilityOther',
            'moduleName': 'entry_test',
            'action': 'Acts_CommonEventTest_0100'
          }
          setTimeout(() => {
            globalThis.abilityContext.startAbility(want, (error) => {
              console.info('Acts_CommonEventTest_0100 TestAbilityOther error.code = ' + error.code);
              expect(error.code).assertEqual(ERROR_CODE_ZERO);
            })
          }, TIMEOUT_TWO_SECONDS)
        })
      })

      setTimeout(() => {
        if (msg['Acts_CommonEvent_First'] == true && msg['Acts_CommonEvent_Second'] == true) {
          commonEvent.unsubscribe(subscriber1);
          commonEvent.unsubscribe(subscriber2);
          done();
        }
      }, TIMEOUT_SEVEN_SECONDS)
    })

    /*
     * @tc.number: Acts_CommonEventTest_0200
     * @tc.name: Support specifying app subscriptions for custom events.
     * @tc.desc: Verify that multiple subscription objects subscribe to events, one of which specifies
     *           PublisherBundlerName, and successfully receives events published by non-specified publishers.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('Acts_CommonEventTest_0200', 0, async function (done) {
      let subscriber1;
      let subscriber2;
      let msg = {
        'Acts_CommonEvent_First': false, 'Acts_CommonEvent_Second': false
      };

      function subscribeCallBack(err, data) {
        console.info('====>Acts_CommonEventTest_0200 data: ' + JSON.stringify(data));
        if (data.event == 'Acts_CommonEvent_Test') {
          console.info('====>Acts_CommonEventTest_0200 data.event=====' + data.event);
          msg['Acts_CommonEvent_First'] = true;
        }
      }

      function subscribeDiffCallBack(err, data) {
        console.info('====>Acts_CommonEventTest_0200 Diff data: ' + JSON.stringify(data));
        if (data.event == 'Acts_CommonEvent_Test') {
          console.info('====>Acts_CommonEventTest_0200 Diff data.event=====' + data.event);
          msg['Acts_CommonEvent_Second'] = true;
        }
      }

      commonEvent.createSubscriber(ACTS_Event).then((data) => {
        console.info('====>Acts_CommonEventTest_0200 ACTS_Event Subscribe');
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log('====>publisherFirst_0200====>' + JSON.stringify(SubscribeInfo.publisherBundleName));
          expect(SubscribeInfo.publisherBundleName).assertEqual('com.example.commoneventfirstrely');
          subscriber1 = data;
          commonEvent.subscribe(subscriber1, subscribeDiffCallBack);
          let want = {
            'bundleName': 'com.example.commoneventfirstrely',
            'abilityName': 'EntryAbility',
            'action': 'Acts_CommonEventTest_0100'
          }
          setTimeout(() => {
            globalThis.abilityContext.startAbility(want, (error) => {
              console.info('Acts_CommonEventTest_0200 error.code = ' + error.code);
              expect(error.code).assertEqual(ERROR_CODE_ZERO);
            })
          }, TIMEOUT_ONE_SECOND)
        })
      })

      commonEvent.createSubscriber(ACTS_EventInfo).then((data) => {
        console.info('====>Acts_CommonEventTest_0200 ACTS_EventInfo Subscribe');
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log('====>publisherSecond_0200====>' + JSON.stringify(SubscribeInfo.publisherBundleName));
          expect(SubscribeInfo.publisherBundleName).assertEqual("");
          subscriber2 = data;
          commonEvent.subscribe(subscriber2, subscribeCallBack);
          let want = {
            'bundleName': 'com.example.commoneventsecondrely',
            'abilityName': 'EntryAbility',
            'action': 'Acts_CommonEventTest_0200'
          }
          setTimeout(() => {
            globalThis.abilityContext.startAbility(want, (error) => {
              console.info('Acts_CommonEventTest_0200 error.code = ' + error.code);
              expect(error.code).assertEqual(ERROR_CODE_ZERO);
            })
          }, TIMEOUT_TWO_SECONDS)
        })
      })

      setTimeout(() => {
        if (msg['Acts_CommonEvent_First'] == true && msg['Acts_CommonEvent_Second'] == true) {
          commonEvent.unsubscribe(subscriber1);
          commonEvent.unsubscribe(subscriber2);
          done();
        }
      }, TIMEOUT_SEVEN_SECONDS)
    })

    /*
     * @tc.number: Acts_CommonEventTest_0300
     * @tc.name: Support specifying app subscriptions for custom events.
     * @tc.desc: Verify that multiple subscription objects subscribe to events, specify multiple identical
     *           PublisherBundlerName, and successfully receive events published by the specified publisher.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('Acts_CommonEventTest_0300', 0, async function (done) {
      let subscriber1;
      let subscriber2;
      let msg = {
        'Acts_CommonEvent_First': false, 'Acts_CommonEvent_Second': false
      };

      function subscribeCallBack(err, data) {
        console.info('====>Acts_CommonEventTest_0300 data: ' + JSON.stringify(data));
        if (data.event == 'Acts_CommonEvent_Test') {
          console.info('====>Acts_CommonEventTest_0300 data.event=====' + data.event);
          msg['Acts_CommonEvent_First'] = true;
        }
      }

      function subscribeSameCallBack(err, data) {
        console.info('====>Acts_CommonEventTest_0300 Same data: ' + JSON.stringify(data));
        if (data.event == 'Acts_CommonEventSame_Test') {
          console.info('====>Acts_CommonEventTest_0300 Same data.event=====' + data.event);
          msg['Acts_CommonEvent_Second'] = true;
        }
      }

      commonEvent.createSubscriber(ACTS_EventSame).then((data) => {
        console.info('====>Acts_CommonEventTest_0300 ACTS_EventSame Subscribe');
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log('====>publisherFirst_0300====>' + JSON.stringify(SubscribeInfo.publisherBundleName));
          expect(SubscribeInfo.publisherBundleName).assertEqual('com.example.commoneventfirstrely');
          subscriber1 = data;
          commonEvent.subscribe(subscriber1, subscribeSameCallBack);
          let want = {
            'bundleName': 'com.example.commoneventfirstrely',
            'abilityName': 'OtherAbility',
            'action': 'Acts_CommonEventTest_0300'
          }
          setTimeout(() => {
            globalThis.abilityContext.startAbility(want, (error) => {
              console.info('Acts_CommonEventTest_0300 same error.code = ' + error.code);
              expect(error.code).assertEqual(ERROR_CODE_ZERO);
            })
          }, TIMEOUT_ONE_SECOND);
        })
      })

      commonEvent.createSubscriber(ACTS_EventInfo).then((data) => {
        console.info('====>Acts_CommonEventTest_0300 ACTS_EventInfo Subscribe');
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log('====>publisherSecond_0300====>' + JSON.stringify(SubscribeInfo.publisherBundleName));
          expect(SubscribeInfo.publisherBundleName).assertEqual("");
          subscriber2 = data;
          commonEvent.subscribe(subscriber2, subscribeCallBack);
          let want = {
            'bundleName': 'com.example.commoneventfirstrely',
            'abilityName': 'EntryAbility',
            'action': 'Acts_CommonEventTest_0100'
          }
          setTimeout(() => {
            globalThis.abilityContext.startAbility(want, (error) => {
              console.info('Acts_CommonEventTest_0300 error.code = ' + error.code);
              expect(error.code).assertEqual(ERROR_CODE_ZERO);
            })
          }, TIMEOUT_THREE_SECONDS)
        })
      })

      setTimeout(() => {
        if (msg['Acts_CommonEvent_First'] == true && msg['Acts_CommonEvent_Second'] == true) {
          commonEvent.unsubscribe(subscriber1);
          commonEvent.unsubscribe(subscriber2);
          done();
        }
      }, TIMEOUT_SEVEN_SECONDS)
    })
  })
}