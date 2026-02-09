'use static';
/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter'
import { $r } from '@ohos.arkui.component';
import Utils from './Utils.test';
import CommonFunc from '../../../ets/MainAbility/common/Common'
// import { resourceManager } from '@kit.LocalizationKit';
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function searchTest() {
  describe('searchTest', () => {
    beforeAll(() => {
      console.info("searchTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("search beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/searchPage1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get search state pages: " + JSON.stringify(pages));
        if (!("searchPage1" == pages.name)) {
          console.info("get search pages.name: " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search page result: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push search page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000)
      console.info("search after each called");
    })


    
    /**
     * @tc.number   testSearchCaretStyle_static_02
     * @tc.name     testSearchCaretStyle_static_02
     * @tc.desc     testSearchCaretStyle_static_02
     * @tc.level    Level.LEVEL0
     */
    it('testSearchCaretStyle_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchCaretStyle02';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 2,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1501,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(JSON.stringifyJsonElement(objNew.getElement('$attrs').getElement('caretStyle')))
        .assertEqual("{\"color\":\"#FF000000\",\"width\":\"10.00vp\"}");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   testSearchPlaceholderFont_static_04
     * @tc.name     testSearchPlaceholderFont_static_04
     * @tc.desc     testSearchPlaceholderFont_static_04
     * @tc.level    Level.LEVEL0
     */
    it('testSearchPlaceholderFont_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchPlaceholderFont04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Search');
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_size_body1').id) as double
      expect(obj.getElement('$attrs').getString('placeholderFont'))
        .assertEqual('{"style":"FontStyle.Normal","size":"' + uiContext!.px2fp(resourceSize) +
          '.00fp","weight":"400","fontFamily":"sans-serif"}');
      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 4,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1701,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('placeholderFont'))
        .assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchSearchIcon_static_05
     * @tc.name     testSearchSearchIcon_static_05
     * @tc.desc     testSearchSearchIcon_static_05
     * @tc.level    Level.LEVEL0
     */
    it('testSearchSearchIcon_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchSearchIcon05';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 5,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1801,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(JSON.stringifyJsonElement(objNew.getElement('$attrs').getElement('searchIcon')))
        .assertEqual(`{\"size\":\"${uiContext!.vp2px(30)
          .toFixed(2)}px\",\"color\":\"#FFFF0000\",\"src\":\"resource:///ohos_search.svg\"}`);
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchSearchButton_static_06
     * @tc.name     testSearchSearchButton_static_06
     * @tc.desc     testSearchSearchButton_static_06
     * @tc.level    Level.LEVEL0
     */
    it('testSearchSearchButton_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchSearchButton06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getString('searchButton')).assertEqual("");

      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 6,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1901,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('searchButton')).assertEqual("SEARCH");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchFontColor_static_07
     * @tc.name     testSearchFontColor_static_07
     * @tc.desc     testSearchFontColor_static_07
     * @tc.level    Level.LEVEL0
     */
    it('testSearchFontColor_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchFontColor07';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 7,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2001,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchCopyOption_static_08
     * @tc.name     testSearchCopyOption_static_08
     * @tc.desc     testSearchCopyOption_static_08
     * @tc.level    Level.LEVEL0
     */
    it('testSearchCopyOption_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchCopyOption08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.Local");

      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 8,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2101,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.InApp");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchTextFont_static_09
     * @tc.name     testSearchTextFont_static_09
     * @tc.desc     testSearchTextFont_static_09
     * @tc.level    Level.LEVEL0
     */
    it('testSearchTextFont_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchTextFont09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Search');
      // expect(obj.getElement('$attrs').getElement('textFont'))
      //   .assertEqual('{"fontSize":"' + uiContext.px2fp(resourceSize) +
      //     '.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');

      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 9,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2201,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('textFont'))
        .assertEqual("{\"fontSize\":\"16.00fp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchPlaceholderColor_static_10
     * @tc.name     testSearchPlaceholderColor_static_10
     * @tc.desc     testSearchPlaceholderColor_static_10
     * @tc.level    Level.LEVEL0
     */
    it('testSearchPlaceholderColor_static_10', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchPlaceholderColor10';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 10,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2301,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('placeholderColor')).assertEqual("#FFFF0000");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchCancelButton_static_11
     * @tc.name     testSearchCancelButton_static_11
     * @tc.desc     testSearchCancelButton_static_11
     * @tc.level    Level.LEVEL0
     */
    it('testSearchCancelButton_static_11', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchCancelButton11';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 11,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2401,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(JSON.stringifyJsonElement(objNew.getElement('$attrs').getElement('cancelButton')))
        .assertEqual(`{\"style\":\"CancelButtonStyle.CONSTANT\",\"icon\":{\"size\":\"${uiContext!.vp2px(10)
          .toFixed(2)}px\",\"color\":\"#FF000000\",\"src\":\"resource:///ohos_close.svg\"}}`);
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number   testSearchTextAlign_static_12
     * @tc.name     testSearchTextAlign_static_12
     * @tc.desc     testSearchTextAlign_static_12
     * @tc.level    Level.LEVEL0
     */
    it('testSearchTextAlign_static_12', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchTextAlign12';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");

      try {
        let eventData: emitter.EventData = {
          data: {
            "typeValue": 12,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2501,
          priority: emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));
      expect(objNew.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
