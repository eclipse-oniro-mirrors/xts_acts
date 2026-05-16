/*
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

 import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextGetCharacter() {
  describe('TextGetCharacter', () => {
    beforeEach(async (done: Function) => {
      console.info("TextGetCharacter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextGetCharacter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextGetCharacter state pages:" + JSON.stringify(pages));
        if (!("TextGetCharacter" == pages.name)) {
          console.info("get TextGetCharacter pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextGetCharacter page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextGetCharacter page error:" + err);
      }
      console.info("TextGetCharacter beforeEach end");
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100
     * @tc.number SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100
     * @tc.desc   set Text: GlyphPositionAtCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('glyphPositionAtCoordinateButton'));
      await btn.click()
      await CommonFunc.sleep(500);
      let btn1 = await driver.findComponent(ON.id('AccessButton'));
      await btn1.click()
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('glyphPositionAtCoordinateText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100] GlyphPositionAtCoordinate : ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('glyphPositionAtCoordinate position: 0 affinity: 0');
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200
     * @tc.number SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200
     * @tc.desc   set Text: CharacterPositionAtCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('glyphPositionAtCoordinateButton'));
      await btn.click()
      await CommonFunc.sleep(500);
      let btn1 = await driver.findComponent(ON.id('AccessButton'));
      await btn1.click()
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('characterPositionAtCoordinateText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200] CharacterPositionAtCoordinate : ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('characterPositionAtCoordinate position: 0 affinity: 0');
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300
     * @tc.number SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300
     * @tc.desc   set Text: TextGetCharacter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('getCharacterButton'));
      await btn.click()
      await CommonFunc.sleep(500);
      let btn1 = await driver.findComponent(ON.id('AccessButton'));
      await btn1.click()
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('getGlyphText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300] TextGetCharacter : ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('getGlyph(入参字符,返回字型) 字型数 0 1getGlyph 实际字符数 0 3');

      await CommonFunc.sleep(500);
      let strJson1: string = getInspectorByKey('getCharacterText');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300] component obj1 is: ' + JSON.stringify(obj1));
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300] TextGetCharacter : ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('getCharacter(入参字型,返回字符) 字符数 0 3getCharacter 实际字型数 0 1');
      console.info('[SUB_ACE_ARKUI_TEXT_GETCHARACTER_0300] END');
      done();
    });
  })
}