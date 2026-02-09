/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { common, OpenLinkOptions, wantConstant } from '@kit.AbilityKit';
import base from '@ohos.base';

let invalidParamErrNo = 401;
let link = 'example1://www.example1.com';
let context = getContext(this) as common.UIAbilityContext;;
let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_OPENLINK', 'ACTS_TEST_DESTROY']
};
let openLinkOptions: OpenLinkOptions = {
  appLinkingOnly: true,
  parameters: {
    keyString: 'str',
    keyNumber: 200,
    keyObj: {
      keyObjKey: 'objValue',
    }
  }
};
let openLinkOptionsFalse: OpenLinkOptions = {
  appLinkingOnly: false,
  parameters: {
    keyString: 'str',
    keyNumber: 200,
    keyObj: {
      keyObjKey: 'objValue',
    }
  }
};
let openLinkOptionsOnlyParam: OpenLinkOptions = {
  parameters: {
    keyString: 'str',
    keyNumber: 200,
    keyObj: {
      keyObjKey: 'objValue',
    }
  }
};
let openLinkOptionsService: OpenLinkOptions = {
  appLinkingOnly: true,
};
let subscriber: commonEventManager.CommonEventSubscriber;

function publishCB(err: BusinessError) {
  if (err) {
    console.error(`Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    console.info('====>publish ACTS_TEST_OPENLINK');
    console.info(`Succeeded in publishing common event.`);
  }
}

export default function startAbilityOpenLink() {
  describe('startAbilityOpenLink', () => {
    beforeAll(() => {
      context = globalThis.context
    });
    afterEach((done: Function) => {
      console.log('OpenLink afterEach start');
      setTimeout(() => {
        console.log('OpenLink afterEach end');
        done();
      }, 1000);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0400', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0400`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example2.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                try {
                  context.openLink(link)
                    .catch((error: BusinessError) => {
                      console.info(`${tag} open link err : ${error}`);
                      expect().assertFail();
                      done();
                    })
                } catch (err) {
                  console.info(`${tag} open fail : ${err}`);
                  expect().assertFail();
                  done();
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500`;
      link = 'https://123.1.1.1'
      console.log(`${tag}, it begin`);
      try {
        context.openLink(link).then(() => {
          console.info(`#${tag}# open link successful`);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# open link err : ${error}`);
          console.info(`#${tag}# open link error.code : ${error.code}`);
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect(err.code).assertEqual(16000019);
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(undefined)
          .catch((error: BusinessError) => {
            console.info(`#${tag}# open link err : ${error}`);
            done();
          })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect(err.code).assertEqual(invalidParamErrNo);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(null)
          .catch((error: BusinessError) => {
            console.info(`#${tag}# open link err : ${error}`);
            done();
          })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect(err.code).assertEqual(invalidParamErrNo);
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800`;
      link = 'xxxxx://'
      console.log(`${tag}, it begin`);
      try {
        context.openLink(link).then((result) => {
            console.info(`#${tag}# open link successful`);
            expect().assertFail();
            done();
          }).catch((error: BusinessError) => {
            console.info(`#${tag}# open link err : ${error}`);
            expect(error.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900`;
      console.log(`${tag}, it begin`);
      try {
        context.openLink('test')
          .catch((error: BusinessError) => {
            console.info(`#${tag}# open link err : ${error}`);
          })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect(err.code).assertEqual(invalidParamErrNo);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1000', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1000`;
      console.log(`${tag}, it begin`);
      link = 'example1://www.example1.com';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                try {
                  context.openLink(link, {
                    appLinkingOnly: false
                  })
                    .catch((error: BusinessError) => {
                      console.info(`#${tag}# open link err : ${error}`);
                    })
                } catch (err) {
                  console.info(`#${tag}# open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1100', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1100`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example13.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, {
                  appLinkingOnly: true
                }, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1200', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1200`;
      console.log(`${tag}, it begin`);
      link = 'https://test'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, {
                  appLinkingOnly: true
                }, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1300
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1300', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1300`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example6.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptionsService, (err, data) => {
                  console.log(tag, 'open link success. Callback result:', JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1400', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1400`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example7.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptionsService, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1500', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1500`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example10.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptions, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1600', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1600`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example9.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptionsFalse, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect().assertFail();
                    done();
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1700', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1700`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example8.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, {
                  appLinkingOnly: false
                }, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect().assertFail();
                    done();
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1800', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1800`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example11.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptionsOnlyParam, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect().assertFail();
                    done();
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1900', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_1900`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example12.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, undefined, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect().assertFail();
                    done();
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2000', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2000`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example20.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, null, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    // commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                    expect().assertFail();
                    done();
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2100', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2100`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example21.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, {}, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect().assertFail();
                    done();
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2200', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2200`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example4.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptions, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                  checkAbilityResultWithParams(data, done)
                })
                  .then(() => {
                    console.log(tag, `open link success`);
                  })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2300
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2300', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2300`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example5.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptions, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                  checkAbilityResultWithoutParams(data, done)
                })
                  .then(() => {
                    console.log(tag, `open link success`);
                  })
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2400', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2400`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example3.com'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              context.openLink(link, openLinkOptions, (err, data) => {
                console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
              })
                .then(() => undefined)
                .catch((err: BusinessError) => {
                  console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                  expect(err.code).assertEqual(16000019);
                  commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                })
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2900', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_2900`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example14.com'
      let want: Want = {
        uri: link,
        parameters: {
          appLinkingOnly: true,
          demo_key: "demo_value",
          demo_num: 111
        }
      }
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.startAbility(want, (err: BusinessError) => {
                  if (err.code) {
                    console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  }
                })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example15.com'
      let want: Want = {
        uri: link,
        parameters: {
          appLinkingOnly: false,
          demo_key: "demo_value",
          demo_num: 111
        }
      }
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.startAbility(want, (err: BusinessError) => {
                  if (err.code) {
                    console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  }
                })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example16.com'
      let want: Want = {
        uri: link,
        parameters: {
          appLinkingOnly: true
        }
      }
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.startAbilityForResult(want).then((data: common.AbilityResult) => {
                  console.info(`${tag} start startAbilityForResult=====>` + JSON.stringify(data));
                  commonEventManager.publish('ACTS_TEST_DESTROY', ()=> {
                    console.info(`${tag} publish ACTS_TEST_DESTROY`);
                  })
                }).catch((err: BusinessError) => {
                  console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
                  expect(err.code).assertEqual(16000019);
                  commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3200', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3200`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example16.com'
      let want: Want = {
        uri: link,
        parameters: {
          appLinkingOnly: false
        }
      }
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.startAbilityForResult(want).then((data: common.AbilityResult) => {
                  console.info(`${tag} start startAbilityForResult=====>` + JSON.stringify(data));
                  expect(data.resultCode).assertEqual(100)
                  if(data.want){
                    if(data.want.parameters){
                      if(data.want.parameters.key){
                        expect(data.want.parameters.key).assertEqual(123)
                        commonEventManager.publish('ACTS_TEST_DESTROY', ()=> {
                          console.info(`${tag} publish ACTS_TEST_DESTROY`);
                        })
                      }
                    }
                  }
                }).catch((err: BusinessError) => {
                  console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
                })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3900', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3900`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example17.com'
      let openLinkOptions: OpenLinkOptions = {
        appLinkingOnly: true,
        parameters: {
          "ohos.extra.param.key.showMode":1,
          "ohos.aafwk.param.callerBundleName":"xxx"
        }
      };
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.openLink(link, openLinkOptions, (err, data) => {
                  console.log(tag, 'open link success. Callback result:' + JSON.stringify(data));
                })
                  .then(() => undefined)
                  .catch((err: BusinessError) => {
                    console.log(tag, `open link failed. Code is ${err.code}, message is ${err.message}`);
                    expect(err.code).assertEqual(16000019);
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500', 0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500`;
      console.log(`${tag}, it begin`);
      link = 'https://www.example00.com'
      let want: Want = {
        uri: link,
        parameters: {
          appLinkingOnly: true
        }
      }
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              setTimeout(() => {
                context.startAbilityForResult(want).then((data: common.AbilityResult) => {
                  console.info(`${tag} start startAbilityForResult=====>` + JSON.stringify(data));
                  commonEventManager.publish('ACTS_TEST_DESTROY', ()=> {
                    console.info(`${tag} publish ACTS_TEST_DESTROY`);
                  })
                }).catch((err: BusinessError) => {
                  console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
                  expect(err.code).assertEqual(16000019);
                  commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                })
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    });
  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

function checkAbilityResultWithParams(data: common.AbilityResult, done: Function) {
  if (data.want) {
    expect(data.resultCode).assertEqual(100)
    if (data.want.parameters) {
      expect(data.want.parameters.keyNumber).assertEqual(200)
      expect(data.want.parameters.keyString).assertEqual('str')
      if (data.want.parameters.keyObj) {
        expect(JSON.stringify(data.want.parameters.keyObj)).assertEqual('{"keyObjKey":"objValue"}')
        done();
      }
    }
  }
}

function checkAbilityResultWithoutParams(data: common.AbilityResult, done: Function) {
  if (data.want) {
    expect(data.resultCode).assertEqual(-1)
    if (data.want) {
      expect(data.want.bundleName).assertEqual('')
      expect(JSON.stringify(data.want.parameters)).assertEqual('{}')
      done();
    }
  }
}