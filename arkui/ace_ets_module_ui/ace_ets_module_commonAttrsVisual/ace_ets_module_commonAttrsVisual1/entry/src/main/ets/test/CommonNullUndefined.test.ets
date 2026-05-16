/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function CommonNullUndefined() {

  describe('CommonNullUndefined', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get commonNullUndefined state pages: ' + JSON.stringify(pages));
        if (!('CommonNullUndefined' == pages.name)) {
          console.info('get commonNullUndefined state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push commonNullUndefined success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push commonNullUndefined page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('commonNullUndefined after each called');
    });

    /**
     * @tc.number commonNullUndefined_0100
     * @tc.name commonNullUndefined_0100
     * @tc.desc test foregroundEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0100] default is: " + JSON.parse(strJson1)?.$attrs?.foregroundEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0100] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0100] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundEffect);
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.foregroundEffect))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.foregroundEffect));
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.foregroundEffect))
        .assertEqual(JSON.stringify(JSON.parse(strJson3)?.$attrs?.foregroundEffect));
      done();
    });

    /**
     * @tc.number commonNullUndefined_0200
     * @tc.name commonNullUndefined_0200
     * @tc.desc test visualEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0200] default is: " + JSON.parse(strJson1)?.$attrs?.visualEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0200] undefined is: " + JSON.parse(strJson2)?.$attrs?.visualEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0200] null is: " + JSON.parse(strJson3)?.$attrs?.visualEffect);
      expect(JSON.parse(strJson1)?.$attrs?.visualEffect)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.visualEffect);
      expect(JSON.parse(strJson1)?.$attrs?.visualEffect)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.visualEffect);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0300
     * @tc.name commonNullUndefined_0300
     * @tc.desc test backgroundFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0300', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0300] default is: " + JSON.parse(strJson1)?.$attrs?.backgroundFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0300] undefined is: " + JSON.parse(strJson2)?.$attrs?.backgroundFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0300] null is: " + JSON.parse(strJson3)?.$attrs?.backgroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.backgroundFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.backgroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.backgroundFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.backgroundFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0400
     * @tc.name commonNullUndefined_0400
     * @tc.desc test foregroundFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0400', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0400] default is: " + JSON.parse(strJson1)?.$attrs?.foregroundFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0400] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0400] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.foregroundFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.foregroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.foregroundFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.foregroundFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0500
     * @tc.name commonNullUndefined_0500
     * @tc.desc test compositingFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0500', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0500] default is: " + JSON.parse(strJson1)?.$attrs?.compositingFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0500] undefined is: " + JSON.parse(strJson2)?.$attrs?.compositingFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0500] null is: " + JSON.parse(strJson3)?.$attrs?.compositingFilter);
      expect(JSON.parse(strJson1)?.$attrs?.compositingFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.compositingFilter);
      expect(JSON.parse(strJson1)?.$attrs?.compositingFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.compositingFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0060
     * @tc.name commonNullUndefined_0060
     * @tc.desc test compositingFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0060', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0060 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0060] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0060] default is: " + JSON.parse(strJson1)?.$attrs?.materialFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0060] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0060] undefined is: " + JSON.parse(strJson2)?.$attrs?.materialFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0060] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0060] null is: " + JSON.parse(strJson3)?.$attrs?.materialFilter);
      expect(JSON.parse(strJson1)?.$attrs?.materialFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.materialFilter);
      expect(JSON.parse(strJson1)?.$attrs?.materialFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.materialFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0600
     * @tc.name commonNullUndefined_0600
     * @tc.desc test borderStyle
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0600] default is: " + JSON.parse(strJson1)?.$attrs?.borderStyle);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0600] undefined is: " + JSON.parse(strJson2)?.$attrs?.borderStyle);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0600] null is: " + JSON.parse(strJson3)?.$attrs?.borderStyle);
      expect(JSON.parse(strJson1)?.$attrs?.borderStyle)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.borderStyle);
      expect(JSON.parse(strJson1)?.$attrs?.borderStyle)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.borderStyle);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0700
     * @tc.name commonNullUndefined_0700
     * @tc.desc test borderRadius
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0700', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0700] default is: " + JSON.parse(strJson1)?.$attrs?.borderRadius);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0700] undefined is: " + JSON.parse(strJson2)?.$attrs?.borderRadius);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0700] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0700] null is: " + JSON.parse(strJson3)?.$attrs?.borderRadius);
      expect(JSON.parse(strJson3)?.$attrs?.borderRadius)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.borderRadius);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0800
     * @tc.name commonNullUndefined_0800
     * @tc.desc test outline
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0800', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0800] default is: " + JSON.parse(strJson1)?.$attrs?.outline);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0800] undefined is: " + JSON.parse(strJson2)?.$attrs?.outline);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0800] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0800] null is: " + JSON.parse(strJson3)?.$attrs?.outline);
      expect(JSON.parse(JSON.parse(strJson1)?.$attrs?.outline).style)
        .assertEqual(JSON.parse(JSON.parse(strJson2)?.$attrs?.outline).style);
      expect(JSON.parse(JSON.parse(strJson1)?.$attrs?.outline).style)
        .assertEqual(JSON.parse(JSON.parse(strJson3)?.$attrs?.outline).style);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0900
     * @tc.name commonNullUndefined_0900
     * @tc.desc test outlineStyle
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0900', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0900] default is: " + JSON.parse(strJson1)?.$attrs?.outlineStyle);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0900] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineStyle);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0900] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0900] null is: " + JSON.parse(strJson3)?.$attrs?.outlineStyle);
      expect(JSON.parse(strJson1)?.$attrs?.outlineStyle)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineStyle);
      expect(JSON.parse(strJson1)?.$attrs?.outlineStyle)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outlineStyle);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1000
     * @tc.name commonNullUndefined_1000
     * @tc.desc test outlineWidth
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1000', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1000] default is: " + JSON.parse(strJson1)?.$attrs?.outlineWidth);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1000] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineWidth);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1000] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1000] null is: " + JSON.parse(strJson3)?.$attrs?.outlineWidth);
      expect(JSON.parse(strJson3)?.$attrs?.outlineWidth)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineWidth);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1100
     * @tc.name commonNullUndefined_1100
     * @tc.desc test outlineWidth
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1100] default is: " + JSON.parse(strJson1)?.$attrs?.outlineColor);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1100] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineColor);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1100] null is: " + JSON.parse(strJson3)?.$attrs?.outlineColor);
      expect(JSON.parse(strJson1)?.$attrs?.outlineColor)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineColor);
      expect(JSON.parse(strJson1)?.$attrs?.outlineColor)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outlineColor);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1200
     * @tc.name commonNullUndefined_1200
     * @tc.desc test outlineRadius
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1200] default is: " + JSON.parse(strJson1)?.$attrs?.outlineRadius);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1200] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineRadius);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1200] null is: " + JSON.parse(strJson3)?.$attrs?.outlineRadius);
      expect(JSON.parse(strJson3)?.$attrs?.outlineRadius)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineRadius);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1300
     * @tc.name commonNullUndefined_1300
     * @tc.desc test foregroundColor
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1300', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1300] default is: " + JSON.parse(strJson1)?.$attrs?.foregroundColor);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1300] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundColor);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1300] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundColor);
      expect(JSON.parse(strJson2)?.$attrs?.foregroundColor)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.foregroundColor);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1400
     * @tc.name commonNullUndefined_1400
     * @tc.desc test foregroundColor
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1400', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1400] default is: " + JSON.parse(strJson1)?.$attrs?.transition);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1400] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundColor);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1400] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundColor);
      expect(JSON.parse(strJson3)?.$attrs?.foregroundColor)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.foregroundColor);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1500
     * @tc.name commonNullUndefined_1500
     * @tc.desc test motionBlur
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1500', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1500] default is: " + JSON.parse(strJson1)?.$attrs?.motionBlur);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1500] undefined is: " + JSON.parse(strJson2)?.$attrs?.motionBlur);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1500] null is: " + JSON.parse(strJson3)?.$attrs?.motionBlur);
      expect(JSON.parse(strJson1)?.$attrs?.motionBlur)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.motionBlur);
      expect(JSON.parse(strJson1)?.$attrs?.motionBlur)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.motionBlur);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1600
     * @tc.name commonNullUndefined_1600
     * @tc.desc test brightness
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1600] default is: " + JSON.parse(strJson1)?.$attrs?.brightness);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1600] undefined is: " + JSON.parse(strJson2)?.$attrs?.brightness);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1600] null is: " + JSON.parse(strJson3)?.$attrs?.brightness);
      expect(JSON.parse(strJson1)?.$attrs?.brightness)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.brightness);
      expect(JSON.parse(strJson1)?.$attrs?.brightness)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.brightness);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1700
     * @tc.name commonNullUndefined_1700
     * @tc.desc test contrast
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1700', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1700] default is: " + JSON.parse(strJson1)?.$attrs?.contrast);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1700] undefined is: " + JSON.parse(strJson2)?.$attrs?.contrast);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1700] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1700] null is: " + JSON.parse(strJson3)?.$attrs?.contrast);
      expect(JSON.parse(strJson1)?.$attrs?.contrast)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.contrast);
      expect(JSON.parse(strJson1)?.$attrs?.contrast)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.contrast);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1800
     * @tc.name commonNullUndefined_1800
     * @tc.desc test grayscale
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1800', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1800] default is: " + JSON.parse(strJson1)?.$attrs?.grayscale);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1800] undefined is: " + JSON.parse(strJson2)?.$attrs?.grayscale);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1800] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1800] null is: " + JSON.parse(strJson3)?.$attrs?.grayscale);
      expect(JSON.parse(strJson1)?.$attrs?.grayscale)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.grayscale);
      expect(JSON.parse(strJson1)?.$attrs?.grayscale)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.grayscale);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1900
     * @tc.name commonNullUndefined_1900
     * @tc.desc test colorBlend
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1900', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1900] default is: " + JSON.parse(strJson1)?.$attrs?.colorBlend);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1900] undefined is: " + JSON.parse(strJson2)?.$attrs?.colorBlend);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1900] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1900] null is: " + JSON.parse(strJson3)?.$attrs?.colorBlend);
      expect(JSON.parse(strJson3)?.$attrs?.colorBlend)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.colorBlend);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2000
     * @tc.name commonNullUndefined_2000
     * @tc.desc test saturate
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2000', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2000] default is: " + JSON.parse(strJson1)?.$attrs?.saturate);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2000] undefined is: " + JSON.parse(strJson2)?.$attrs?.saturate);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2000] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2000] null is: " + JSON.parse(strJson3)?.$attrs?.saturate);
      expect(JSON.parse(strJson1)?.$attrs?.saturate)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.saturate);
      expect(JSON.parse(strJson1)?.$attrs?.saturate)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.saturate);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2100
     * @tc.name commonNullUndefined_2100
     * @tc.desc test sepia
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2100] default is: " + JSON.parse(strJson1)?.$attrs?.sepia);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2100] undefined is: " + JSON.parse(strJson2)?.$attrs?.sepia);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2100] null is: " + JSON.parse(strJson3)?.$attrs?.sepia);
      expect(JSON.parse(strJson1)?.$attrs?.sepia)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.sepia);
      expect(JSON.parse(strJson1)?.$attrs?.sepia)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.sepia);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2200
     * @tc.name commonNullUndefined_2200
     * @tc.desc test invert
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2200] default is: " + JSON.parse(strJson1)?.$attrs?.invert);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2200] undefined is: " + JSON.parse(strJson2)?.$attrs?.invert);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2200] null is: " + JSON.parse(strJson3)?.$attrs?.invert);
      expect(JSON.parse(strJson3)?.$attrs?.invert)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.invert);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2300
     * @tc.name commonNullUndefined_2300
     * @tc.desc test hueRotate
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2300', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2300] default is: " + JSON.parse(strJson1)?.$attrs?.hueRotate);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2300] undefined is: " + JSON.parse(strJson2)?.$attrs?.hueRotate);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2300] null is: " + JSON.parse(strJson3)?.$attrs?.hueRotate);
      expect(JSON.parse(strJson1)?.$attrs?.hueRotate)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.hueRotate);
      expect(JSON.parse(strJson1)?.$attrs?.hueRotate)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.hueRotate);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2400
     * @tc.name commonNullUndefined_2400
     * @tc.desc test useShadowBatching
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2400', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2400] default is: " + JSON.parse(strJson1)?.$attrs?.useShadowBatching);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2400] undefined is: " + JSON.parse(strJson2)?.$attrs?.useShadowBatching);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2400] null is: " + JSON.parse(strJson3)?.$attrs?.useShadowBatching);
      expect(JSON.parse(strJson1)?.$attrs?.useShadowBatching)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.useShadowBatching);
      expect(JSON.parse(strJson1)?.$attrs?.useShadowBatching)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.useShadowBatching);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2500
     * @tc.name commonNullUndefined_2500
     * @tc.desc test useEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2500', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2500] default is: " + JSON.parse(strJson1)?.$attrs?.useEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2500] undefined is: " + JSON.parse(strJson2)?.$attrs?.useEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2500] null is: " + JSON.parse(strJson3)?.$attrs?.useEffect);
      expect(JSON.parse(strJson1)?.$attrs?.useEffect)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.useEffect);
      expect(JSON.parse(strJson1)?.$attrs?.useEffect)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.useEffect);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2600
     * @tc.name commonNullUndefined_2600
     * @tc.desc test renderGroup
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2600] default is: " + JSON.parse(strJson1)?.$attrs?.renderGroup);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2600] undefined is: " + JSON.parse(strJson2)?.$attrs?.renderGroup);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2600] null is: " + JSON.parse(strJson3)?.$attrs?.renderGroup);
      expect(JSON.parse(strJson1)?.$attrs?.renderGroup)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.renderGroup);
      expect(JSON.parse(strJson1)?.$attrs?.renderGroup)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.renderGroup);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2700
     * @tc.name commonNullUndefined_2700
     * @tc.desc test freeze
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2700', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2700] default is: " + JSON.parse(strJson1)?.$attrs?.freeze);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2700] undefined is: " + JSON.parse(strJson2)?.$attrs?.freeze);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2700] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2700] null is: " + JSON.parse(strJson3)?.$attrs?.freeze);
      expect(JSON.parse(strJson1)?.$attrs?.freeze)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.freeze);
      expect(JSON.parse(strJson1)?.$attrs?.freeze)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.freeze);
      done();
    });

    /**
     * @tc.number commonNullUndefined_2800
     * @tc.name commonNullUndefined_2800
     * @tc.desc test translate
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2800', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2800] default is: " + JSON.parse(strJson1)?.$attrs?.translate);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2800] undefined is: " + JSON.parse(strJson2)?.$attrs?.translate);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2800] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2800] null is: " + JSON.parse(strJson3)?.$attrs?.translate);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.translate))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.translate));
      done();
    });

    /**
     * @tc.number commonNullUndefined_2900
     * @tc.name commonNullUndefined_2900
     * @tc.desc test scale
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_2900', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_2900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_2900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_2900] default is: " + JSON.parse(strJson1)?.$attrs?.scale);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_2900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_2900] undefined is: " + JSON.parse(strJson2)?.$attrs?.scale);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_2900] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_2900] null is: " + JSON.parse(strJson3)?.$attrs?.scale);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.scale))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.scale));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3000
     * @tc.name commonNullUndefined_3000
     * @tc.desc test rotate
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3000', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3000] default is: " + JSON.parse(strJson1)?.$attrs?.rotate);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3000] undefined is: " + JSON.parse(strJson2)?.$attrs?.rotate);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3000] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3000] null is: " + JSON.parse(strJson3)?.$attrs?.rotate);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.rotate))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.rotate));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3100
     * @tc.name commonNullUndefined_3100
     * @tc.desc test transform
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3100] default is: " + JSON.parse(strJson1)?.$attrs?.transform);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3100] undefined is: " + JSON.parse(strJson2)?.$attrs?.transform);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3100] null is: " + JSON.parse(strJson3)?.$attrs?.transform);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.transform))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.transform));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3200
     * @tc.name commonNullUndefined_3200
     * @tc.desc test transform3D
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3200] default is: " + JSON.parse(strJson1)?.$attrs?.transform3D);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3200] undefined is: " + JSON.parse(strJson2)?.$attrs?.transform3D);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3200] null is: " + JSON.parse(strJson3)?.$attrs?.transform3D);
      expect(JSON.parse(strJson1)?.$attrs?.transform3D)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.transform3D);
      expect(JSON.parse(strJson1)?.$attrs?.transform3D)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.transform3D);
      done();
    });

    /**
     * @tc.number commonNullUndefined_3300
     * @tc.name commonNullUndefined_3300
     * @tc.desc test clickEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3300', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3300] default is: " + JSON.parse(strJson1)?.$attrs?.clickEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3300] undefined is: " + JSON.parse(strJson2)?.$attrs?.clickEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3300] null is: " + JSON.parse(strJson3)?.$attrs?.clickEffect);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.clickEffect))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.clickEffect));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3400
     * @tc.name commonNullUndefined_3400
     * @tc.desc test linearGradient
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3400', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3400] default is: " + JSON.parse(strJson1)?.$attrs?.linearGradient);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3400] undefined is: " + JSON.parse(strJson2)?.$attrs?.linearGradient);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3400] null is: " + JSON.parse(strJson3)?.$attrs?.linearGradient);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.linearGradient))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.linearGradient));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3500
     * @tc.name commonNullUndefined_3500
     * @tc.desc test sweepGradient
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3500', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3500] default is: " + JSON.parse(strJson1)?.$attrs?.sweepGradient);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3500] undefined is: " + JSON.parse(strJson2)?.$attrs?.sweepGradient);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3500] null is: " + JSON.parse(strJson3)?.$attrs?.sweepGradient);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.sweepGradient))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.sweepGradient));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3600
     * @tc.name commonNullUndefined_3600
     * @tc.desc test radialGradient
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3600] default is: " + JSON.parse(strJson1)?.$attrs?.radialGradient);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3600] undefined is: " + JSON.parse(strJson2)?.$attrs?.radialGradient);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3600] null is: " + JSON.parse(strJson3)?.$attrs?.radialGradient);
      expect(JSON.stringify(JSON.parse(strJson3)?.$attrs?.radialGradient))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.radialGradient));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3700
     * @tc.name commonNullUndefined_3700
     * @tc.desc test motionPath
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3700', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3700] default is: " + JSON.parse(strJson1)?.$attrs?.motionPath);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3700] undefined is: " + JSON.parse(strJson2)?.$attrs?.motionPath);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3700] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3700] null is: " + JSON.parse(strJson3)?.$attrs?.motionPath);
      expect(JSON.parse(strJson1)?.$attrs?.motionPath)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.motionPath);
      expect(JSON.parse(strJson1)?.$attrs?.motionPath)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.motionPath);
      done();
    });

    /**
     * @tc.number commonNullUndefined_3800
     * @tc.name commonNullUndefined_3800
     * @tc.desc test shadow
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3800', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3800] default is: " + JSON.parse(strJson1)?.$attrs?.shadow);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3800] undefined is: " + JSON.parse(strJson2)?.$attrs?.shadow);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3800] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3800] null is: " + JSON.parse(strJson3)?.$attrs?.shadow);
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.shadow))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.shadow));
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.shadow))
        .assertEqual(JSON.stringify(JSON.parse(strJson3)?.$attrs?.shadow));
      done();
    });

    /**
     * @tc.number commonNullUndefined_3900
     * @tc.name commonNullUndefined_3900
     * @tc.desc test blendMode
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_3900', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_3900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_3900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_3900] default is: " + JSON.parse(strJson1)?.$attrs?.blendMode);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_3900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_3900] undefined is: " + JSON.parse(strJson2)?.$attrs?.blendMode);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_3900] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_3900] null is: " + JSON.parse(strJson3)?.$attrs?.blendMode);
      expect(JSON.parse(strJson1)?.$attrs?.blendMode)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.blendMode);
      expect(JSON.parse(strJson1)?.$attrs?.blendMode)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.blendMode);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4000
     * @tc.name commonNullUndefined_4000
     * @tc.desc test clip
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4000', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4000] default is: " + JSON.parse(strJson1)?.$attrs?.clip);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4000] undefined is: " + JSON.parse(strJson2)?.$attrs?.clip);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4000] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4000] null is: " + JSON.parse(strJson3)?.$attrs?.clip);
      expect(JSON.parse(strJson1)?.$attrs?.clip)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.clip);
      expect(JSON.parse(strJson1)?.$attrs?.clip)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.clip);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4100
     * @tc.name commonNullUndefined_4100
     * @tc.desc test clipShape
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4100] default is: " + JSON.parse(strJson1)?.$attrs?.clipShape);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4100] undefined is: " + JSON.parse(strJson2)?.$attrs?.clipShape);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4100] null is: " + JSON.parse(strJson3)?.$attrs?.clipShape);
      expect(JSON.parse(strJson1)?.$attrs?.clipShape)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.clipShape);
      expect(JSON.parse(strJson1)?.$attrs?.clipShape)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.clipShape);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4200
     * @tc.name commonNullUndefined_4200
     * @tc.desc test mask
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4200] default is: " + JSON.parse(strJson1)?.$attrs?.mask);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4200] undefined is: " + JSON.parse(strJson2)?.$attrs?.mask);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4200] null is: " + JSON.parse(strJson3)?.$attrs?.mask);
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.mask))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.mask));
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.mask))
        .assertEqual(JSON.stringify(JSON.parse(strJson3)?.$attrs?.mask));
      done();
    });

    /**
     * @tc.number commonNullUndefined_4300
     * @tc.name commonNullUndefined_4300
     * @tc.desc test maskShape
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4300', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4300] default is: " + JSON.parse(strJson1)?.$attrs?.maskShape);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4300] undefined is: " + JSON.parse(strJson2)?.$attrs?.maskShape);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4300] null is: " + JSON.parse(strJson3)?.$attrs?.maskShape);
      expect(JSON.parse(strJson1)?.$attrs?.maskShape)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.maskShape);
      expect(JSON.parse(strJson1)?.$attrs?.maskShape)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.maskShape);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4400
     * @tc.name commonNullUndefined_4400
     * @tc.desc test sphericalEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4400', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4400] default is: " + JSON.parse(strJson1)?.$attrs?.sphericalEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4400] undefined is: " + JSON.parse(strJson2)?.$attrs?.sphericalEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4400] null is: " + JSON.parse(strJson3)?.$attrs?.sphericalEffect);
      expect(JSON.parse(strJson1)?.$attrs?.sphericalEffect)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.sphericalEffect);
      expect(JSON.parse(strJson1)?.$attrs?.sphericalEffect)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.sphericalEffect);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4500
     * @tc.name commonNullUndefined_4500
     * @tc.desc test lightUpEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4500', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4500] default is: " + JSON.parse(strJson1)?.$attrs?.lightUpEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4500] undefined is: " + JSON.parse(strJson2)?.$attrs?.lightUpEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4500] null is: " + JSON.parse(strJson3)?.$attrs?.lightUpEffect);
      expect(JSON.parse(strJson3)?.$attrs?.lightUpEffect)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.lightUpEffect);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4600
     * @tc.name commonNullUndefined_4600
     * @tc.desc test pixelStretchEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4600] default is: " + JSON.parse(strJson1)?.$attrs?.pixelStretchEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4600] undefined is: " + JSON.parse(strJson2)?.$attrs?.pixelStretchEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4600] null is: " + JSON.parse(strJson3)?.$attrs?.pixelStretchEffect);
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.pixelStretchEffect))
        .assertEqual(JSON.stringify(JSON.parse(strJson2)?.$attrs?.pixelStretchEffect));
      expect(JSON.stringify(JSON.parse(strJson1)?.$attrs?.pixelStretchEffect))
        .assertEqual(JSON.stringify(JSON.parse(strJson3)?.$attrs?.pixelStretchEffect));
      done();
    });

    /**
     * @tc.number commonNullUndefined_4700
     * @tc.name commonNullUndefined_4700
     * @tc.desc test renderFit
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4700', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4700] default is: " + JSON.parse(strJson1)?.$attrs?.renderFit);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4700] undefined is: " + JSON.parse(strJson2)?.$attrs?.renderFit);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4700] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4700] null is: " + JSON.parse(strJson3)?.$attrs?.renderFit);
      expect(JSON.parse(strJson1)?.$attrs?.renderFit)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.renderFit);
      expect(JSON.parse(strJson1)?.$attrs?.renderFit)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.renderFit);
      done();
    });

    /**
     * @tc.number commonNullUndefined_4800
     * @tc.name commonNullUndefined_4800
     * @tc.desc test backgroundBrightness
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_4800', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_4800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_4800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_4800] default is: " + JSON.parse(strJson1)?.$attrs?.backgroundBrightness);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_4800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_4800] undefined is: " + JSON.parse(strJson2)?.$attrs?.backgroundBrightness);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_4800] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_4800] null is: " + JSON.parse(strJson3)?.$attrs?.backgroundBrightness);
      expect(JSON.parse(strJson1)?.$attrs?.backgroundBrightness)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.backgroundBrightness);
      expect(JSON.parse(strJson1)?.$attrs?.backgroundBrightness)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.backgroundBrightness);
      done();
    });

  })
}
