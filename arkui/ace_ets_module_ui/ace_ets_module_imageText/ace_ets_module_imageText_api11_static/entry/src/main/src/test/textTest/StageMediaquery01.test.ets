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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
// import mediaquery from '@ohos.mediaquery'

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function stageMediaquery() {
  describe('stageMediaquery', () => {

    beforeAll(() => {
      console.info("stageMediaquery beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("stageMediaquery beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/stageMediaquery',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get stageMediaquery state pages:" + JSON.stringify(pages));
        if (!("stageMediaquery" == pages.name)) {
          console.info("get stageMediaquery pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stageMediaquery page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageMediaquery page error:" + err);
      }
      console.info("stageMediaquery beforeEach end");
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
     * @tc.number   testmediaQueryOff_static_0001
     * @tc.name     testmediaQueryOff_static_0001
     * @tc.desc     testmediaQueryOff_static_0001
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0001', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0001 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0001] component width strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
          console.info("[testmediaQueryOff_static_0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0002
     * @tc.name     testmediaQueryOff_static_0002
     * @tc.desc     testmediaQueryOff_static_0002
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0002', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0002 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0002] component height strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
          console.info("[testmediaQueryOff_static_0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0003
     * @tc.name     testmediaQueryOff_static_0003
     * @tc.desc     testmediaQueryOff_static_0003
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0003', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0003 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0003] component fontSize strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
          console.info("[testmediaQueryOff_static_0003] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0004
     * @tc.name     testmediaQueryOff_static_0004
     * @tc.desc     testmediaQueryOff_static_0004
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0004', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0004 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0004] component opacity strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('opacity')).assertEqual(1);
          console.info("[testmediaQueryOff_static_0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('opacity'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0005
     * @tc.name     testmediaQueryOff_static_0005
     * @tc.desc     testmediaQueryOff_static_0005
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0005', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0005 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0005] component align strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
          console.info("[testmediaQueryOff_static_0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0006
     * @tc.name     testmediaQueryOff_static_0006
     * @tc.desc     testmediaQueryOff_static_0006
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0006', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0006 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0006] component fontColor strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
          console.info("[testmediaQueryOff_static_0006] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0007
     * @tc.name     testmediaQueryOff_static_0007
     * @tc.desc     testmediaQueryOff_static_0007
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0007', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0007 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0007] component lineHeight strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
          console.info("[testmediaQueryOff_static_0007] lineHeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0009
     * @tc.name     testmediaQueryOff_static_0009
     * @tc.desc     testmediaQueryOff_static_0009
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0009', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff009 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0009] component padding strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
          console.info("[testmediaQueryOff_static_0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0010
     * @tc.name     testmediaQueryOff_static_0010
     * @tc.desc     testmediaQueryOff_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0010', Level.LEVEL2, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          console.info('mediaQueryOff testmediaQueryOff_static_0010 START');
          let strJson = inspector.getInspectorByKey('offText');
          console.info("[testmediaQueryOff_static_0010] component textAlign strJson:" + strJson);
          let obj = JSON.parseJsonElement(strJson);
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
          console.info("[testmediaQueryOff_static_0010] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));
        } catch (err) {
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0011
     * @tc.name     testmediaQueryOff_static_0011
     * @tc.desc     testmediaQueryOff_static_0011
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0011', Level.LEVEL2, async (done: ()=>void) => {
      console.info('mediaQueryOff testmediaQueryOff_static_0011 START');
      try {
        let innerEventOne: emitter.InnerEvent = {
          eventId: 60218,
          priority: emitter.EventPriority.LOW
        }
        let callback1 = (eventData: emitter.EventData) => {
          console.info("testmediaQueryOff_static_0011 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as ESObject)?.getProperty('STATUS')).assertEqual(true);
        }
        console.info("testmediaQueryOff_static_0011 click result is: " + JSON.stringify(inspector.sendEventByKey('offText', 10, "")));
        emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testmediaQueryOff_static_0011 on emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff_static_0011 END');
      done();
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0012
     * @tc.name     testmediaQueryOff_static_0012
     * @tc.desc     testmediaQueryOff_static_0012
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0012', Level.LEVEL2, async (done: ()=>void) => {
      console.info('matchMediaSync testmediaQueryOff_static_0012 START');
      try {
        let innerEventOne: emitter.InnerEvent = {
          eventId: 60219,
          priority: emitter.EventPriority.LOW
        }
        let callback1 = (eventData: emitter.EventData) => {
          console.info("testmediaQueryOff_static_0012 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as ESObject)?.getProperty('STATUS')).assertEqual(true);
        }
        console.info("testmediaQueryOff_static_0012 click result is: " + JSON.stringify(inspector.sendEventByKey('matchMediaSyncText', 10, "")));
        emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testmediaQueryOff_static_0012 on emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff_static_0012 END');
      done();
    });

    
    /**
     * @tc.number   testmediaQueryOff_static_0013
     * @tc.name     testmediaQueryOff_static_0013
     * @tc.desc     testmediaQueryOff_static_0013
     * @tc.level    Level.LEVEL2
     */
    it('testmediaQueryOff_static_0013', Level.LEVEL2, async (done: ()=>void) => {
      // let mediaQuery: ESObject = globalThis.uiContent.getMediaQuery();
      console.info('testmediaQueryOff_static_0013 START');
      // let result: ESObject;
      try {
        // result = mediaQuery.matchMediaSync('(orientation: landscape)')
        // expect(typeof (result)).assertEqual('object');
        // console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        // console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testmediaQueryOff_static_0013 END');
      done();
    });

    /**
     * @tc.number   testRunScopedTask_static_0010
     * @tc.name     testRunScopedTask_static_0010
     * @tc.desc     testRunScopedTask_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('testRunScopedTask_static_0010', Level.LEVEL2, async (done: ()=>void) => {
      // let uiContent: UIContext = globalThis.uiContent
      console.info('testRunScopedTask_static_0010 START');
      // let result: ESObject;
      try {
        // result = uiContent.runScopedTask(() => {
        //   console.info("success")
        // });
        // expect(result).assertUndefined();
        // console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        // console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testRunScopedTask_static_0010 END');
      done();
    });
  })
}