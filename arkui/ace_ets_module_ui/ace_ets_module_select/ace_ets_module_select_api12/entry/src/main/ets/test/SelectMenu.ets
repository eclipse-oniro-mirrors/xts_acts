/*
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';

let emitKey = "emitUserAgent";

export default function selectmenuTest() {
  describe('ActsSelectMenuTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "TestAbility/pages/SelectMenu",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectMenu state success " + JSON.stringify(pages));
        if (!("SelectMenu" == pages.name)) {
          console.info("get SelectMenu state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push SelectMenu page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectMenu page error " + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0100
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0100
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest1');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0100]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0200
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0200
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.Center
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0200', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest2');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0200]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Center");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0300
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0300
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.End
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0300', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest3');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0300]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0400
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0400
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.Start,{dx:10,dy:10}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0400', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest4');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0400]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(10);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(10);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0500
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0500
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.Center,{dx:-10,dy:0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0500', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest5');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0500]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Center");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(-10);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0600
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0600
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.END,{dx:-20,dy:-50}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0600', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0600 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest6');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0600]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(-20);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(-50);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0700
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0700
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.END,{dx:0,dy:0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0700', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0700 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest7');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0700]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0800
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0800
     * @tc.desc   set MenuAlign property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0800', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0800 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest8');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0800]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_0900
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0900
     * @tc.desc   set MenuAlign property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0900', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0900 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest9');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0900]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_1000
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1000
     * @tc.desc   set MenuAlign property parameter to 'menuAlign'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1000', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1000 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest10');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1000]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_1100
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1100
     * @tc.desc   set MenuAlign property parameter to ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest11');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1100]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_1200
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1200
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1200', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest12');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1200]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_1300
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1300
     * @tc.desc   set MenuAlign property parameter to MenuAlignType.CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1300', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest13');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1300]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_1400
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1400
     * @tc.desc   set MenuAlign property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1400', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest14');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1400]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Center");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(-5);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(-5);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_Select_Menu_MenuAlign_1500
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1500
     * @tc.desc   menuAlign property parameter not set to obtain default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1500', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest15');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1500]:" + JSON.stringify(JSON.parse(strJson)
            .$attrs
            .menuAlign));
          expect(JSON.parse(strJson).$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dX).assertEqual(0);
          expect(JSON.parse(strJson)
            .$attrs
            .menuAlign
            .offset
            .dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
