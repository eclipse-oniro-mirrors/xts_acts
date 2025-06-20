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
        url: "MainAbility/pages/Select/SelectMenu",
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
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0100
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.Start
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest1');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0100]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0200
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.Center
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest2');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0200]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Center");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0300
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.End
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest3');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0300]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0400
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.Start,{dx:10,dy:10}
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest4');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0400]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(10);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(10);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0500
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.Center,{dx:-10,dy:0}
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest5');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0500]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Center");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(-10);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0600
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.END,{dx:-20,dy:-50}
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0600 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest6');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0600]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(-20);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(-50);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0700
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.END,{dx:0,dy:0}
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0700', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0700 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest7');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0700]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0800
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to null
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0800', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0800 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest8');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0800]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_0900
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to undefined
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_0900', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_0900 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest9');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_0900]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1000
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to 'menuAlign'
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1000', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1000 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest10');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1000]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1100
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to ''
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest11');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1100]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1200
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.CENTER
     *               and set MenuAlign property parameter to MenuAlignType.END again
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest12');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1200]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.End");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1300
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to MenuAlignType.CENTER
     *               and set MenuAlign property parameter to null
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest13');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1300]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1400
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc set MenuAlign property parameter to null
     *               and set MenuAlign property parameter to MenuAlignType.CENTER,{dx:-5,dy:-5}
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest14');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1400]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Center");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(-5);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(-5);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_Select_Menu_MenuAlign_1500
     * @tc.name Tests the MenuAlign property of the select and menu components
     * @tc.desc menuAlign property parameter not set to obtain default value
     */
    it('ArkUXII_Stage_Select_Menu_MenuAlign_1500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('selectTest15');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1500]:" + JSON.stringify(obj.$attrs.menuAlign));
          expect(obj.$attrs.menuAlign.alignType).assertEqual("MenuAlignType.Start");
          expect(obj.$attrs.menuAlign.offset.dX).assertEqual(0);
          expect(obj.$attrs.menuAlign.offset.dY).assertEqual(0);
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
