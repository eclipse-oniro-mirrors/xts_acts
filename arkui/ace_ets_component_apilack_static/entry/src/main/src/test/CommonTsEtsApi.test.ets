'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { $r, $rawfile, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Font, Router, UIContext } from '@ohos.arkui.UIContext';
import font from '@ohos.font';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function common_ts_ets_apiStaticClearJsunit() {
  describe('common_ts_ets_apiStaticClearTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common_ts_ets_api',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get common_ts_ets_api state success " + JSON.stringify(pages));
        if (!("common_ts_ets_api" == pages.name)) {
          console.info("get common_ts_ets_api state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push common_ts_ets_api page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("common_ts_ets_apiStaticClear after each called");
    });

    
    
    
    /**
     * @tc.number   testcommon_ts_ets_apiPersistProp_static_0001
     * @tc.name     testcommon_ts_ets_apiPersistProp_static_0001
     * @tc.desc     testcommon_ts_ets_apiPersistProp_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcommon_ts_ets_apiPersistProp_static_0001', Level.LEVEL0, async () => {
      console.info('common_ts_ets_apiPersistProp testcommon_ts_ets_apiPersistProp0001 START');
      await Utils.sleep(2000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60230,
          priority: events_emitter.EventPriority.LOW
        }
        let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("common_ts_ets_apiPersistProp0001 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('Score').toString()).assertEqual("Score");
        }
        console.info("PersistProp0001 click result is: " + JSON.stringify(inspector.sendEventByKey('PersistPropText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("common_ts_ets_apiPersistProp0001 on events_emitter err : " + JSON.stringify(err));
      }
    });

    
    
    
    /**
     * @tc.number   testcommon_ts_ets_apiEnvProp_static_0001
     * @tc.name     testcommon_ts_ets_apiEnvProp_static_0001
     * @tc.desc     testcommon_ts_ets_apiEnvProp_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcommon_ts_ets_apiEnvProp_static_0001', Level.LEVEL0, async () => {
      console.info('common_ts_ets_apiEnvProp testcommon_ts_ets_apiEnvProp0001 START');
      await Utils.sleep(2000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60231,
          priority: events_emitter.EventPriority.LOW
        }
        let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("common_ts_ets_apiEnvProp0001 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('Result').toBoolean()).assertEqual(false);
        }
        console.info("EnvProp0001 click result is: " + JSON.stringify(inspector.sendEventByKey('EnvPropText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("common_ts_ets_apiEnvProp0001 on events_emitter err : " + JSON.stringify(err));
      }
    });

    
    
    
    /**
     * @tc.number   test_font_registerFont_static_0001
     * @tc.name     test_font_registerFont_static_0001
     * @tc.desc     test_font_registerFont_static_0001
     * @tc.level    Level.LEVEL0
     */
it('test_font_registerFont_static_0001', Level.LEVEL0, async () => {
      console.info('test_font_registerFont_0001 Register a customized font in the FontManagerSTART');
      await Utils.sleep(2000);
      let fontOptions: font.FontOptions = {
        familyName: "Italy",
        familySrc: "resource/base/Italy"
      }
      try {
        let font: Font = (AppStorage.get<UIContext>('uiContext') as UIContext).getFont();
        font.registerFont({
          familyName: 'Italy',
          familySrc: $rawfile('Italy.ttf')
        });

      } catch (err) {
        console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
        expect().assertFail();
      }
    });
  })
}
