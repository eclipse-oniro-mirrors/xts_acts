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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level} from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
import inspector from '@ohos.arkui.inspector'
import { FontStyle, FontWeight, TextCase, TextDecorationType,Font, Color,$r, Resource,Length ,ResourceColor, ResourceStr } from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';
import { RecordData } from '@ohos.base';
export default function spanTest() {
  describe('spanTest', (): void => {
    beforeAll(() => {
      console.info("FontSettingOptions beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("span beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/spanPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get span state pages: " + String(pages));
        if (!("spanPage" == pages.name)) {
          console.info("get span pages.name: " + String(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push span page result success");
        }
      } catch (err: Error) {
        console.error("push span page error: " + err);
      }
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("span after each called");
    })
    /**
     * @tc.number   testSpanFontSize_static_01
     * @tc.name     testSpanFontSize_static_01
     * @tc.desc     testSpanFontSize_static_01
     * @tc.level   Level.LEVEL0
     */
    it('testSpanFontSize_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanFontSize_static01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("16.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontSize": 68 as double,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual("68.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontSize": $r('app.float.50vp'),
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = inspector.getInspectorByKey('keykeyspan');
      let objNew2 = JSON.parseJsonElement(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);

      expect(objNew2.getElement('$attrs').getString('fontSize')).assertEqual("50.00vp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   testSpanfontFamily_static_02
     * @tc.name     testSpanfontFamily_static_02
     * @tc.desc     testSpanfontFamily_static_02
     * @tc.level   Level.LEVEL0
     */
    it('testSpanfontFamily_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanfontFamily02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("HarmonyOS Sans");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontFamily": 'Arial',
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('fontFamily')).assertEqual("Arial");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number   testSpanlineHeight_static_03
     * @tc.name     testSpanlineHeight_static_03
     * @tc.desc     testSpanlineHeight_static_03
     * @tc.level   Level.LEVEL0
     */
    it('testSpanlineHeight_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanlineHeight03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("0.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mLineHeight": '80fp',
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('lineHeight')).assertEqual("80.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mLineHeight": 50 as double,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = inspector.getInspectorByKey('keykeyspan');
      let objNew2 = JSON.parseJsonElement(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// String(objNew));

      expect(objNew2.getElement('$attrs').getString('lineHeight')).assertEqual("50.00fp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   testSpanfontStyle_static_04
     * @tc.name     testSpanfontStyle_static_04
     * @tc.desc     testSpanfontStyle_static_04
     * @tc.level   Level.LEVEL0
     */
    it('testSpanfontStyle_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanfontStyle04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual("FontStyle.Normal");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontStyle": FontStyle.Italic,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
      expect(objNew.getElement('$attrs').getString('fontStyle')).assertEqual("FontStyle.Italic");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number   testSpanfontWeight_static_05
     * @tc.name     testSpanfontWeight_static_05
     * @tc.desc     testSpanfontWeight_static_05
     * @tc.level   Level.LEVEL0
     */
    it('testSpanfontWeight_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanfontWeight05';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("400");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontWeight": FontWeight.Bold,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
      expect(objNew.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Bold");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number   testSpantextCase_static_06
     * @tc.name     testSpantextCase_static_06
     * @tc.desc     testSpantextCase_static_06
     * @tc.level   Level.LEVEL0
     */
    it('testSpantextCase_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpantextCase06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual("TextCase.Normal");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mTextCase": TextCase.UpperCase,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);

      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('textCase')).assertEqual("TextCase.UpperCase");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   testSpandecoration_static_07
     * @tc.name     testSpandecoration_static_07
     * @tc.desc     testSpandecoration_static_07
     * @tc.level   Level.LEVEL0
     */
    it('testSpandecoration_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpandecoration07';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.None","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mDecorationType": TextDecorationType.Underline,
            "mDecorationColor":Color.Red
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   testSpanfontColor_static_08
     * @tc.name     testSpanfontColor_static_08
     * @tc.desc     testSpanfontColor_static_08
     * @tc.level   Level.LEVEL0
     */
    it('testSpanfontColor_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanfontColor08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontColor": 0xFF00FF,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF00FF");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   testSpanletterSpacing_static_09
     * @tc.name     testSpanletterSpacing_static_09
     * @tc.desc     testSpanletterSpacing_static_09
     * @tc.level   Level.LEVEL0
     */
    it('testSpanletterSpacing_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanletterSpacing09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual("0.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mLetterSpacing": 5 as double,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));

      expect(objNew.getElement('$attrs').getString('letterSpacing')).assertEqual("5.00fp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   testSpanFont_static_10
     * @tc.name     testSpanFont_static_10
     * @tc.desc     testSpanFont_static_10
     * @tc.level   Level.LEVEL0
     */
    it('testSpanFont_static_10', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSpanFont10';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan2');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Span');
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Normal");
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('font')).getString('size')).assertEqual('16.00fp');
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFont": { size: $r('app.float.50vp'), weight: FontWeight.Bold, family: $r('app.string.font_family_arial'), style: FontStyle.Italic } as Font,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);

      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan2');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
      let objNew = JSON.parseJsonElement(strJsonNew);
      expect(objNew.getElement('$attrs').getString('font')).assertEqual('{"style":"FontStyle.Italic","size":"50.00vp","weight":"FontWeight.Bold","family":"Arial"}');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
