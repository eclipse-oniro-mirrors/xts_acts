/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function textJsunit() {
  describe('textTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text state success " + JSON.stringify(pages));
        if (!("text" == pages.name)) {
          console.info("get text state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push text page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   textTest_0001
     * @tc.number textTest_0001
     * @tc.desc   set textAlign values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0001', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0001 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0001 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textAlign).assertEqual("TextAlign.Center")
      console.info('textTest_0001 END');
      done();
    });

    /**
     * @tc.name   textTest_0002
     * @tc.number textTest_0002
     * @tc.desc   set font values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0002', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0002 START');
      let strJsonNew = getInspectorByKey('text2');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0002 component is: " + JSON.stringify(objNew.$attrs));
      expect(JSON.parse(objNew.$attrs.font)?.size).assertEqual("12.00fp")
      expect(JSON.parse(objNew.$attrs.font)?.weight).assertEqual("FontWeight.Normal")
      console.info('textTest_0002 END');
      done();
    });

    /**
     * @tc.name   textTest_0003
     * @tc.number textTest_0003
     * @tc.desc   set lineHeight values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0003', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0003 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0003 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.lineHeight).assertEqual("20.00fp")
      console.info('textTest_0003 END');
      done();
    });

    /**
     * @tc.name   textTest_0004
     * @tc.number textTest_0004
     * @tc.desc   set fontColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0004', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0004 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0004 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontColor).assertEqual("#FF000000")
      console.info('textTest_0004 END');
      done();
    });

    /**
     * @tc.name   textTest_0005
     * @tc.number textTest_0005
     * @tc.desc   set textOverflow values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0005', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0005 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0005 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textOverflow).assertEqual("TextOverflow.None")
      console.info('textTest_0005 END');
      done();
    });

    /**
     * @tc.name   textTest_0006
     * @tc.number textTest_0006
     * @tc.desc   set fontSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0006', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0006 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0006 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontSize).assertEqual("10.00fp")
      console.info('textTest_0006 END');
      done();
    });

    /**
     * @tc.name   textTest_0007
     * @tc.number textTest_0007
     * @tc.desc   set maxLines values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0007', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0007 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0007 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.maxLines).assertEqual("10")
      console.info('textTest_0007 END');
      done();
    });

    /**
     * @tc.name   textTest_0008
     * @tc.number textTest_0008
     * @tc.desc   set textShadow values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0008', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0008 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0008 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textShadow.radius).assertEqual("10.000000")
      expect(objNew.$attrs.textShadow.color).assertEqual("#FF0000FF")
      expect(objNew.$attrs.textShadow.offsetX).assertEqual("50.000000")
      expect(objNew.$attrs.textShadow.offsetY).assertEqual("35.000000")
      expect(objNew.$attrs.textShadow.type).assertEqual("0")
      console.info('textTest_0008 END');
      done();
    });

    /**
     * @tc.name   textTest_0009
     * @tc.number textTest_0009
     * @tc.desc   set heightAdaptivePolicy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0009', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0009 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0009 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
      console.info('textTest_0009 END');
      done();
    });

    /**
     * @tc.name   textTest_0010
     * @tc.number textTest_0010
     * @tc.desc   set wordBreak values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0010 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0010 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.wordBreak).assertEqual("normal")
      console.info('textTest_0010 END');
      done();
    });

    /**
     * @tc.name   textTest_0011
     * @tc.number textTest_0011
     * @tc.desc   Set textCase values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0011', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0011 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0011 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textCase).assertEqual("TextCase.Normal")
      console.info('textTest_0011 END');
      done();
    });

    /**
     * @tc.name   textTest_0012
     * @tc.number textTest_0012
     * @tc.desc   set draggable values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0012', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0012 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0012 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.draggable).assertEqual(undefined)
      console.info('textTest_0012 END');
      done();
    });

    /**
     * @tc.name   textTest_0013
     * @tc.number textTest_0013
     * @tc.desc   set textIndent values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0013', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0013 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0013 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textIndent).assertEqual(undefined)
      console.info('textTest_0013 END');
      done();
    });

    /**
     * @tc.name   textTest_0014
     * @tc.number textTest_0014
     * @tc.desc   Set baselineOffset values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0014', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0014 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0014 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontStyle).assertEqual("FontStyle.Normal")
      console.info('textTest_0014 END');
      done();
    });

    /**
     * @tc.name   textTest_0015
     * @tc.number textTest_0015
     * @tc.desc   set copyOption values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0015', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0015 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0015 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.None")
      console.info('textTest_0015 END');
      done();
    });

    /**
     * @tc.name   textTest_0016
     * @tc.number textTest_0016
     * @tc.desc   set fontWeight values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0016', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0016 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0016 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontWeight).assertEqual("FontWeight.Lighter")
      console.info('textTest_0016 END');
      done();
    });

    /**
     * @tc.name   textTest_0017
     * @tc.number textTest_0017
     * @tc.desc   set fontFamily values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0017', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0017 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0017 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontFamily).assertEqual('fontFamily')
      console.info('textTest_0017 END');
      done();
    });

    /**
     * @tc.name   textTest_0018
     * @tc.number textTest_0018
     * @tc.desc   set minFontSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0018', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0018 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0018 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.minFontSize).assertEqual("5.00fp")
      console.info('textTest_0018 END');
      done();
    });

    /**
     * @tc.name   textTest_0019
     * @tc.number textTest_0019
     * @tc.desc   set decoration values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0019', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0019 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0019 component is: " + JSON.stringify(objNew.$attrs));
      expect(JSON.parse(objNew.$attrs.decoration)?.type).assertEqual("TextDecorationType.None")
      expect(JSON.parse(objNew.$attrs.decoration)?.color).assertEqual("#FF000000")
      console.info('textTest_0019 END');
      done();
    });

    /**
     * @tc.name   textTest_0020
     * @tc.number textTest_0020
     * @tc.desc   set maxFontSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0020 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0020 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.maxFontSize).assertEqual("30.00fp")
      console.info('textTest_0020 END');
      done();
    });

    /**
     * @tc.name   textTest_0021
     * @tc.number textTest_0021
     * @tc.desc   set letterSpacing values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0021', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_00061 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0021 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.letterSpacing).assertEqual("10.00fp")
      console.info('textTest_0021 END');
      done();
    });

    /**
     * @tc.name   textTest_0022
     * @tc.number textTest_0022
     * @tc.desc   Set baselineOffset values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0022', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0022 START');
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0022 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.baselineOffset).assertEqual("100")
      console.info('textTest_0022 END');
      done();
    });


    /**
     * @tc.name   textTest_0023
     * @tc.number textTest_0023
     * @tc.desc   Change wordBreak values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textTest_0023', Level.LEVEL0, async (done: Function) => {
      console.info('textTest_0023 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('text1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTest_0011 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.wordBreak).assertEqual("break-all")
      console.info('textTest_0011 END');
      done();
    });
  })
}