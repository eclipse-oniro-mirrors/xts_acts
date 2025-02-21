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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function textInputOnEditChangeJsunit() {
  describe('textInputOnEditChangeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/textInput',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInput state success " + JSON.stringify(pages));
        if (!("textInput" == pages.name)) {
          console.info("get textInput state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInput page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInput page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputOnEditChange after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtextInputOnEditChange0001
     * @tc.desic         acetextInputOnEditChangeEtsTest0001
     */
    it('testtextInputOnEditChange0001', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testtextInputOnEditChange0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtextInputOnEditChange0002
     * @tc.desic         acetextInputOnEditChangeEtsTest0002
     */
    it('testtextInputOnEditChange0002', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testtextInputOnEditChange0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtextInputOnEditChange0003
     * @tc.desic         acetextInputOnEditChangeEtsTest0003
     */
    it('testtextInputOnEditChange0003', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtextInputOnEditChange0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtextInputOnEditChange0004
     * @tc.desic         acetextInputOnEditChangeEtsTest0004
     */
    it('testtextInputOnEditChange0004', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testtextInputOnEditChange0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtextInputOnEditChange0005
     * @tc.desic         acetextInputOnEditChangeEtsTest0005
     */
    it('testtextInputOnEditChange0005', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextInputOnEditChange0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtextInputOnEditChange0006
     * @tc.desic         acetextInputOnEditChangeEtsTest0006
     */
    it('testtextInputOnEditChange0006', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextInputOnEditChange0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testtextInputOnEditChange0007
     * @tc.desic         acetextInputOnEditChangeEtsTest0007
     */
    it('testtextInputOnEditChange0007', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.lineHeight).assertEqual(undefined);
      console.info("[testtextInputOnEditChange0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtextInputOnEditChange0009
     * @tc.desic         acetextInputOnEditChangeEtsTest0009
     */
    it('testtextInputOnEditChange0009', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextInputOnEditChange0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtextInputOnEditChange0010
     * @tc.desic         acetextInputOnEditChangeEtsTest0010
     */
    it('testtextInputOnEditChange0010', 0, async function (done) {
      console.info('textInputOnEditChange testtextInputOnEditChange0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextInputOnEditChange0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    it('testtextInputCopyOption0001', 0, async function (done) {
      console.info('textInputCopyOption testtextInputCopyOption0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textInputCopyOptionText');
      console.info("[testtextInputCopyOption0001] component copyOption strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testtextInputCopyOption0001] copyOption value :" + obj.$attrs.copyOption);
      done();
    });

    it('testtextInputShowPasswordIcon0001', 0, async function (done) {
      console.info('textInputShowPasswordIcon testtextInputShowPasswordIcon0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showPasswordIconText');
      console.info("[testtextInputShowPasswordIcon0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.showPasswordIcon).assertTrue();
      console.info("[testtextInputShowPasswordIcon0001] showPasswordIcon value :" + obj.$attrs.showPasswordIcon);
      done();
    });
  })
}
