'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { UIContext, AtomicServiceBar, Router, KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';



export default function mediaQueryOffJsunit() {
  describe('mediaQueryOffTest', () => {
    beforeAll(() => {
      console.info("mediaQueryOffTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.UIContext.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("mediaQueryOffTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/mediaquery/mediaQuery',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        console.info('test router:'+ routerInstance)
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get mediaQueryOffTest state pages:" + JSON.stringify(pages));
        if (!("mediaQuery" == pages.name)) { //"mediaQuery" == pages.name
          console.info("get mediaQueryOffTest pages.name:" + pages.name);
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          console.info("cui 111" + pages.name);
          routerInstance.pushUrl(options);
          console.info("cui 222" + pages.name);
          await CommonFunc.sleep(2000);
          console.info("cui 333" + pages.name);
          // console.info("push mediaQueryOffTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push mediaQueryOffTest page error:" + err);
      }
      console.info("mediaQueryOffTest beforeEach end");
    });


    afterAll(async () => {
      console.info('[mediaQueryOffTest] after each called')
      await UtilsTest.msSleep(1000)
    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0001
     * @tc.name     testmediaQueryOff_static_0001
     * @tc.desc     testmediaQueryOff_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0001', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0001 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      // console.info("[testmediaQueryOff0001] component width strJson11:" + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testmediaQueryOff0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0002
     * @tc.name     testmediaQueryOff_static_0002
     * @tc.desc     testmediaQueryOff_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0002', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0002 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testmediaQueryOff0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0003
     * @tc.name     testmediaQueryOff_static_0003
     * @tc.desc     testmediaQueryOff_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0003', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0003 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testmediaQueryOff0003] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0004
     * @tc.name     testmediaQueryOff_static_0004
     * @tc.desc     testmediaQueryOff_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0004', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0004 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testmediaQueryOff0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0005
     * @tc.name     testmediaQueryOff_static_0005
     * @tc.desc     testmediaQueryOff_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0005', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0005 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testmediaQueryOff0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0006
     * @tc.name     testmediaQueryOff_static_0006
     * @tc.desc     testmediaQueryOff_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0006', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff_static_0006 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff_static_0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#E5182431");
      console.info("[testmediaQueryOff_static_0006] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0007
     * @tc.name     testmediaQueryOff_static_0007
     * @tc.desc     testmediaQueryOff_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0007', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff_static_0007 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff_static_0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testmediaQueryOff_static_0007] lineHeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0009
     * @tc.name     testmediaQueryOff_static_0009
     * @tc.desc     testmediaQueryOff_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0009', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff_static_0009 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff_static_0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testmediaQueryOff_static_0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0010
     * @tc.name     testmediaQueryOff_static_0010
     * @tc.desc     testmediaQueryOff_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0010', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff_static_0010 START');
      await UtilsTest.msSleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff_static_0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testmediaQueryOff_static_0010] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });

    

    /**
     * @tc.number   testmediaQueryOff_static_0011
     * @tc.name     testmediaQueryOff_static_0011
     * @tc.desc     testmediaQueryOff_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0011', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff_static_0011 START');
      await UtilsTest.msSleep(2000);
      try {
        let innerEventOne: emitter.InnerEvent = {
          eventId: 60218,
          priority: emitter.EventPriority.LOW
        }
        let callback1 = (eventData: emitter.EventData) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as ESObject).getProperty('STATUS')).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(inspector.sendEventByKey('offText', 10, "")));
        emitter.on(innerEventOne, callback1);
      } catch (err:Error) {
        console.info("onRequestPopupData_0012 on emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff_static_0011 END');

    });

    

    /**
     * @tc.number   testmatchMediaSync_static_0001
     * @tc.name     testmatchMediaSync_static_0001
     * @tc.desc     testmatchMediaSync_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testmatchMediaSync_static_0001', Level.LEVEL0, async  () => {
      console.info('matchMediaSync testmatchMediaSync_static_0001 START');
      await UtilsTest.msSleep(2000);
      try {
        let innerEventOne: emitter.InnerEvent = {
          eventId: 60219,
          priority: emitter.EventPriority.LOW
        }
        let callback1 = (eventData: emitter.EventData) => {
          const data: Record<String,RecordData> = eventData.data as Record<String,RecordData>
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect(data['STATUS']).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + inspector.sendEventByKey('matchMediaSyncText', 10, "")); //没有执行页面的点击事件，appDied
        emitter.on(innerEventOne, callback1);
      } catch (err:Error) {
        console.info("onRequestPopupData_0012 on emitter err : " + JSON.stringify(err));
      }
      console.info('testmatchMediaSync_static_0001 END');

    });
  })
}
