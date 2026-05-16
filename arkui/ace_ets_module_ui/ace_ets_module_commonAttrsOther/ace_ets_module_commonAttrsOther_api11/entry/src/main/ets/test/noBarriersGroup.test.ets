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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
    /**
     * @tc.name   noBarriersGroup001
     * @tc.number noBarriersGroup001
     * @tc.desc   noBarriersGroup001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup001', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup002
     * @tc.number noBarriersGroup002
     * @tc.desc   noBarriersGroup002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup002', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup003
     * @tc.number noBarriersGroup003
     * @tc.desc   noBarriersGroup003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup003', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup004
     * @tc.number noBarriersGroup004
     * @tc.desc   noBarriersGroup004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup004', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup005
     * @tc.number noBarriersGroup005
     * @tc.desc   noBarriersGroup005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup005', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup006
     * @tc.number noBarriersGroup006
     * @tc.desc   noBarriersGroup006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup006', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup007
     * @tc.number noBarriersGroup007
     * @tc.desc   noBarriersGroup007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup007', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup008
     * @tc.number noBarriersGroup008
     * @tc.desc   noBarriersGroup008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup008', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup009
     * @tc.number noBarriersGroup009
     * @tc.desc   noBarriersGroup009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup009', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup0010
     * @tc.number noBarriersGroup0010
     * @tc.desc   noBarriersGroup0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup0010', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup0011
     * @tc.number noBarriersGroup0011
     * @tc.desc   noBarriersGroup0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup0011', Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   noBarriersGroup0012
     * @tc.number noBarriersGroup0012
     * @tc.desc   noBarriersGroup0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarriersGroup0012', Level.LEVEL0, async (done: Function) => {
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