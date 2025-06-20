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
import { UIContext } from '@ohos.arkui.UIContext';
import CommonFunc from '../../MainAbility/common/Common';

export default function stageMediaquery() {
  describe('stageMediaquery', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/stageMediaquery',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageMediaquery state success " + JSON.stringify(pages));
        if (!("stageMediaquery" == pages.name)) {
          console.info("get stageMediaquery state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stageMediaquery page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageMediaquery page error: " + err);
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
    it('testmediaQueryOff0001', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0001 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0001] component width strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
          console.info("[testmediaQueryOff0001] width value :" + JSON.parse(strJson).$attrs.width);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0002', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0002 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0002] component height strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
          console.info("[testmediaQueryOff0002] height value :" + JSON.parse(strJson).$attrs.height);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0003', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0003 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0003] component fontSize strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
          console.info("[testmediaQueryOff0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0004', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0004 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0004] component opacity strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
          console.info("[testmediaQueryOff0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0005', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0005 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0005] component align strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
          console.info("[testmediaQueryOff0005] align value :" + JSON.parse(strJson).$attrs.align);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0006', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0006 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0006] component fontColor strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
          console.info("[testmediaQueryOff0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0007', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0007 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0007] component lineHeight strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("25.00fp");
          console.info("[testmediaQueryOff0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0009', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff009 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0009] component padding strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
          console.info("[testmediaQueryOff0009] padding value :" + JSON.parse(strJson).$attrs.padding);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0010', 0, async (done: Function) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff0010 START');
          let strJson = getInspectorByKey('offText');
          console.info("[testmediaQueryOff0010] component textAlign strJson:" + strJson);

          expect(JSON.parse(strJson).$type).assertEqual('Text');
          expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
          console.info("[testmediaQueryOff0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);
        } catch (err) {
        }
        done();
      }, 500)
    });
    it('testmediaQueryOff0011', 0, async (done: Function) => {
      console.info('mediaQueryOff testmediaQueryOff0011 START');
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60218,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testmediaQueryOff0011 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(true);
        }
        console.info("testmediaQueryOff0011 click result is: " + JSON.stringify(sendEventByKey('offText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testmediaQueryOff0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff0011 END');
      done();
    });
    it('testmediaQueryOff0012', 0, async (done: Function) => {
      console.info('matchMediaSync testmediaQueryOff0012 START');
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60219,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testmediaQueryOff0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(true);
        }
        console.info("testmediaQueryOff0012 click result is: " + JSON.stringify(sendEventByKey('matchMediaSyncText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testmediaQueryOff0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff0012 END');
      done();
    });

    it('testmediaQueryOff0013', 0, async (done: Function) => {
      let mediaQuery: ESObject = globalThis.uiContent.getMediaQuery();
      console.info('testmediaQueryOff0013 START');
      let result: ESObject;
      try {
        result = mediaQuery.matchMediaSync('(orientation: landscape)')
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testmediaQueryOff0013 END');
      done();
    });

    it('testRunScopedTask0010', 0, async (done: Function) => {
      let uiContent: UIContext = globalThis.uiContent
      console.info('testRunScopedTask0010 START');
      let result: ESObject;
      try {
        result = uiContent.runScopedTask(() => {
          console.info("success")
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testRunScopedTask0010 END');
      done();
    });
  })
}