/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import font from '@ohos.font'

export default function common_ts_ets_apiStaticClearJsunit() {
  describe('common_ts_ets_apiStaticClearTest', () => {
    beforeAll(async () => {
      console.info('flex beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/common_ts_ets_api',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get common_ts_ets_api state success ' + JSON.stringify(pages));
        if (!('common_ts_ets_api' == pages.name)) {
          console.info('get common_ts_ets_api state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push common_ts_ets_api page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push common_ts_ets_api page error: ' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('common_ts_ets_apiStaticClear after each called');
    });

    /**
     * @tc.name   testcommon_ts_ets_apiPersistProp0001
     * @tc.number testcommon_ts_ets_apiPersistProp0001
     * @tc.desc   acecommon_ts_ets_apiPersistPropEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommon_ts_ets_apiPersistProp0001', Level.LEVEL2, async () => {
      console.info('common_ts_ets_apiPersistProp testcommon_ts_ets_apiPersistProp0001 START');
      await Utils.sleep(2000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60230,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info('common_ts_ets_apiPersistProp0001 get event state result is: ' + JSON.stringify(eventData));
          expect(eventData.data?.Score).assertEqual('Score');
        }
        console.info('PersistProp0001 click result is: ' + JSON.stringify(sendEventByKey('PersistPropText', 10, '')));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info('common_ts_ets_apiPersistProp0001 on events_emitter err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testcommon_ts_ets_apiEnvProp0001
     * @tc.number testcommon_ts_ets_apiEnvProp0001
     * @tc.desc   acecommon_ts_ets_apiEnvPropEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testcommon_ts_ets_apiEnvProp0001', Level.LEVEL2, async () => {
      console.info('common_ts_ets_apiEnvProp testcommon_ts_ets_apiEnvProp0001 START');
      await Utils.sleep(2000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60231,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info('common_ts_ets_apiEnvProp0001 get event state result is: ' + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual(false);
        }
        console.info('EnvProp0001 click result is: ' + JSON.stringify(sendEventByKey('EnvPropText', 10, '')));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info('common_ts_ets_apiEnvProp0001 on events_emitter err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   test_font_registerFont_0001
     * @tc.number test_font_registerFont_0001
     * @tc.desc   Register a customized font in the FontManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_font_registerFont_0001', Level.LEVEL2, async () => {
      console.info('test_font_registerFont_0001 Register a customized font in the FontManagerSTART');
      await Utils.sleep(2000);
      let fontOptions: font.FontOptions = {
        familyName: 'Italy',
        familySrc: 'resource/base/Italy'
      }
      try {
        let result = font.registerFont(fontOptions);

      } catch (err) {
        console.info('test_font_registerFont_0001  err : ' + JSON.stringify(err));
        expect().assertFail();

      }
    });


  })
}
