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

import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function AlphabetIndexerOnSelectJsunit() {
  describe('AlphabetIndexerOnSelectJsunit', () => {
    beforeAll(async () => {
      console.info('flex beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexer/alphabetIndexerAPI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get alphabetIndexer state success ' + JSON.stringify(pages));
        if (!('alphabetIndexerAPI' == pages.name)) {
          console.info('get alphabetIndexer state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push alphabetIndexer page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push alphabetIndexer page error: ' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('alphabetIndexerOnSelect after each called');
    });

    /**
     * @tc.name   testalphabetIndexerWidth0001
     * @tc.number testalphabetIndexerWidth0001
     * @tc.desc   testalphabetIndexerWidth0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerWidth0001', Level.LEVEL1, async () => {
      console.info('alphabetIndexerWidth testalphabetIndexerWidth0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerWidth0001] component width strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('100.00vp');
      console.info('[testalphabetIndexerWidth0001] width value :' + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testalphabetIndexerHeight0002
     * @tc.number testalphabetIndexerHeight0002
     * @tc.desc   testalphabetIndexerHeight0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerHeight0002', Level.LEVEL1, async () => {
      console.info('alphabetIndexerHeight testalphabetIndexerHeight0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerHeight0002] component height strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('300.00vp');
      console.info('[testalphabetIndexerHeight0002] height value :' + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testalphabetIndexerColor0003
     * @tc.number testalphabetIndexerColor0003
     * @tc.desc   testalphabetIndexerColor0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerColor0003', Level.LEVEL1, async () => {
      console.info('alphabetIndexerColor testalphabetIndexerColor0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerColor0003] component fontSize strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.color).assertEqual('#FFFF0000');
      console.info('[testalphabetIndexerColor0003] color value :' + JSON.parse(strJson).$attrs.color);

    });

    /**
     * @tc.name   testalphabetIndexerSelectedColor0004
     * @tc.number testalphabetIndexerSelectedColor0004
     * @tc.desc   testalphabetIndexerSelectedColor0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerSelectedColor0004', Level.LEVEL1, async () => {
      console.info('alphabetIndexerSelectedColor testalphabetIndexerSelectedColor0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerOnSelect0004] component opacity strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual('#FFFFFFFF');
      console.info('[testalphabetIndexerSelectedColor0004] selectedColor value :' + JSON.parse(strJson)
        .$attrs
        .selectedColor);

    });

    /**
     * @tc.name   testalphabetIndexerPopupColor0005
     * @tc.number testalphabetIndexerPopupColor0005
     * @tc.desc   testalphabetIndexerPopupColor0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerPopupColor0005', Level.LEVEL1, async () => {
      console.info('alphabetIndexerPopupColor testalphabetIndexerPopupColor0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerPopupColor0005] component align strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.popupColor).assertEqual('#FF48D1CC');
      console.info('[testalphabetIndexerPopupColor0005] popupColor value :' + JSON.parse(strJson).$attrs.popupColor);

    });

    /**
     * @tc.name   testalphabetIndexerSelectedBackgroundColor0006
     * @tc.number testalphabetIndexerSelectedBackgroundColor0006
     * @tc.desc   testalphabetIndexerSelectedBackgroundColor0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerSelectedBackgroundColor0006', Level.LEVEL1, async () => {
      console.info('alphabetIndexerSelectedBackgroundColor testalphabetIndexerSelectedBackgroundColor0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerSelectedBackgroundColor0006] component fontColor strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.selectedBackgroundColor).assertEqual('#FF0000E6');
      console.info('[testalphabetIndexerSelectedBackgroundColor0006] selectedBackgroundColor value :' + JSON.parse(strJson)
        .$attrs
        .selectedBackgroundColor);

    });

    /**
     * @tc.name   testalphabetIndexerPopupBackground0007
     * @tc.number testalphabetIndexerPopupBackground0007
     * @tc.desc   testalphabetIndexerPopupBackground0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerPopupBackground0007', Level.LEVEL1, async () => {
      console.info('alphabetIndexerPopupBackground testalphabetIndexerPopupBackground0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerPopupBackground0007] component lineHeight strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.popupBackground).assertEqual('#FF00DDDD');
      console.info('[testalphabetIndexerPopupBackground0007] popupBackground value :' + JSON.parse(strJson)
        .$attrs
        .popupBackground);

    });

    /**
     * @tc.name   testalphabetIndexerUsingPopup0009
     * @tc.number testalphabetIndexerUsingPopup0009
     * @tc.desc   testalphabetIndexerUsingPopup0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerUsingPopup0009', Level.LEVEL1, async () => {
      console.info('alphabetIndexerUsingPopup testalphabetIndexerUsingPopup009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerUsingPopup0009] component padding strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.usingPopup).assertEqual('true');
      console.info('[testalphabetIndexerUsingPopup0009] usingPopup value :' + JSON.parse(strJson).$attrs.usingPopup);

    });

    /**
     * @tc.name   testalphabetIndexerItemSize0010
     * @tc.number testalphabetIndexerItemSize0010
     * @tc.desc   testalphabetIndexerItemSize0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerItemSize0010', Level.LEVEL1, async () => {
      console.info('alphabetIndexerItemSize testalphabetIndexerItemSize0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerItemSize0010] component textAlign strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.itemSize).assertEqual('28.00vp');
      console.info('[testalphabetIndexerItemSize0010] itemSize value :' + JSON.parse(strJson).$attrs.itemSize);

    });

    /**
     * @tc.name   testalphabetIndexerAlignStyle0011
     * @tc.number testalphabetIndexerAlignStyle0011
     * @tc.desc   testalphabetIndexerAlignStyle0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerAlignStyle0011', Level.LEVEL1, async () => {
      console.info('alphabetIndexerAlignStyle testalphabetIndexerAlignStyle0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info('[testalphabetIndexerAlignStyle0011] component strJson:' + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(JSON.parse(strJson).$attrs.alignStyle).assertEqual('IndexerAlign.Left');
      console.info('[testalphabetIndexerItemSize0010] alignStyle value :' + JSON.parse(strJson).$attrs.alignStyle);

    });

    /**
     * @tc.name   testalphabetIndexerOnSelect0012
     * @tc.number testalphabetIndexerOnSelect0012
     * @tc.desc   testalphabetIndexerOnSelect0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testalphabetIndexerOnSelect0012', Level.LEVEL1, async () => {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0011 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info('onSelect_0012 get state result is: ' + JSON.stringify(indexEvent));
          expect(indexEvent.data?.STATUS).assertEqual(true);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60201,
          priority: events_emitter.EventPriority.LOW
        }
        sendEventByKey('alphabetIndexer', 10, '')
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info('onSelect_0012 on events_emitter err : ' + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60202,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info('onRequestPopupData_0012 get event state result is: ' + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(true);
        }
        console.info('onSelect_0012 click result is: ' + JSON.stringify(sendEventByKey('alphabetIndexer', 10, '')));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info('onRequestPopupData_0012 on events_emitter err : ' + JSON.stringify(err));
      }
      console.info('testalphabetIndexerOnSelect0012 END');


    });
  })
}
