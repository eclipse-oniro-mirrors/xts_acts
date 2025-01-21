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
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

export default function stageRouterTest() {
  describe('stageRouterTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stageRouter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageRouter state success " + JSON.stringify(pages));
        if (!("stageRouter" == pages.name)) {
          console.info("get stageRouter state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push stageRouter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageRouter page error: " + err);
      }
      done()
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('testrouterstage0001', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0001 START');
      let result: ESObject;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/pushUrlasync.ets',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }
      try {
        result = router.pushUrl(options)
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0001 END');
      done();
    });

    it('testrouterstage0002', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0002 START');
      let result: ESObject;
      try {
        result = router.pushUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        }, (err: BusinessError) => {
          if (err) {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('pushUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0002 END');
      done();
    });


    it('testrouterstage0003', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0003 START');
      let result: ESObject;
      try {
        result = router.pushUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        }, router.RouterMode.Standard)
          .then(() => {
          })
          .catch(err => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0003 END');
      done();
    });

    it('testrouterstage0004', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0004 START');
      let result: ESObject;
      try {
        result = router.pushUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        }, router.RouterMode.Standard)
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0004 END');
      done();
    });

    it('testrouterstage0005', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0005 START');
      let result: ESObject;
      try {
        result = router.replaceUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message'
          }
        })
          .then(() => {
          })
          .catch((err: BusinessError) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0005 END');
      done();
    });

    it('testrouterstage0006', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0006 START');
      let result: ESObject;
      try {
        result = router.replaceUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message'
          }
        }, (err: BusinessError) => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0006 END');
      done();
    });

    it('testrouterstage0007', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0007 START');
      let result: ESObject;
      try {
        result = router.replaceUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message'
          }
        }, router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: BusinessError) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0007 END');
      done();
    });

    it('testrouterstage0008', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0008 START');
      let result: ESObject;
      try {
        result = router.replaceUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message'
          }
        }, router.RouterMode.Standard, (err) => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0008 END');
      done();
    });

    it('testrouterstage0009', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0009 START');
      let result: ESObject;
      try {
        result = router.back({
          url: 'MainAbility/pages/pushUrlasync.ets'
        })
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0009 END');
      done();
    });

    it('testrouterstage0010', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0010 START');
      let result: ESObject;
      try {
        result = router.clear()
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0010 END');
      done();
    });

    it('testrouterstage0011', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0011 START');
      let result: ESObject;
      try {
        result = router.getLength()
        expect(typeof (result)).assertEqual('string');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0011 END');
      done();
    });

    it('testrouterstage0012', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0012 START');
      let result: ESObject;
      try {
        result = router.getState()
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0012 END');
      done();
    });

    it('testrouterstage0013', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0013 START');
      let result: ESObject;
      try {
        result = router.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0013 END');
      done();
    });

    it('testrouterstage0014', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0014 START');
      let result: ESObject;
      try {
        result = router.hideAlertBeforeBackPage()
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0014 END');
      done();
    });

    it('testrouterstage0015', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0015 START');
      let result: ESObject;
      try {
        result = router.getParams()
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0015 END');
      done();
    });

    it('testrouterstage0016', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0016 START');
      let result: ESObject;
      try {
        result = router.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        })
          .then(() => {
          })
          .catch((err: BusinessError) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0016 END');
      done();
    });

    it('testrouterstage0017', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0017 START');
      let result: ESObject;
      try {
        result = router.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        }, (err: BusinessError) => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0017 END');
      done();
    });

    it('testrouterstage0018', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0018 START');
      let result: ESObject;
      try {
        result = router.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        }, router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: BusinessError) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0018 END');
      done();
    });

    it('testrouterstage0019', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0019 START');
      let result: ESObject;
      try {
        result = router.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
        }, router.RouterMode.Standard, (err: BusinessError) => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0019 END');
      done();
    });

    it('testrouterstage0020', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0020 START');
      let result: ESObject;
      try {
        result = router.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          }
        })
          .then(() => {
          })
          .catch((err: BusinessError) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0020 END');
      done();
    });

    it('testrouterstage0021', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0021 START');
      let result: ESObject;
      try {
        result = router.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          }
        }, (err: BusinessError) => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0021 END');
      done();
    });

    it('testrouterstage0022', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0022 START');
      let result: ESObject;
      try {
        result = router.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          }
        }, router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: BusinessError) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0022 END');
      done();
    });

    it('testrouterstage0023', 0, async (done: Function) => {
      let router: ESObject = globalThis.uiContent.getRouter();
      console.info('testrouterstage0023 START');
      let result: ESObject;
      try {
        result = router.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          }
        }, router.RouterMode.Standard, (err: BusinessError) => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0023 END');
      done();
    });


  })
}