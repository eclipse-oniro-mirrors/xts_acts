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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from '@ohos/hypium';
import router from '@system.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { ArcButtonStatus, ArcButtonStyleMode, ArcButtonPosition, LevelMode, promptAction } from '@kit.ArkUI';

interface optionsObj {
  uri: string
}

export default function ChipOnClose() {
  describe('ArcButtonClick', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ArcButton/ArcButtonClick',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcButtonClick state pages: " + JSON.stringify(pages));
        if (!("ArcButtonClick" == pages.name)) {
          console.info("get ArcButtonClick state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcButtonClick page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcButtonClick page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   ArkUX_Stage_ArcButton_ComponentTest_0100
     * @tc.number ArkUX_Stage_ArcButton_ComponentTest_0100
     * @tc.desc   verifyBaseFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcbutton01');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.styleMode));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.borderWidth));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.borderStyle));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.borderColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.align));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.alignSelf));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.borderWidth).assertEqual('5.00vp');
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Dashed');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFC0CB');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      expect(obj.$attrs.align).assertEqual('Alignment.Center');
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Baseline');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0100] END');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_ArcButton_ComponentTest_0200
     * @tc.number ArkUX_Stage_ArcButton_ComponentTest_0200
     * @tc.desc   verifyBaseFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcbutton02');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.borderWidth));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.borderStyle));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.borderColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.align));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.alignSelf));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Solid');
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000');
      expect(obj.$attrs.align).assertEqual('Alignment.TopStart');
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Auto');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0200] END');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_ArcButton_ComponentTest_0300
     * @tc.number ArkUX_Stage_ArcButton_ComponentTest_0300
     * @tc.desc   verifyBaseFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcbutton03');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.borderWidth));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.borderStyle));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.borderColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.align));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.alignSelf));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.borderWidth).assertEqual('0.00px');
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Solid');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.align).assertEqual('Alignment.Center');
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Auto');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0300] END');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_ArcButton_ComponentTest_0400
     * @tc.number ArkUX_Stage_ArcButton_ComponentTest_0400
     * @tc.desc   verifyBaseFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.text('arcbutton4'))
      await button.click()
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('白色风车'))
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0400] END');
      done();
    });

    /**
     * @tc.name   ArcButtonStyleMode_001
     * @tc.number ArcButtonStyleMode_001
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_001', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_001 START');
      expect(ArcButtonStyleMode.EMPHASIZED_LIGHT+'').assertEqual('0');
      console.info("[ArcButtonStyleMode_001] end");
      done();
    });
    /**
     * @tc.name   ArcButtonStyleMode_002
     * @tc.number ArcButtonStyleMode_002
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_002', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_002 START');
      expect(ArcButtonStyleMode.EMPHASIZED_DARK+'').assertEqual('1');
      console.info("[ArcButtonStyleMode_002] end");
      done();
    });
    /**
     * @tc.name   ArcButtonStyleMode_003
     * @tc.number ArcButtonStyleMode_003
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_003', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_003 START');
      expect(ArcButtonStyleMode.NORMAL_DARK+'').assertEqual('3');
      console.info("[ArcButtonStyleMode_003] end");
      done();
    });
    /**
     * @tc.name   ArcButtonStyleMode_004
     * @tc.number ArcButtonStyleMode_004
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_004', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_004 START');
      expect(ArcButtonStyleMode.CUSTOM+'').assertEqual('4');
      console.info("[ArcButtonStyleMode_004] end");
      done();
    });
    /**
     * @tc.name   ArcButtonStyleMode_005
     * @tc.number ArcButtonStyleMode_005
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_005', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_005 START');
      expect(ArcButtonStatus.NORMAL+'').assertEqual('0');
      console.info("[ArcButtonStyleMode_005] end");
      done();
    });
    /**
     * @tc.name   ArcButtonStyleMode_006
     * @tc.number ArcButtonStyleMode_006
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_006', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_006 START');
      expect(ArcButtonStatus.PRESSED+'').assertEqual('1');
      console.info("[ArcButtonStyleMode_006] end");
      done();
    });
    /**
     * @tc.name   ArcButtonStyleMode_007
     * @tc.number ArcButtonStyleMode_007
     * @tc.desc   ArcButtonStyleMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonStyleMode_007', Level.LEVEL3, async (done: Function) => {
      console.info('ArcButtonStyleMode_007 START');
      expect(ArcButtonStatus.DISABLED+'').assertEqual('2');
      console.info("[ArcButtonStyleMode_007] end");
      done();
    });
    /**
     * @tc.name   ArcButtonPosition_001
     * @tc.number ArcButtonPosition_001
     * @tc.desc   ArcButtonPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArcButtonPosition_001', Level.LEVEL0, async (done: Function) => {
      console.info('ArcButtonPosition_001 START');
      expect(ArcButtonPosition.BOTTOM_EDGE).assertEqual(1);
      console.info("[ArcButtonPosition_001] end");
      done();
    });
  })
}
