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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import router from '@ohos.router';

let TAG: string = 'testTag';
let unSubscribeCb: () => void = () => {
  hilog.info(0x0000, TAG, '%{public}s', 'unSubscribeCb');
}
let publishCb: (err: BusinessError) => void = (err: BusinessError) => {
  if (err) {
    hilog.info(0x0000, TAG, 'publish failed %{public}s', JSON.stringify(err));
  } else {
    hilog.info(0x0000, TAG, '%{public}s', 'publish success');
  }
}

export default function uiExtContentSessionTest() {
  describe('ActsUIExtContentSessionTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll');
    })
    beforeEach(() => {
      let TAG: string = 'testTag';
      hilog.info(0x0000, TAG, '%{public}s', 'beforeEach');
    })
    afterEach((done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterEach start');
      setTimeout(()=>{
        hilog.info(0x0000, TAG, '%{public}s', 'afterEach done');
        done();
      }, 1000)
    })
    afterAll(() => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll');
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0100
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0100', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0100';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0100: string = 'UIExtension_LoadContent_Test0100';
      let UI_EXTENSION_LOAD_CONTENT_TEST0100_RET: string = 'UIExtension_LoadContent_Test0100_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0100_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0100, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0100_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0100 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(401);
            expect(data.parameters?.testCaseResultMsg).assertEqual('Parameter error: name must be a string');
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0200
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0200', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0200';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0200: string = 'UIExtension_LoadContent_Test0200';
      let UI_EXTENSION_LOAD_CONTENT_TEST0200_RET: string = 'UIExtension_LoadContent_Test0200_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0200_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0200, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0200_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0200 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(401);
            expect(data.parameters?.testCaseResultMsg).assertEqual('Parameter error: name must be a string');
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0300
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0300', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0300';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0300: string = 'UIExtension_LoadContent_Test0300';
      let UI_EXTENSION_LOAD_CONTENT_TEST0300_RET: string = 'UIExtension_LoadContent_Test0300_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0300_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0300, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0300_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0300 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(401);
            expect(data.parameters?.testCaseResultMsg).assertEqual('Parameter error: storage must be a object');
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0400
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0400', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0400';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0400: string = 'UIExtension_LoadContent_Test0400';
      let UI_EXTENSION_LOAD_CONTENT_TEST0400_RET: string = 'UIExtension_LoadContent_Test0400_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0400_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0400, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0400_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0400 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(401);
            expect(data.parameters?.testCaseResultMsg).assertEqual('Parameter error: storage must be a object');
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0500
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0500', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0500';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0500: string = 'UIExtension_LoadContent_Test0500';
      let UI_EXTENSION_LOAD_CONTENT_TEST0500_RET: string = 'UIExtension_LoadContent_Test0500_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0500_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0500, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0500_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0500 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(true);
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0600
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0600', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0600';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0600: string = 'UIExtension_LoadContent_Test0600';
      let UI_EXTENSION_LOAD_CONTENT_TEST0600_RET: string = 'UIExtension_LoadContent_Test0600_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0600_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail ();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0600, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0600_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0600 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(true);
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0700
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0700', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0700';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0700: string = 'UIExtension_LoadContent_Test0700';
      let UI_EXTENSION_LOAD_CONTENT_TEST0700_RET: string = 'UIExtension_LoadContent_Test0700_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0700_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0700, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0700_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0700 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(true);
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0800
     * @tc.name: LoadContentByName
     * @tc.desc: Test load content by name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_0800', 0, async (done: Function) => {
      TAG = 'LoadContentByName_0800';
      hilog.info(0x0000, TAG, '%{public}s', 'it begin');
      let UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
      let UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';
      let UI_EXTENSION_LOAD_CONTENT_TEST0800: string = 'UIExtension_LoadContent_Test0800';
      let UI_EXTENSION_LOAD_CONTENT_TEST0800_RET: string = 'UIExtension_LoadContent_Test0800_ret';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [UI_EXTENSION_PAGE5_ON_READY, UI_EXTENSION_PAGE5_ON_ERROR, UI_EXTENSION_LOAD_CONTENT_TEST0800_RET]
      };

      // subscribe callback
      let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
        (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_ERROR) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onError callback %{public}s', JSON.stringify(data));
            expect().assertFail();
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          } else if (data.event === UI_EXTENSION_PAGE5_ON_READY) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume onReady callback %{public}s', JSON.stringify(data));
            expect(true).assertTrue();
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0800, publishCb);
          } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0800_RET) {
            hilog.info(0x0000, TAG, 'subscribe success, Consume 0800 callback %{public}s', JSON.stringify(data));
            expect(data.parameters?.testCaseResultCode).assertEqual(true);
            commonEventManager.unsubscribe(subscriber, unSubscribeCb);
            router.back();
            done();
          }
        }

      // Create subscriber and subscribe
      await commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCb);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
        });

      try {
        await router.pushUrl({
          url: 'TestAbility/pages/p5'
        });
        hilog.info(0x0000, TAG, '%{public}s', 'push page success');
      } catch (err) {
        hilog.info(0x0000, TAG, 'push page result: %{public}s', JSON.stringify(err));
      }
    })
  })
}
