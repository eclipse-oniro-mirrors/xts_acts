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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import { commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
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
let mpEnable: string;

class MyRouterParam {
  constructor(from: string) {
    this.fromPage = from;
  }

  fromPage: string = "";
}

export default function UIExtensionContentSessionTest() {
  describe('UIExtensionContentSessionTest', () => {

    beforeAll(() => {
      context = globalThis.context
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0100
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0100
     * @tc.desc   : session.loadContent
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0100', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0100`;
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
              expect(data?.parameters?.result).assertEqual(401)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0200
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0200
     * @tc.desc   : session.loadContentByName
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0200', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0200`;
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
              expect(data?.parameters?.result).assertEqual(401)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0300
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0300
     * @tc.desc   : session.terminateSelfWithResult callback
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0300', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0300`;
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
              expect(data?.parameters?.result).assertEqual(401)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0400
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0400
     * @tc.desc   : session.terminateSelfWithResult promise
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0400', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0400`;
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
              expect(data?.parameters?.result).assertEqual(401)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0500
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0500
     * @tc.desc   : session.setWindowPrivacyMode promise
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0500', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0500`;
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
              expect(data?.parameters?.result).assertEqual(401)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0600
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0600
     * @tc.desc   : session.setWindowPrivacyMode callback
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0600', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0600`;
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
              expect(data?.parameters?.result).assertEqual(401)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0700
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0700
     * @tc.desc   : session.startAbilityByType callback
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0700', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0700`;
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
              expect(data?.parameters?.result).assertEqual(16000050)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0800
     * @tc.name   : Sub_UIExtensionContentSession_errorCode_0800
     * @tc.desc   : session.startAbilityByType promise
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('Sub_UIExtensionContentSession_errorCode_0800', Level.LEVEL0, (done: Function) => {
      let tag: string = `Sub_UIExtensionContentSession_errorCode_0800`;
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
              expect(data?.parameters?.result).assertEqual(16000050)
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            if (mpEnable == 'true') {
              try {
                router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/UIExtensionPage',
                  params: new MyRouterParam(tag)
                });
                console.info(tag, 'push page UIExtensionPage success');
              } catch (err) {
                console.info(tag, 'push page err,err is :', err);
              }
            } else if (mpEnable == 'false') {
              commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
            }
          }, 1000);
        })
    })
  })
}