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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function searchTest() {
  describe('searchTest',  ()=> {
    beforeEach(async (done: Function)=> {
      console.info("search beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi11/searchPage1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search state pages: " + JSON.stringify(pages));
        if (!("searchPage1" == pages.name)) {
          console.info("get search pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
      done()
    });

    afterEach(async  ()=> {
      await CommonFunc.sleep(1000);
      console.info("search after each called");
    })

    /**
     * @tc.name   testSearchCaretStyle02
     * @tc.number testSearchCaretStyle02
     * @tc.desc   set the CaretStyle property value is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchCaretStyle02', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchCaretStyle02';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 2,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1501,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(JSON.stringify(objNew.$attrs.caretStyle)).assertEqual("{\"color\":\"#FF000000\",\"width\":\"10.00vp\"}");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchPlaceholderFont04
     * @tc.number testSearchPlaceholderFont04
     * @tc.desc   set the PlaceholderFont property value is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchPlaceholderFont04', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchPlaceholderFont04';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

      expect(obj.$attrs.placeholderFont).assertContain('FontStyle');
      expect(obj.$attrs.placeholderFont).assertContain('fp');
      expect(obj.$attrs.placeholderFont).assertContain('sans-serif');
      expect(obj.$attrs.placeholderFont).assertContain('eight');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 4,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1701,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchSearchIcon05
     * @tc.number testSearchSearchIcon05
     * @tc.desc   set the SearchIcon property value is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchSearchIcon05', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchSearchIcon05';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 5,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
	  expect(JSON.stringify(objNew.$attrs.searchIcon)).assertEqual(`{\"size\":\"${vp2px(30).toFixed(2)}px\",\"color\":\"#FFFF0000\",\"src\":\"resource:///ohos_search.svg\"}`);
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchSearchButton06
     * @tc.number testSearchSearchButton06
     * @tc.desc   set the SearchButton property value is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchSearchButton06', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchSearchButton06';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.searchButton).assertEqual("");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 6,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1901,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.searchButton).assertEqual("SEARCH");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchFontColor07
     * @tc.number testSearchFontColor07
     * @tc.desc   set the FontColor property value is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchFontColor07', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchFontColor07';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 7,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2001,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.fontColor).assertEqual("#FFFF0000");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchCopyOption08
     * @tc.number testSearchCopyOption08
     * @tc.desc   set the CopyOption property value is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchCopyOption08', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchCopyOption08';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.Local");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 8,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2101,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.InApp");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchTextFont09
     * @tc.number testSearchTextFont09
     * @tc.desc   set the TextFont property value is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchTextFont09', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchTextFont09';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

      expect(obj.$attrs.textFont).assertContain('FontStyle');
      expect(obj.$attrs.textFont).assertContain('fp');
      expect(obj.$attrs.textFont).assertContain('eight');
      expect(obj.$attrs.textFont).assertContain('HarmonyOS Sans');  

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 9,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2201,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.textFont).assertEqual("{\"fontSize\":\"16.00fp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchPlaceholderColor10
     * @tc.number testSearchPlaceholderColor10
     * @tc.desc   set the PlaceholderColor property value is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchPlaceholderColor10', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchPlaceholderColor10';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 10,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2301,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.placeholderColor).assertEqual("#FFFF0000");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSearchCancelButton11
     * @tc.number testSearchCancelButton11
     * @tc.desc   set the CancelButton property value is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchCancelButton11', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchCancelButton11';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 11,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2401,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(JSON.stringify(objNew.$attrs.cancelButton)).assertEqual(`{\"style\":\"CancelButtonStyle.CONSTANT\",\"icon\":{\"size\":\"${vp2px(10).toFixed(2)}px\",\"color\":\"#FF000000\",\"src\":\"resource:///ohos_close.svg\"}}`);
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.name   testSearchTextAlign12
     * @tc.number testSearchTextAlign12
     * @tc.desc   set the TextAlign property value is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchTextAlign12', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSearchTextAlign12';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 12,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2501,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.textAlign).assertEqual("TextAlign.Center");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
