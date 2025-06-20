/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'
import { Component, Driver, UiWindow, ON} from '@ohos.UiTest';
export default function animatorOnframeJsunit() {
  describe('animatorOnframeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/animator',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animator state success " + JSON.stringify(pages));
        if (!("animator" == pages.name)) {
          console.info("get animator state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push animator page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animator page error: " + err);
      }
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("animatorOnframe after each called");
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testanimatorOnframe0001
     * @tc.desic         aceanimatorOnframeEtsTest0001
     */
    it('testanimatorOnframe0001', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0001] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testanimatorOnframe0001] width value :" + JSON.parse(strJson).$attrs.width);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testanimatorOnframe0002
     * @tc.desic         aceanimatorOnframeEtsTest0002
     */
    it('testanimatorOnframe0002', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0002] component height strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testanimatorOnframe0002] height value :" + JSON.parse(strJson).$attrs.height);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testanimatorOnframe0003
     * @tc.desic         aceanimatorOnframeEtsTest0003
     */
    it('testanimatorOnframe0003', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0003 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0003] component fontSize strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testanimatorOnframe0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testanimatorOnframe0004
     * @tc.desic         aceanimatorOnframeEtsTest0004
     */
    it('testanimatorOnframe0004', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0004 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0004] component opacity strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testanimatorOnframe0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testanimatorOnframe0005
     * @tc.desic         aceanimatorOnframeEtsTest0005
     */
    it('testanimatorOnframe0005', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0005 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0005] component align strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testanimatorOnframe0005] align value :" + JSON.parse(strJson).$attrs.align);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testanimatorOnframe0006
     * @tc.desic         aceanimatorOnframeEtsTest0006
     */
    it('testanimatorOnframe0006', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0006 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0006] component fontColor strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testanimatorOnframe0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testanimatorOnframe0007
     * @tc.desic         aceanimatorOnframeEtsTest0007
     */
    it('testanimatorOnframe0007', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0007 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0007] component lineHeight strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testanimatorOnframe0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testanimatorOnframe0009
     * @tc.desic         aceanimatorOnframeEtsTest0009
     */
    it('testanimatorOnframe0009', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe009 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0009] component padding strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testanimatorOnframe0009] padding value :" + JSON.parse(strJson).$attrs.padding);
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testanimatorOnframe0010
     * @tc.desic         aceanimatorOnframeEtsTest0010
     */
    it('testanimatorOnframe0010', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0010 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0010] component textAlign strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testanimatorOnframe0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);
      done();
    });

    /*
     * @tc.number       testanimatorOnframe0011
     * @tc.name         testanimatorOnframe0011
     * @tc.desc         test animator OnFrame
     */
    it('testanimatorOnframe0011', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0011 START');
      await Utils.sleep(2000);

      let driver = Driver.create();
      await driver.delayMs(1000);
      let playBtn: Component = await driver.findComponent(ON.id('Play'));
      await playBtn.click()
      console.info('[testanimatorOnframe0011] playBtn click');
      await driver.delayMs(5000);

      let strJson3: string = getInspectorByKey('Test003');
      console.info('[testanimatorOnframe0011] strJson3: ' + JSON.parse(strJson3).$attrs.content);
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('250');
      done();
      
      console.info('testanimatorOnframe0011 END');
      done();  
    });

    /*
     * @tc.number       testanimatorOnframe012
     * @tc.name         testanimatorOnframe012
     * @tc.desc         test animator onRepeat
     */
    it('testanimatorOnframe012', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe0011 START');
      await Utils.sleep(2000);

      let strJson4: string = getInspectorByKey('Test004');
      console.info('[testanimatorOnframe012] strJson4: ' + JSON.parse(strJson4).$attrs.content);
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('animator-Test004:1');
      console.info('testanimatorOnframe012 END');
      done();  
    });

    /*
     * @tc.number       testanimatorOnframe013
     * @tc.name         testanimatorOnframe013
     * @tc.desic        test animator onCancel
     */
    it('testanimatorOnframe013', Level.LEVEL0, async (done: Function) => {
      console.info('animatorOnframe testanimatorOnframe013 START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let cancelBtn: Component = await driver.findComponent(ON.id('Cancel'));
      await cancelBtn.click()
      console.info('[testanimatorOnframe013] cancelBtn click');
      await driver.delayMs(2000);

      let strJson5: string = getInspectorByKey('Test005');
      console.info('[testanimatorOnframe013] strJson5: ' + JSON.parse(strJson5).$attrs.content);
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('animator-Test005:1');
      console.info('testanimatorOnframe013 END');
      done();
    });
  })
}