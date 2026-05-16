/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
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
import CommonFunc from '../../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter'
export default function GlobalPxNullUndefined() {
  describe('GlobalPxNullUndefined', () => {
    beforeEach(async (done:Function) =>{
      console.info("GlobalPxNullUndefined beforeEach start");
      let options:router.RouterOptions= {
        url: 'MainAbility/pages/global/GlobalPxNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GlobalPxNullUndefined state pages: " + JSON.stringify(pages));
        if (!("GlobalPxNullUndefined" == pages.name)) {
          console.info("get GlobalPxNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GlobalPxNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalPxNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   GlobalPxNullUndefined_0100
     * @tc.number GlobalPxNullUndefined_0100
     * @tc.desc   test vp2px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalPxNullUndefined_0100', Level.LEVEL0, async (done:Function) => {
      console.info('GlobalPxNullUndefined_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let defaultStrJson = getInspectorByKey('text7Id');
      let defauletobj: ESObject = JSON.parse(defaultStrJson);
      console.info('[GlobalPxNullUndefined_0100] content: ' + JSON.stringify(defauletobj.$attrs.rotate));
      let defaultCenterX: string = defauletobj.$attrs.rotate?.centerX;
      let defaultCenterY: string = defauletobj.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0100] default centerX: ' + defaultCenterX);
      console.info('[GlobalPxNullUndefined_0100] default centerY: ' + defaultCenterY);

      let strJson2 = getInspectorByKey('text5Id');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[GlobalPxNullUndefined_0100] content: ' + JSON.stringify(obj2.$attrs.rotate));
      let centerX: string = obj2.$attrs.rotate?.centerX;
      let centerY: string = obj2.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0100] centerX: ' + centerX);
      console.info('[GlobalPxNullUndefined_0100] centerY: ' + centerY);
      expect(defaultCenterX == centerX).assertTrue();
      expect(defaultCenterY == centerY).assertTrue();
      console.info('[GlobalPxNullUndefined_0100] END');
      done();
    })

    /**
     * @tc.name   GlobalPxNullUndefined_0200
     * @tc.number GlobalPxNullUndefined_0200
     * @tc.desc   test px2vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalPxNullUndefined_0200', Level.LEVEL0, async (done:Function) => {
      console.info('GlobalPxNullUndefined_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let defaultStrJson = getInspectorByKey('text7Id');
      let defauletobj: ESObject = JSON.parse(defaultStrJson);
      console.info('[GlobalPxNullUndefined_0200] content: ' + JSON.stringify(defauletobj.$attrs.rotate));
      let defaultCenterX: string = defauletobj.$attrs.rotate?.centerX;
      let defaultCenterY: string = defauletobj.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0200] default centerX: ' + defaultCenterX);
      console.info('[GlobalPxNullUndefined_0200] default centerY: ' + defaultCenterY);

      let strJson2 = getInspectorByKey('text6Id');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[GlobalPxNullUndefined_0200] content: ' + JSON.stringify(obj2.$attrs.rotate));
      let centerX: string = obj2.$attrs.rotate?.centerX;
      let centerY: string = obj2.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0200] centerX: ' + centerX);
      console.info('[GlobalPxNullUndefined_0200] centerY: ' + centerY);
      expect(defaultCenterX == centerX).assertTrue();
      expect(defaultCenterY == centerY).assertTrue();
      console.info('[GlobalPxNullUndefined_0200] END');
      done();
    })

    /**
     * @tc.name   GlobalPxNullUndefined_0300
     * @tc.number GlobalPxNullUndefined_0300
     * @tc.desc   test px2fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalPxNullUndefined_0300', Level.LEVEL0, async (done:Function) => {
      console.info('GlobalPxNullUndefined_0300 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let defaultStrJson = getInspectorByKey('text7Id');
      let defauletobj: ESObject = JSON.parse(defaultStrJson);
      console.info('[GlobalPxNullUndefined_0300] content: ' + JSON.stringify(defauletobj.$attrs.rotate));
      let defaultCenterX: string = defauletobj.$attrs.rotate?.centerX;
      let defaultCenterY: string = defauletobj.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0300] default centerX: ' + defaultCenterX);
      console.info('[GlobalPxNullUndefined_0300] default centerY: ' + defaultCenterY);

      let strJson2 = getInspectorByKey('text4Id');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[GlobalPxNullUndefined_0300] content: ' + JSON.stringify(obj2.$attrs.rotate));
      let centerX: string = obj2.$attrs.rotate?.centerX;
      let centerY: string = obj2.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0300] centerX: ' + centerX);
      console.info('[GlobalPxNullUndefined_0300] centerY: ' + centerY);
      expect(defaultCenterX == centerX).assertTrue();
      expect(defaultCenterY == centerY).assertTrue();
      console.info('[GlobalPxNullUndefined_0300] END');
      done();
    })

    /**
     * @tc.name   GlobalPxNullUndefined_0400
     * @tc.number GlobalPxNullUndefined_0400
     * @tc.desc   test fp2px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalPxNullUndefined_0400', Level.LEVEL0, async (done:Function) => {
      console.info('GlobalPxNullUndefined_0400 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let defaultStrJson = getInspectorByKey('text7Id');
      let defauletobj: ESObject = JSON.parse(defaultStrJson);
      console.info('[GlobalPxNullUndefined_0400] content: ' + JSON.stringify(defauletobj.$attrs.rotate));
      let defaultCenterX: string = defauletobj.$attrs.rotate?.centerX;
      let defaultCenterY: string = defauletobj.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0400] default centerX: ' + defaultCenterX);
      console.info('[GlobalPxNullUndefined_0400] default centerY: ' + defaultCenterY);

      let strJson2 = getInspectorByKey('text3Id');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[GlobalPxNullUndefined_0400] content: ' + JSON.stringify(obj2.$attrs.rotate));
      let centerX: string = obj2.$attrs.rotate?.centerX;
      let centerY: string = obj2.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0400] centerX: ' + centerX);
      console.info('[GlobalPxNullUndefined_0400] centerY: ' + centerY);
      expect(defaultCenterX == centerX).assertTrue();
      expect(defaultCenterY == centerY).assertTrue();
      console.info('[GlobalPxNullUndefined_0400] END');
      done();
    })

    /**
     * @tc.name   GlobalPxNullUndefined_0500
     * @tc.number GlobalPxNullUndefined_0500
     * @tc.desc   test px2lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalPxNullUndefined_0500', Level.LEVEL0, async (done:Function) => {
      console.info('GlobalPxNullUndefined_0500 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let defaultStrJson = getInspectorByKey('text7Id');
      let defauletobj: ESObject = JSON.parse(defaultStrJson);
      console.info('[GlobalPxNullUndefined_0500] content: ' + JSON.stringify(defauletobj.$attrs.rotate));
      let defaultCenterX: string = defauletobj.$attrs.rotate?.centerX;
      let defaultCenterY: string = defauletobj.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0500] default centerX: ' + defaultCenterX);
      console.info('[GlobalPxNullUndefined_0500] default centerY: ' + defaultCenterY);

      let strJson2 = getInspectorByKey('text2Id');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[GlobalPxNullUndefined_0500] content: ' + JSON.stringify(obj2.$attrs.rotate));
      let centerX: string = obj2.$attrs.rotate?.centerX;
      let centerY: string = obj2.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0500] centerX: ' + centerX);
      console.info('[GlobalPxNullUndefined_0500] centerY: ' + centerY);
      expect(defaultCenterX == centerX).assertTrue();
      expect(defaultCenterY == centerY).assertTrue();
      console.info('[GlobalPxNullUndefined_0500] END');
      done();
    })

    /**
     * @tc.name   GlobalPxNullUndefined_0600
     * @tc.number GlobalPxNullUndefined_0600
     * @tc.desc   test lpx2px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalPxNullUndefined_0600', Level.LEVEL0, async (done:Function) => {
      console.info('GlobalPxNullUndefined_0600 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let defaultStrJson = getInspectorByKey('text7Id');
      let defauletobj: ESObject = JSON.parse(defaultStrJson);
      console.info('[GlobalPxNullUndefined_0600] content: ' + JSON.stringify(defauletobj.$attrs.rotate));
      let defaultCenterX: string = defauletobj.$attrs.rotate?.centerX;
      let defaultCenterY: string = defauletobj.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0600] default centerX: ' + defaultCenterX);
      console.info('[GlobalPxNullUndefined_0600] default centerY: ' + defaultCenterY);

      let strJson2 = getInspectorByKey('text1Id');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[GlobalPxNullUndefined_0600] content: ' + JSON.stringify(obj2.$attrs.rotate));
      let centerX: string = obj2.$attrs.rotate?.centerX;
      let centerY: string = obj2.$attrs.rotate?.centerY;
      console.info('[GlobalPxNullUndefined_0600] centerX: ' + centerX);
      console.info('[GlobalPxNullUndefined_0600] centerY: ' + centerY);
      expect(defaultCenterX == centerX).assertTrue();
      expect(defaultCenterY == centerY).assertTrue();
      console.info('[GlobalPxNullUndefined_0600] END');
      done();
    })
  })
}