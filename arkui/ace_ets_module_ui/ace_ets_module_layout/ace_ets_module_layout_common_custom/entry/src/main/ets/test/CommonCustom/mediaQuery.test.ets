/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

interface optionsObj {
  uri: string
}

export default function mediaQueryOffJsunit() {
  describe('mediaQueryOffTest', () => {

    beforeAll(async () => {
      console.info('[mediaQueryOffTest] before each called')

      // let result ;
      let options: optionsObj = {
        uri: 'MainAbility/pages/CommonCustom/mediaQuery'
      }
      try {
        let result = router.push(options)
        console.info("push mediaQuery page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push mediaQuery page error " + JSON.stringify(err));
      }
      await Utils.sleep(4000)
    });

    afterAll(async () => {
      console.info('[mediaQueryOffTest] after each called')
      await Utils.sleep(1000)
    });

    /**
     * @tc.name   testmediaQueryOff0001
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0001
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0001', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testmediaQueryOff0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testmediaQueryOff0002
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0002
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0002', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testmediaQueryOff0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testmediaQueryOff0003
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0003
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0003', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testmediaQueryOff0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /**
     * @tc.name   testmediaQueryOff0004
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0004
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0004', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testmediaQueryOff0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testmediaQueryOff0005
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0005
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0005', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testmediaQueryOff0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /**
     * @tc.name   testmediaQueryOff0006
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0006
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0006', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testmediaQueryOff0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /**
     * @tc.name   testmediaQueryOff0007
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0007
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0007', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testmediaQueryOff0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);

    });

    /**
     * @tc.name   testmediaQueryOff0009
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0009
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0009', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testmediaQueryOff0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testmediaQueryOff0010
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0010
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0010', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testmediaQueryOff0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    /**
     * @tc.name   testmediaQueryOff0011
     * @tc.number SUB_ARKUI_API_testmediaQueryOff0011
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmediaQueryOff0011', Level.LEVEL0, async  () => {
      console.info('mediaQueryOff testmediaQueryOff0011 START');
      await Utils.sleep(2000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60218,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: ESObject) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('offText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("onRequestPopupData_0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff0011 END');

    });

    /**
     * @tc.name   testmatchMediaSyncNew0001
     * @tc.number testmatchMediaSyncNew0001
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmatchMediaSyncNew0001', Level.LEVEL0, async  () => {
      console.info('matchMediaSync testmatchMediaSyncNew0001 START');
      await Utils.sleep(2000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60219,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: ESObject) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('matchMediaSyncText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("onRequestPopupData_0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmatchMediaSyncNew0001 END');

    });
  })
}
