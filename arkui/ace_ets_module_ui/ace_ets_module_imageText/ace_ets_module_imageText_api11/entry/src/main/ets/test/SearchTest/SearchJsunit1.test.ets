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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function searchTest() {
  describe('searchTest',  ()=> {
    beforeEach(async (done: Function)=> {
      console.info("search beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Search/searchPage1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search state pages: " + JSON.stringify(pages));
        if (!("searchPage" == pages.name)) {
          console.info("get search pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push search page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
      done()
    });

    afterEach(async  ()=> {
      await Utils.sleep(1000);
      console.info("search after each called");
    })
	let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_size_body1').id)    /**
     * @tc.number testSearchSelectionMenuHidden01
     * @tc.name   Test the Search property of the SelectionMenuHidden component
     * @tc.desc   set the SelectionMenuHidden property value is boolean
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    /** .key()取不到属性值 */ 
    // it('testSelectionMenuHidden01', 0, async (done: Function) => {
    //   let tagName = 'testSearchSelectionMenuHidden01';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //   let strJson = getInspectorByKey('search');
    //   console.info('[' + tagName + '] component obj is: ' + strJson);
    //   let obj:ESObject = JSON.parse(strJson);
    //   expect(obj.$type).assertEqual('Search');
    //   expect(obj.$attrs.selectionMenuHidden).assertEqual("false");

    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "typeValue": 1,
    //       }
    //     }
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 1401,
    //       priority: events_emitter.EventPriority.LOW
    //     }
    //     console.info('[' + tagName + '] start to publish emit');
    //     events_emitter.emit(innerEvent, eventData);
    //   } catch (err) {
    //     console.log('[' + tagName + '] change component data error: ' + err.message);
    //   }
    //   await Utils.sleep(2000);
    //   let strJsonNew = getInspectorByKey('search');
    //   let objNew = JSON.parse(strJsonNew);
    //   console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
    //   expect(objNew.$attrs.selectionMenuHidden).assertEqual("false");
    //   expect(objNew.$type).assertEqual('Search');

    //   console.info('[' + tagName + '] END ===========================');
    //   done();
    // });

    /**
     * @tc.number testSearchCaretStyle02
     * @tc.name   Test the Search property of the CaretStyle component
     * @tc.desc   set the CaretStyle property value is object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchCaretStyle02', 0, async (done: Function) => {
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(JSON.stringify(objNew.$attrs.caretStyle)).assertEqual("{\"color\":\"#FF000000\",\"width\":\"10.00vp\"}");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchEnableKeyboardOnFocus03
     * @tc.name   Test the Search property of the EnableKeyboardOnFocus component
     * @tc.desc   set the EnableKeyboardOnFocus property value is boolean
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    /** .key()取不到属性值 */ 
    // it('testSearchEnableKeyboardOnFocus03', 0, async (done: Function) => {
    //   let tagName = 'testSearchEnableKeyboardOnFocus03';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //   let strJson = getInspectorByKey('search');
    //   console.info('[' + tagName + '] component obj is: ' + strJson);
    //   let obj = JSON.parse(strJson);
    //   expect(obj.$type).assertEqual('Search');
    //   expect(obj.$attrs.enableKeyboardOnFocus).assertEqual("true");

    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "typeValue": 3,
    //       }
    //     }
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 1601,
    //       priority: events_emitter.EventPriority.LOW
    //     }
    //     console.info('[' + tagName + '] start to publish emit');
    //     events_emitter.emit(innerEvent, eventData);
    //   } catch (err) {
    //     console.log('[' + tagName + '] change component data error: ' + err.message);
    //   }
    //   await Utils.sleep(2000);
    //   let strJsonNew = getInspectorByKey('search');
    //   let objNew = JSON.parse(strJsonNew);
    //   console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
    //   expect(objNew.$attrs.enableKeyboardOnFocus).assertEqual("false");
    //   expect(objNew.$type).assertEqual('Search');

    //   console.info('[' + tagName + '] END ===========================');
    //   done();
    //   });

     /**
     * @tc.number testSearchPlaceholderFont04
     * @tc.name   Test the Search property of the PlaceholderFont component
     * @tc.desc   set the PlaceholderFont property value is object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchPlaceholderFont04', 0, async (done: Function) => {
      let tagName = 'testSearchPlaceholderFont04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

	  expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"'+px2fp(resourceSize)+'.00fp","weight":"400","fontFamily":"sans-serif"}');
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchSearchIcon05
     * @tc.name   Test the Search property of the SearchIcon component
     * @tc.desc   set the SearchIcon property value is object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchSearchIcon05', 0, async (done: Function) => {
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
	  expect(JSON.stringify(objNew.$attrs.searchIcon)).assertEqual(`{\"size\":\"${vp2px(30).toFixed(2)}px\",\"color\":\"#FFFF0000\",\"src\":\"resource:///ohos_search.svg\"}`);
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchSearchButton06
     * @tc.name   Test the Search property of the SearchButton component
     * @tc.desc   set the SearchButton property value is object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchSearchButton06', 0, async (done: Function) => {
      let tagName = 'testSearchSearchButton06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.searchButton).assertEqual("SEARCH");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchFontColor07
     * @tc.name   Test the Search property of the FontColor component
     * @tc.desc   set the FontColor property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchFontColor07', 0, async (done: Function) => {
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.fontColor).assertEqual("#FFFF0000");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchCopyOption08
     * @tc.name   Test the Search property of the CopyOption component
     * @tc.desc   set the CopyOption property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchCopyOption08', 0, async (done: Function) => {
      let tagName = 'testSearchCopyOption08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.InApp");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchTextFont09
     * @tc.name   Test the Search property of the TextFont component
     * @tc.desc   set the TextFont property value is object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchTextFont09', 0, async (done: Function) => {
      let tagName = 'testSearchTextFont09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

	  expect(obj.$attrs.textFont).assertEqual('{"fontSize":"'+px2fp(resourceSize)+'.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');

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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.textFont).assertEqual("{\"fontSize\":\"16.00fp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchPlaceholderColor10
     * @tc.name   Test the Search property of the PlaceholderColor component
     * @tc.desc   set the PlaceholderColor property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchPlaceholderColor10', 0, async (done: Function) => {
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.placeholderColor).assertEqual("#FFFF0000");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchCancelButton11
     * @tc.name   Test the Search property of the CancelButton component
     * @tc.desc   set the CancelButton property value is object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchCancelButton11', 0, async (done: Function) => {
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
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(JSON.stringify(objNew.$attrs.cancelButton)).assertEqual(`{\"style\":\"CancelButtonStyle.CONSTANT\",\"icon\":{\"size\":\"${vp2px(10).toFixed(2)}px\",\"color\":\"#FF000000\",\"src\":\"resource:///ohos_close.svg\"}}`);
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchTextAlign12
     * @tc.name   Test the Search property of the TextAlign component
     * @tc.desc   set the TextAlign property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSearchTextAlign12', 0, async (done: Function) => {
      let tagName = 'testSearchTextAlign12';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
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
      await Utils.sleep(2000);
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
