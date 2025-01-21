// @ts-nocheck
/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function searchJsunit() {
  describe('searchTest', function () {
    beforeEach(async function (done) {
      console.info("search beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/searchPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search state pages: " + JSON.stringify(pages));
        if (!("searchPage" == pages.name)) {
          console.info("get search pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push search page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("search after each called");
    })

    /**
     * @tc.number testSearchSelectionMenuHidden01
     * @tc.name   Test the Search property of the SelectionMenuHidden component
     * @tc.desc   set the SelectionMenuHidden property value is boolean
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    /** .key()取不到属性值 */ 
    // it('testSelectionMenuHidden01', 0, async function (done) {
    //   var tagName = 'testSearchSelectionMenuHidden01';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //   let strJson = getInspectorByKey('search');
    //   console.info('[' + tagName + '] component obj is: ' + strJson);
    //   let obj = JSON.parse(strJson);
    //   expect(obj.$type).assertEqual('Search');
    //   expect(obj.$attrs.selectionMenuHidden).assertEqual("false");

    //   try {
    //     var eventData = {
    //       data: {
    //         "typeValue": 1,
    //       }
    //     }
    //     var innerEvent = {
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
    it('testSearchCaretStyle02', 0, async function (done) {
      var tagName = 'testSearchCaretStyle02';
      console.info('[' + tagName + '] START============================');
      try {
        var eventData = {
          data: {
            "typeValue": 2,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    // it('testSearchEnableKeyboardOnFocus03', 0, async function (done) {
    //   var tagName = 'testSearchEnableKeyboardOnFocus03';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //   let strJson = getInspectorByKey('search');
    //   console.info('[' + tagName + '] component obj is: ' + strJson);
    //   let obj = JSON.parse(strJson);
    //   expect(obj.$type).assertEqual('Search');
    //   expect(obj.$attrs.enableKeyboardOnFocus).assertEqual("true");

    //   try {
    //     var eventData = {
    //       data: {
    //         "typeValue": 3,
    //       }
    //     }
    //     var innerEvent = {
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
    it('testSearchPlaceholderFont04', 0, async function (done) {
      var tagName = 'testSearchPlaceholderFont04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"weight\":\"400\",\"fontFamily\":\"sans-serif\"}");

      try {
        var eventData = {
          data: {
            "typeValue": 4,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    it('testSearchSearchIcon05', 0, async function (done) {
      var tagName = 'testSearchSearchIcon05';
      console.info('[' + tagName + '] START============================');
      try {
        var eventData = {
          data: {
            "typeValue": 5,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(JSON.stringify(objNew.$attrs.searchIcon)).assertEqual("{\"size\":\"105.00px\",\"color\":\"#FFFF0000\",\"src\":\"resource:///ohos_search.svg\"}");
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
    it('testSearchSearchButton06', 0, async function (done) {
      var tagName = 'testSearchSearchButton06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.searchButton).assertEqual("");

      try {
        var eventData = {
          data: {
            "typeValue": 6,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    it('testSearchFontColor07', 0, async function (done) {
      var tagName = 'testSearchFontColor07';
      console.info('[' + tagName + '] START============================');
      try {
        var eventData = {
          data: {
            "typeValue": 7,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    it('testSearchCopyOption08', 0, async function (done) {
      var tagName = 'testSearchCopyOption08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.Distributed");

      try {
        var eventData = {
          data: {
            "typeValue": 8,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    it('testSearchTextFont09', 0, async function (done) {
      var tagName = 'testSearchTextFont09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.textFont).assertEqual("{\"fontSize\":\"16.00fp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"400\",\"fontFamily\":\"HarmonyOS Sans\"}");

      try {
        var eventData = {
          data: {
            "typeValue": 9,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    it('testSearchPlaceholderColor10', 0, async function (done) {
      var tagName = 'testSearchPlaceholderColor10';
      console.info('[' + tagName + '] START============================');
      try {
        var eventData = {
          data: {
            "typeValue": 10,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
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
    it('testSearchCancelButton11', 0, async function (done) {
      var tagName = 'testSearchCancelButton11';
      console.info('[' + tagName + '] START============================');
      try {
        var eventData = {
          data: {
            "typeValue": 11,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(JSON.stringify(objNew.$attrs.cancelButton)).assertEqual("{\"style\":\"CancelButtonStyle.CONSTANT\",\"icon\":{\"size\":\"70.00px\",\"color\":\"#FF000000\",\"src\":\"resource:///ohos_close.svg\"}}");
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
    it('testSearchTextAlign12', 0, async function (done) {
      var tagName = 'testSearchTextAlign12';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Start");

      try {
        var eventData = {
          data: {
            "typeValue": 12,
          }
        }
        var innerEvent = {
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
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.textAlign).assertEqual("TextAlign.Center");
      expect(objNew.$type).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
