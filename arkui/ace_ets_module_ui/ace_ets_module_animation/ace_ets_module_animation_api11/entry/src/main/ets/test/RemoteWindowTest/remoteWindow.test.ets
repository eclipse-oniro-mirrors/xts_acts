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
export default function remoteWindowJsunit() {
  describe('remoteWindowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RemoteWindow/remoteWindow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get remoteWindow state success " + JSON.stringify(pages));
        if (!("remoteWindow" == pages.name)) {
          console.info("get RemoteWindow state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push remoteWindow page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push remoteWindow page error: " + err);
      }
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("remoteWindow after each called");
    });
    /**
     * @tc.name   testRemoteWindow0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testRemoteWindow0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0001', Level.LEVEL0, async (done: Function) => {
      console.info('remoteWindow testRemoteWindow0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0001] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('100.00vp');
      console.info("[testRemoteWindow0001] width value :" + JSON.parse(strJson).$attrs.width);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testRemoteWindow0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0002', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0002] component height strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('70.00vp');
      console.info("[testRemoteWindow0002] height value :" + JSON.parse(strJson).$attrs.height);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testRemoteWindow0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0003', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0003 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0003] component fontSize strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('20.00fp');
      console.info("[testRemoteWindow0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testRemoteWindow0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0004', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0004 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0004] component opacity strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testRemoteWindow0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testRemoteWindow0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0005', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0005 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0005] component align strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.align).assertEqual('Alignment.TopStart');
      console.info("[testRemoteWindow0005] align value :" + JSON.parse(strJson).$attrs.align);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testRemoteWindow0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0006', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0006 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0006] component fontColor strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FFCCCCCC');
      console.info("[testRemoteWindow0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   testRemoteWindow0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0007', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0007 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0007] component lineHeight strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual('25.00fp');
      console.info("[testRemoteWindow0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0009
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   testRemoteWindow0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0009', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow009 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0009] component padding strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual('10.00vp');
      console.info("[testRemoteWindow0009] padding value :" + JSON.parse(strJson).$attrs.padding);
      done();
    });
    /**
     * @tc.name   testRemoteWindow0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testRemoteWindow0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoteWindow0010', Level.LEVEL0, async (done: Function) => {
      console.info('RemoteWindow testRemoteWindow0010 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.info("[testRemoteWindow0010] component textAlign strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info("[testRemoteWindow0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);
      done();
    });
  })
}