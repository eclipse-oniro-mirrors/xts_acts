'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
interface Data2 {
  data3: int[]
}
interface Param {
  data1: string,
  data2: Data2
}
interface Param1 {
  data1: string
}
export default function stageRouterTest() {
  describe('stageRouterTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stageRouter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stageRouter state success " + JSON.stringify(pages));
        if (!("stageRouter" == pages.name)) {
          console.info("get stageRouter state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push stageRouter page error: " + err);
      }
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

    
/**
     * @tc.number   testrouterstage0001_static
     * @tc.name     testrouterstage0001_static
     * @tc.desc     testrouterstage0001_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0001_static START');
      let result: Promise<void> = Promise.resolve();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/pushUrlasync',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as Param
      }
      try {
        result = routerPush.pushUrl(options)
        // expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        expect().assertFail();
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0001_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0002_static
     * @tc.name     testrouterstage0002_static
     * @tc.desc     testrouterstage0002_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0002_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0002_static START');
      try {
        routerPush.pushUrl({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        }, (err: BusinessError | null) => {
          if (err) {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          }
          console.info('pushUrl success');
        });
      } catch (err) {
        expect().assertFail();
      }
      console.info('testrouterstage0002_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0003_static
     * @tc.name     testrouterstage0003_static
     * @tc.desc     testrouterstage0003_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0003_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0003_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.pushUrl(({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        } as router.RouterOptions), router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0003_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0004_static
     * @tc.name     testrouterstage0004_static
     * @tc.desc     testrouterstage0004_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0004_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0004_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.pushUrl({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        } as router.RouterOptions, router.RouterMode.Standard)
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0004_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0005_static
     * @tc.name     testrouterstage0005_static
     * @tc.desc     testrouterstage0005_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0005_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0005_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.replaceUrl({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message'
          } as Param1
        } as router.RouterOptions)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0005_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0006_static
     * @tc.name     testrouterstage0006_static
     * @tc.desc     testrouterstage0006_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0006_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0006_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.replaceUrl({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message'
          } as Param1
        } as router.RouterOptions, (err: BusinessError<void>|null): void => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0006_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0007_static
     * @tc.name     testrouterstage0007_static
     * @tc.desc     testrouterstage0007_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0007_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0007_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.replaceUrl({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message'
          } as Param1
        } as router.RouterOptions, router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0007_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0008_static
     * @tc.name     testrouterstage0008_static
     * @tc.desc     testrouterstage0008_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0008_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0008_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.replaceUrl({
          url: 'MainAbility/pages/Router/pushUrlasync',
          params: {
            data1: 'message'
          } as Param1
        } as router.RouterOptions, router.RouterMode.Standard, (err: BusinessError<void>|null): void => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        })
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0008_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0009_static
     * @tc.name     testrouterstage0009_static
     * @tc.desc     testrouterstage0009_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0009_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0009_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.back({
          url: 'MainAbility/pages/Router/pushUrlasync'
        })
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0009_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0010_static
     * @tc.name     testrouterstage0010_static
     * @tc.desc     testrouterstage0010_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0010_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0010_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.clear()
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0010_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0011_static
     * @tc.name     testrouterstage0011_static
     * @tc.desc     testrouterstage0011_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0011_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0011_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.getLength()
        // expect(typeof (result)).assertEqual('string');
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0011_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0012_static
     * @tc.name     testrouterstage0012_static
     * @tc.desc     testrouterstage0012_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0012_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0012_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.getState()
        // expect(typeof (result)).assertEqual('object');
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0012_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0013_static
     * @tc.name     testrouterstage0013_static
     * @tc.desc     testrouterstage0013_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0013_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0013_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        expect().assertFail()
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0013_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0014_static
     * @tc.name     testrouterstage0014_static
     * @tc.desc     testrouterstage0014_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0014_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0014_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.hideAlertBeforeBackPage()
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0014_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0015_static
     * @tc.name     testrouterstage0015_static
     * @tc.desc     testrouterstage0015_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0015_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0015_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.getParams()
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0015_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0016_static
     * @tc.name     testrouterstage0016_static
     * @tc.desc     testrouterstage0016_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0016_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0016_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        } as router.NamedRouterOptions)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0016_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0017_static
     * @tc.name     testrouterstage0017_static
     * @tc.desc     testrouterstage0017_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0017_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0017_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        } as router.NamedRouterOptions, (err: BusinessError<void>|null): void => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0017_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0018_static
     * @tc.name     testrouterstage0018_static
     * @tc.desc     testrouterstage0018_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0018_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0018_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        } as router.NamedRouterOptions, router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0018_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0019_static
     * @tc.name     testrouterstage0019_static
     * @tc.desc     testrouterstage0019_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0019_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0019_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.pushNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as Param
        } as router.NamedRouterOptions, router.RouterMode.Standard, (err: BusinessError<void>|null): void => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0019_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0020_static
     * @tc.name     testrouterstage0020_static
     * @tc.desc     testrouterstage0020_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0020_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0020_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          } as Param1
        } as router.NamedRouterOptions)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0020_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0021_static
     * @tc.name     testrouterstage0021_static
     * @tc.desc     testrouterstage0021_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0021_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0021_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        routerPush.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          } as Param1
        } as router.NamedRouterOptions, (err: BusinessError<void>|null): void => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0021_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0022_static
     * @tc.name     testrouterstage0022_static
     * @tc.desc     testrouterstage0022_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0022_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0022_static START');
      let result: Promise<void> = Promise.resolve();
      try {
        result = routerPush.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          } as Param1
        } as router.NamedRouterOptions, router.RouterMode.Standard)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0022_static END');
      done();
    });

    
/**
     * @tc.number   testrouterstage0023_static
     * @tc.name     testrouterstage0023_static
     * @tc.desc     testrouterstage0023_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterstage0023_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0023_static START');
      let result: Promise<void>
      try {
        routerPush.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          } as Param1
        } as router.NamedRouterOptions, router.RouterMode.Standard, (err: BusinessError<void>|null): void => {
          if (err) {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('replaceUrl success');
        });
        // expect(result).assertUndefined();
        console.info("push button page success ");
      } catch (err) {
        console.error("push button page error ");
      }
      console.info('testrouterstage0023_static END');
      done();
    });


  })
}