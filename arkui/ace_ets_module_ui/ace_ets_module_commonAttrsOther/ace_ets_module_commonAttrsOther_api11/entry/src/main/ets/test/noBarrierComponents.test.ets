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

export default function noBarrierComponentsTest() {
  describe('noBarrierComponentsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/noBarrierComponents',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get noBarrierComponents state success " + JSON.stringify(pages));
        if (!("noBarrierComponents" == pages.name)) {
          console.info("get noBarrierComponents state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push noBarrierComponents page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push noBarrierComponents page error: " + err);
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
     * @tc.name   noBarrierComponents001
     * @tc.number noBarrierComponents001
     * @tc.desc   noBarrierComponents001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents001', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents001 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("textAlign1");
          console.info('noBarrierComponents001 START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Text");
          console.info('noBarrierComponents001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents002
     * @tc.number noBarrierComponents002
     * @tc.desc   noBarrierComponents002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents002', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents002 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("textAlign2");
          console.info('noBarrierComponents002 START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Text");
          console.info('noBarrierComponents002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents003
     * @tc.number noBarrierComponents003
     * @tc.desc   noBarrierComponents003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents003', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents003 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("textAlign3");
          console.info('noBarrierComponents003 START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Text");
          console.info('noBarrierComponents003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents004
     * @tc.number noBarrierComponents004
     * @tc.desc   noBarrierComponents004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents004', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents004 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("list");
          console.info('noBarrierComponents004 START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("List");
          console.info('noBarrierComponents004 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents004 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents005
     * @tc.number noBarrierComponents005
     * @tc.desc   noBarrierComponents005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents005', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents005 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Grid");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Grid");
          console.info('noBarrierComponents005 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents005 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents006
     * @tc.number noBarrierComponents006
     * @tc.desc   noBarrierComponents006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents006', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents006 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("AlphabetIndexer");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Stack");
          console.info('noBarrierComponents006 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents006 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents007
     * @tc.number noBarrierComponents007
     * @tc.desc   noBarrierComponents007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents007', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents006 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Blank");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Column");
          console.info('noBarrierComponents007 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents007 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents008
     * @tc.number noBarrierComponents008
     * @tc.desc   noBarrierComponents008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents008', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents008 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Button");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Button");
          console.info('noBarrierComponents008 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents008 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents010
     * @tc.number noBarrierComponents010
     * @tc.desc   noBarrierComponents010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents010', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents010 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Checkbox");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Checkbox");
          console.info('noBarrierComponents010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   noBarrierComponents011
     * @tc.number noBarrierComponents011
     * @tc.desc   noBarrierComponents011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents011', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents011 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("DataPanel");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("DataPanel");
          console.info('noBarrierComponents011 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents011 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents012
     * @tc.number noBarrierComponents012
     * @tc.desc   noBarrierComponents012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents012', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents011 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("DatePicker");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("DatePicker");
          console.info('noBarrierComponents012 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents012 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents013
     * @tc.number noBarrierComponents013
     * @tc.desc   noBarrierComponents013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents013', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents013 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("FormComponent");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("FormComponent");
          console.info('noBarrierComponents013 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents013 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents014
     * @tc.number noBarrierComponents014
     * @tc.desc   noBarrierComponents014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents014', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents014 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Divider");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Divider");
          console.info('noBarrierComponents014 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents014 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents015
     * @tc.number noBarrierComponents015
     * @tc.desc   noBarrierComponents015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents015', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents015 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Gauge");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Gauge");
          console.info('noBarrierComponents015 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents015 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents016
     * @tc.number noBarrierComponents016
     * @tc.desc   noBarrierComponents016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents016', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents016 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Image");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Image");
          console.info('noBarrierComponents016 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents016 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents017
     * @tc.number noBarrierComponents017
     * @tc.desc   noBarrierComponents017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents017', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents017 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Marquee");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Marquee");
          console.info('noBarrierComponents017 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents017 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents018
     * @tc.number noBarrierComponents018
     * @tc.desc   noBarrierComponents018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents018', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents018 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("PatternLock");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("PatternLock");
          console.info('noBarrierComponents018 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents018 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents019
     * @tc.number noBarrierComponents019
     * @tc.desc   noBarrierComponents019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents019', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents019 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Progress");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Progress");
          console.info('noBarrierComponents019 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents019 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents009
     * @tc.number noBarrierComponents009
     * @tc.desc   noBarrierComponents009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents009', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents009 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("QRCode");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("QRCode");
          console.info('noBarrierComponents009 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents009 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents020
     * @tc.number noBarrierComponents020
     * @tc.desc   noBarrierComponents020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents020', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents020 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Radio");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Radio");
          console.info('noBarrierComponents020 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents020 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents021
     * @tc.number noBarrierComponents021
     * @tc.desc   noBarrierComponents021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents021', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents021 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Rating");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Rating");
          console.info('noBarrierComponents021 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents021 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents022
     * @tc.number noBarrierComponents022
     * @tc.desc   noBarrierComponents022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents022', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents022 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("RemoteWindow");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("RemoteWindow");
          console.info('noBarrierComponents022 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents022 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents023
     * @tc.number noBarrierComponents023
     * @tc.desc   noBarrierComponents023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents023', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents023 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("RichText");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Web");
          console.info('noBarrierComponents023 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents023 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents024
     * @tc.number noBarrierComponents024
     * @tc.desc   noBarrierComponents024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents024', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents024 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Search");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Search");
          console.info('noBarrierComponents024 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents024 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    
    /**
     * @tc.name   noBarrierComponents026
     * @tc.number noBarrierComponents026
     * @tc.desc   noBarrierComponents026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents026', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents026 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Slider");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Slider");
          console.info('noBarrierComponents026 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents026 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents027
     * @tc.number noBarrierComponents027
     * @tc.desc   noBarrierComponents027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents027', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents027 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Toggle");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Toggle");
          console.info('noBarrierComponents027 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents027 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   noBarrierComponents028
     * @tc.number noBarrierComponents028
     * @tc.desc   noBarrierComponents028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents028', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents028 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("TimePicker");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("TimePicker");
          console.info('noBarrierComponents028 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents028 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
   
    /**
     * @tc.name   noBarrierComponents030
     * @tc.number noBarrierComponents030
     * @tc.desc   noBarrierComponents030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('noBarrierComponents030', Level.LEVEL0, async (done: Function) => {
      console.info('noBarrierComponents030 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("XComponent");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("XComponent");
          console.info('noBarrierComponents030 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}