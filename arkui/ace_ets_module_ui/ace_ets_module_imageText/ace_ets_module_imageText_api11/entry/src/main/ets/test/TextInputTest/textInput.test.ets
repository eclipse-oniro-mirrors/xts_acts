/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function textInputOnEditChangeJsunit() {
  describe('textInputOnEditChangeTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInput6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInput state success " + JSON.stringify(pages));
        if (!("textInput" == pages.name)) {
          console.info("get textInput state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInput page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInput page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputOnEditChange after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtextInputOnEditChange0001
     * @tc.desic         acetextInputOnEditChangeEtsTest0001
     */
    it('testtextInputOnEditChange0001', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testtextInputOnEditChange0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtextInputOnEditChange0002
     * @tc.desic         acetextInputOnEditChangeEtsTest0002
     */
    it('testtextInputOnEditChange0002', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testtextInputOnEditChange0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtextInputOnEditChange0003
     * @tc.desic         acetextInputOnEditChangeEtsTest0003
     */
    it('testtextInputOnEditChange0003', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtextInputOnEditChange0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtextInputOnEditChange0004
     * @tc.desic         acetextInputOnEditChangeEtsTest0004
     */
    it('testtextInputOnEditChange0004', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0004 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextInputOnEditChange0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtextInputOnEditChange0005
     * @tc.desic         acetextInputOnEditChangeEtsTest0005
     */
    it('testtextInputOnEditChange0005', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0005 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextInputOnEditChange0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtextInputOnEditChange0006
     * @tc.desic         acetextInputOnEditChangeEtsTest0006
     */
    it('testtextInputOnEditChange0006', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0006 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextInputOnEditChange0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtextInputOnEditChange0009
     * @tc.desic         acetextInputOnEditChangeEtsTest0009
     */
    it('testtextInputOnEditChange0009', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange009 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextInputOnEditChange0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtextInputOnEditChange0010
     * @tc.desic         acetextInputOnEditChangeEtsTest0010
     */
    it('testtextInputOnEditChange0010', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0010 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextInputOnEditChange0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    it('testtextInputCopyOption0001', Level.LEVEL1, async () => {
      console.info('textInputCopyOption testtextInputCopyOption0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('textInputCopyOptionText');
      console.info("[testtextInputCopyOption0001] component copyOption strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testtextInputCopyOption0001] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);

    });

    it('testtextInputShowPasswordIcon0001', Level.LEVEL1, async () => {
      console.info('textInputShowPasswordIcon testtextInputShowPasswordIcon0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('showPasswordIconText');
      console.info("[testtextInputShowPasswordIcon0001] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.showPasswordIcon).assertTrue();
      console.info("[testtextInputShowPasswordIcon0001] showPasswordIcon value :" + JSON.parse(strJson)
        .$attrs
        .showPasswordIcon);

    });
  })
}
