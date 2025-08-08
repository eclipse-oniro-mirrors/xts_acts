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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import { resourceManager } from '@kit.LocalizationKit';

function alphabetDefaultPopupSize(sysWidth: Resource) {
  let resourcePopupSize = getContext().resourceManager.getNumber(sysWidth.id)
  let newPopupSize: string = Math.round(px2vp(resourcePopupSize)) + '.00vp'
  return newPopupSize;
}

function spliceBgColor(sysColor: Resource, sysColor1: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let resourceColor1 = getContext().resourceManager.getNumber(sysColor1.id)
  let numColor1 = Math.round(resourceColor1 * 255)
  console.info("resourceColor is: " + JSON.stringify(resourceColor.toString(16)));
  console.info("numColor1 is: " + JSON.stringify(numColor1));
  let newArgb: string = '#' + numColor1.toString(16).toUpperCase() + resourceColor.toString(16).toUpperCase().slice(2)
  return newArgb;
}

export default function outliersAlphabet() {
  describe('outliersAlphabet', () => {
    beforeEach(async (done: Function) => {
      console.info("outliersAlphabet beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/outliersAlphabet",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get outliersAlphabet state pages:" + JSON.stringify(pages));
        if (!("outliersAlphabet" == pages.name)) {
          console.info("get outliersAlphabet pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push outliersAlphabet page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push outliersAlphabet page error:" + err);
      }
      console.info("outliersAlphabet beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("outliersAlphabet after each called");
    });

    /**
     * @tc.number    outliersAlphabet_001
     * @tc.name      outliersAlphabet_0100
     * @tc.desc      Set the outlier of the AlphabetIndexer for selectedFont.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[outliersAlphabet_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[outliersAlphabet_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[outliersAlphabet_0100] selectedFont: " + JSON.stringify(JSON.parse(strJson).$attrs.selectedFont));
      console.info("[outliersAlphabet_0100] fontSize: " + JSON.stringify(JSON.parse(strJson).$attrs.selectedFont.fontSize));
      
      let defStrJson = getInspectorByKey('alphabetIndexer_def');
      console.info("[outliersAlphabet_0100] defStrJson is: " + JSON.stringify(JSON.parse(defStrJson)));
      console.info("[outliersAlphabet_0100] selectedFont: " + JSON.stringify(JSON.parse(defStrJson).$attrs.selectedFont));
      expect(JSON.parse(strJson).$attrs.selectedFont.fontSize).assertEqual(JSON.parse(defStrJson).$attrs.selectedFont.fontSize);
      console.info('[outliersAlphabet_0100] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_002
     * @tc.name      outliersAlphabet_0200
     * @tc.desc      Set the outlier of the AlphabetIndexer for popupFont.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[outliersAlphabet_0200] START');
      await CommonFunc.sleep(3000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('A'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[outliersAlphabet_0200] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[outliersAlphabet_0200] popupFont: " + JSON.stringify(JSON.parse(strJson).$attrs.popupFont));
      console.info("[outliersAlphabet_0200] fontSize: " + JSON.stringify(JSON.parse(strJson).$attrs.popupFont.fontSize));
      expect(JSON.parse(strJson).$attrs.popupFont.fontSize).assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      console.info('[outliersAlphabet_0200] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_003
     * @tc.name      outliersAlphabet_0300
     * @tc.desc      Set the outlier of the AlphabetIndexer for popupPosition.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[outliersAlphabet_0300] START');
      await CommonFunc.sleep(5000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('B'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[outliersAlphabet_0300] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[outliersAlphabet_0300] popupPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.popupPosition));
      console.info("[outliersAlphabet_0300] popupPositionX: " + JSON.stringify(JSON.parse(strJson).$attrs.popupPosition.popupPositionX));
      expect(JSON.parse(strJson).$attrs.popupPosition.popupPositionX).assertEqual("0.00px");
      console.info('[outliersAlphabet_0300] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_004
     * @tc.name      outliersAlphabet_0400
     * @tc.desc      Set the outlier of the AlphabetIndexer for selected.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[outliersAlphabet_0400] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_0400] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[outliersAlphabet_0400] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[outliersAlphabet_0400] selected: " + JSON.stringify(JSON.parse(strJson).$attrs.selected));
      expect(JSON.parse(strJson).$attrs.selected).assertEqual('0');
      console.info('[outliersAlphabet_0400] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_005
     * @tc.name      outliersAlphabet_0500
     * @tc.desc      Set the outlier of the AlphabetIndexer for selectedColor and selectedBackgroundColor.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[outliersAlphabet_0500] START');
      await CommonFunc.sleep(3000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('C'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_0500] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[outliersAlphabet_0500] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[outliersAlphabet_0500] selectedColor: " + JSON.stringify(JSON.parse(strJson).$attrs.selectedColor));
      console.info("[outliersAlphabet_0500] selectedBackgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.selectedBackgroundColor));
      expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual("#FFFFFFFF");
      expect(JSON.parse(strJson).$attrs.selectedBackgroundColor)
        .assertEqual(spliceBgColor($r('sys.color.ohos_id_color_text_highlight_bg'), $r('sys.float.ohos_id_alpha_normal_bg')));
      console.info('[outliersAlphabet_0500] END');
      done();
    });
  })
}
