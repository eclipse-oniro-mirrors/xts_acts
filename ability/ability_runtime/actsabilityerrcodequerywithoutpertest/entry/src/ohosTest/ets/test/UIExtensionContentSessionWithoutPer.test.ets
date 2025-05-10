/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level } from '@ohos/hypium';
import { commonEventManager } from '@kit.BasicServicesKit';
import base, { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, common } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { bundleManager } from '@kit.AbilityKit';

let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_LOADCONTENT',
    'ACTS_TEST_IN_USER',
    'ACTS_TEST_IN_PROVIDER',
    'ACTS_TEST_TERMINATE',
    'ACTS_TEST_DESTROY']
};
let subscriber: commonEventManager.CommonEventSubscriber;
let context = getContext(this) as common.UIAbilityContext;

class MyRouterParam {
  constructor(from: string) {
    this.fromPage = from;
  }
  fromPage: string = "";
}

export default function UIExtensionContentSessionWithoutPerTest() {
  describe('UIExtensionContentSessionWithoutPerTest', () => {

    beforeAll(() => {
      context = globalThis.context
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0900
     * @tc.name   : session.startAbilityByType promise without permission
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('Sub_UIExtensionContentSession_errorCode_0900', Level.LEVEL0, (done: Function) => {
      let tag:string = `Sub_UIExtensionContentSession_errorCode_0900`;
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("subscribeCallBack success")
            if (data.event == 'ACTS_TEST_DESTROY') {
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            try {
              router.pushUrl({
                url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                params: new MyRouterParam(tag)
              });
              console.info(tag, 'push page UIExtensionPage success');
            } catch (err) {
              console.info(tag, 'push page err,err is :',err);
            }
          }, 2000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_1000
     * @tc.name   : session.startAbilityByType callback without permission
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('Sub_UIExtensionContentSession_errorCode_1000', Level.LEVEL0, (done: Function) => {
      let tag:string = `Sub_UIExtensionContentSession_errorCode_1000`;
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("subscribeCallBack success")
            if (data.event == 'ACTS_TEST_DESTROY') {
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            try {
              router.pushUrl({
                url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                params: new MyRouterParam(tag)
              });
              console.info(tag, 'push page UIExtensionPage success');
            } catch (err) {
              console.info(tag, 'push page err,err is :',err);
            }
          }, 2000);
        })
    })
  })
}