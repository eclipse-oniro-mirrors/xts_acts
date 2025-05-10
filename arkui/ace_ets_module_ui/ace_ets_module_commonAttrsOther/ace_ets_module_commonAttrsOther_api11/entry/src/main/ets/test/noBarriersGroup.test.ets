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
import router from '@ohos.router';

export default function noBarriersGroupTest() {
  describe('noBarriersGroupTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/noBarriersGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get noBarriersGroup state success " + JSON.stringify(pages));
        if (!("noBarriersGroup" == pages.name)) {
          console.info("get noBarriersGroup state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push noBarriersGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push noBarriersGroup page error: " + err);
      }
      done()
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('noBarriersGroup001', 0, async (done: Function) => {
      console.info('noBarriersGroup001 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup1");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));

          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup002', 0, async (done: Function) => {
      console.info('noBarriersGroup002 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup2");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup003', 0, async (done: Function) => {
      console.info('noBarriersGroup003 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup3");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup003 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup004', 0, async (done: Function) => {
      console.info('noBarriersGroup004 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup4");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup004 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup004 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup005', 0, async (done: Function) => {
      console.info('noBarriersGroup005 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup5");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup005 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup005 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup006', 0, async (done: Function) => {
      console.info('noBarriersGroup006 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup6");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup006 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup006 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup007', 0, async (done: Function) => {
      console.info('noBarriersGroup007 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup7");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup007 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup007 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup008', 0, async (done: Function) => {
      console.info('noBarriersGroup008 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup8");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup008 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup008 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup009', 0, async (done: Function) => {
      console.info('noBarriersGroup009 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup9");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup009 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup009 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup0010', 0, async (done: Function) => {
      console.info('noBarriersGroup0010 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup10");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup0010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup0011', 0, async (done: Function) => {
      console.info('noBarriersGroup0011 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup11");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup0011 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup0011 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup0012', 0, async (done: Function) => {
      console.info('noBarriersGroup0012 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("noBarriersGroup12");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarriersGroup0012 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarriersGroup0012 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}