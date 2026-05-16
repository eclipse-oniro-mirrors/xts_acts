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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import Utils from '../../../ets/MainAbility/common/Utils'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alphabetIndexerOnSelectJsunit() {
  describe('alphabetIndexerOnSelectJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexer/alphabetIndexerAPI',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get alphabetIndexer state success " + JSON.stringify(pages));
        if (!("alphabetIndexerAPI" == pages.name)) {
          console.info("get alphabetIndexer state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push alphabetIndexer page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetIndexer page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("alphabetIndexerOnSelect after each called");
    });


    
    /**
     * @tc.number   testalphabetIndexerWidth0001_static_01
     * @tc.name     testalphabetIndexerWidth0001_static_01
     * @tc.desc     testalphabetIndexerWidth0001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerWidth0001_static_01', Level.LEVEL0, async () => {
      console.info('alphabetIndexerWidth testalphabetIndexerWidth0001_static_01 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerWidth0001_static_01] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testalphabetIndexerWidth0001_static_01] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testalphabetIndexerHeight0002_static_02
     * @tc.name     testalphabetIndexerHeight0002_static_02
     * @tc.desc     testalphabetIndexerHeight0002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerHeight0002_static_02', Level.LEVEL0, async () => {
      console.info('alphabetIndexerHeight testalphabetIndexerHeight0002_static_02 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerHeight0002_static_02] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("300.00vp");
      console.info("[testalphabetIndexerHeight0002_static_02] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });


    
    /**
     * @tc.number   testalphabetIndexerColor0003_static_03
     * @tc.name     testalphabetIndexerColor0003_static_03
     * @tc.desc     testalphabetIndexerColor0003_static_03
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerColor0003_static_03', Level.LEVEL0, async () => {
      console.info('alphabetIndexerColor testalphabetIndexerColor0003_static_03 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerColor0003_static_03] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FFFF0000');
      console.info("[testalphabetIndexerColor0003_static_03] color value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('color'));

    });


    
    /**
     * @tc.number   testalphabetIndexerSelectedColor0004_static_04
     * @tc.name     testalphabetIndexerSelectedColor0004_static_04
     * @tc.desc     testalphabetIndexerSelectedColor0004_static_04
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerSelectedColor0004_static_04', Level.LEVEL0, async () => {
      console.info('alphabetIndexerSelectedColor testalphabetIndexerSelectedColor0004_static_04 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerOnSelect0004_static_04] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual("#FFFFFFFF");
      console.info("[testalphabetIndexerSelectedColor0004_static_04] selectedColor value :" +
      JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('selectedColor'));

    });


    
    /**
     * @tc.number   testalphabetIndexerPopupColor0005_static_05
     * @tc.name     testalphabetIndexerPopupColor0005_static_05
     * @tc.desc     testalphabetIndexerPopupColor0005_static_05
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerPopupColor0005_static_05', Level.LEVEL0, async () => {
      console.info('alphabetIndexerPopupColor testalphabetIndexerPopupColor0005_static_05 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerPopupColor0005_static_05] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupColor')).assertEqual("#FF48D1CC");
      console.info("[testalphabetIndexerPopupColor0005_static_05] popupColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupColor'));

    });


    
    /**
     * @tc.number   testalphabetIndexerSelectedBackgroundColor0006_static_06
     * @tc.name     testalphabetIndexerSelectedBackgroundColor0006_static_06
     * @tc.desc     testalphabetIndexerSelectedBackgroundColor0006_static_06
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerSelectedBackgroundColor0006_static_06', Level.LEVEL0, async () => {
      console.info('alphabetIndexerSelectedBackgroundColor testalphabetIndexerSelectedBackgroundColor0006_static_06 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerSelectedBackgroundColor0006_static_06] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBackgroundColor'))
        .assertEqual("#FF0000E6");
      console.info("[testalphabetIndexerSelectedBackgroundColor0006_static_06] selectedBackgroundColor value :" +
      JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('selectedBackgroundColor'));

    });


    
    /**
     * @tc.number   testalphabetIndexerPopupBackground0007_static_07
     * @tc.name     testalphabetIndexerPopupBackground0007_static_07
     * @tc.desc     testalphabetIndexerPopupBackground0007_static_07
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerPopupBackground0007_static_07', Level.LEVEL0, async () => {
      console.info('alphabetIndexerPopupBackground testalphabetIndexerPopupBackground0007_static_07 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerPopupBackground0007_static_07] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupBackground')).assertEqual("#FF00DDDD");
      console.info("[testalphabetIndexerPopupBackground0007_static_07] popupBackground value :" +
      JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('popupBackground'));

    });


    
    /**
     * @tc.number   testalphabetIndexerUsingPopup0009_static_08
     * @tc.name     testalphabetIndexerUsingPopup0009_static_08
     * @tc.desc     testalphabetIndexerUsingPopup0009_static_08
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerUsingPopup0009_static_08', Level.LEVEL0, async () => {
      console.info('alphabetIndexerUsingPopup testalphabetIndexerUsingPopup009_static_08 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerUsingPopup0009_static_08] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('usingPopup')).assertEqual('true');
      console.info("[testalphabetIndexerUsingPopup0009_static_08] usingPopup value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('usingPopup'));

    });


    
    /**
     * @tc.number   testalphabetIndexerItemSize0010_static_09
     * @tc.name     testalphabetIndexerItemSize0010_static_09
     * @tc.desc     testalphabetIndexerItemSize0010_static_09
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerItemSize0010_static_09', Level.LEVEL0, async () => {
      console.info('alphabetIndexerItemSize testalphabetIndexerItemSize0010_static_09 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerItemSize0010_static_09] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSize')).assertEqual("28.00vp");
      console.info("[testalphabetIndexerItemSize0010_static_09] itemSize value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSize'));

    });


    
    /**
     * @tc.number   testalphabetIndexerAlignStyle0011_static_10
     * @tc.name     testalphabetIndexerAlignStyle0011_static_10
     * @tc.desc     testalphabetIndexerAlignStyle0011_static_10
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerAlignStyle0011_static_10', Level.LEVEL0, async () => {
      console.info('alphabetIndexerAlignStyle testalphabetIndexerAlignStyle0011_static_10 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerAlignStyle0011_static_10] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignStyle'))
        .assertEqual("IndexerAlign.Left");
      console.info("[testalphabetIndexerItemSize0010_static_10] getString('alignStyle') value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignStyle'));

    });


    
    /**
     * @tc.number   testalphabetIndexerOnSelect0012_static_11
     * @tc.name     testalphabetIndexerOnSelect0012_static_11
     * @tc.desc     testalphabetIndexerOnSelect0012_static_11
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerOnSelect0012_static_11', Level.LEVEL0, async () => {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0011_static_11 START');
      await Utils.sleep(2000);
      try {
        let callback: (indexEvent: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
          console.info("onSelect_0012 get state result is: " + JSON.stringify(indexEvent));
          const data = indexEvent.data as Record<String,RecordData>
          expect(data['STATUS']).assertEqual(true);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60201,
          priority: events_emitter.EventPriority.LOW
        }
        // inspector.sendEventByKey('alphabetIndexer', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onSelect_0012 on events_emitter err : " + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60202,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1: (indexEvent: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          const data = eventData.data as Record<String,RecordData>
          expect(data['STATUS']).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " +
        JSON.stringify(inspector.sendEventByKey('alphabetIndexer', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("onRequestPopupData_0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testalphabetIndexerOnSelect0012_static_11 END');


    });
  })
}
