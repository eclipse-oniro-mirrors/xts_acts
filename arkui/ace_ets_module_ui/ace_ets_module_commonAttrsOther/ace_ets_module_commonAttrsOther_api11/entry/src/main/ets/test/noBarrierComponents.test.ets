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
    it('noBarrierComponents001', 0, async (done: Function) => {
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
    it('noBarrierComponents002', 0, async (done: Function) => {
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
    it('noBarrierComponents003', 0, async (done: Function) => {
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
    it('noBarrierComponents004', 0, async (done: Function) => {
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
    it('noBarrierComponents005', 0, async (done: Function) => {
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
    it('noBarrierComponents006', 0, async (done: Function) => {
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
    it('noBarrierComponents007', 0, async (done: Function) => {
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
    it('noBarrierComponents008', 0, async (done: Function) => {
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
    it('noBarrierComponents010', 0, async (done: Function) => {
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

    it('noBarrierComponents011', 0, async (done: Function) => {
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
    it('noBarrierComponents012', 0, async (done: Function) => {
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
    it('noBarrierComponents013', 0, async (done: Function) => {
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
    it('noBarrierComponents014', 0, async (done: Function) => {
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
    it('noBarrierComponents015', 0, async (done: Function) => {
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
    it('noBarrierComponents016', 0, async (done: Function) => {
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
    it('noBarrierComponents017', 0, async (done: Function) => {
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
    it('noBarrierComponents018', 0, async (done: Function) => {
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
    it('noBarrierComponents019', 0, async (done: Function) => {
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
    it('noBarrierComponents009', 0, async (done: Function) => {
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
    it('noBarrierComponents020', 0, async (done: Function) => {
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
    it('noBarrierComponents021', 0, async (done: Function) => {
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
    it('noBarrierComponents022', 0, async (done: Function) => {
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
    it('noBarrierComponents023', 0, async (done: Function) => {
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
    it('noBarrierComponents024', 0, async (done: Function) => {
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
    it('noBarrierComponents025', 0, async (done: Function) => {
      console.info('noBarrierComponents025 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Select");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Select");
          console.info('noBarrierComponents025 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents025 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents026', 0, async (done: Function) => {
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
    it('noBarrierComponents027', 0, async (done: Function) => {
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
    it('noBarrierComponents028', 0, async (done: Function) => {
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
    it('noBarrierComponents029', 0, async (done: Function) => {
      console.info('noBarrierComponents029 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Web");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Web");
          console.info('noBarrierComponents029 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents029 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents030', 0, async (done: Function) => {
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