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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function textInputOnEditChangeJsunit() {
  describe('textInputOnEditChangeTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/textInput',
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
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputOnEditChange after each called");
    });

    /**
     * @tc.name   testtextInputOnEditChange0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testtextInputOnEditChange0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0001', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testtextInputOnEditChange0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testtextInputOnEditChange0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testtextInputOnEditChange0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0002', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testtextInputOnEditChange0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testtextInputOnEditChange0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testtextInputOnEditChange0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0003', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtextInputOnEditChange0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /**
     * @tc.name   testtextInputOnEditChange0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testtextInputOnEditChange0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0004', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextInputOnEditChange0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testtextInputOnEditChange0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testtextInputOnEditChange0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0005', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextInputOnEditChange0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /**
     * @tc.name   testtextInputOnEditChange0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testtextInputOnEditChange0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0006', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextInputOnEditChange0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /**
     * @tc.name   testtextInputOnEditChange0009
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   testtextInputOnEditChange0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0009', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextInputOnEditChange0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testtextInputOnEditChange0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testtextInputOnEditChange0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputOnEditChange0010', Level.LEVEL0, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextInputOnEditChange0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    /**
     * @tc.name   testtextInputCopyOption0001
     * @tc.number testtextInputCopyOption0001
     * @tc.desc   testtextInputCopyOption0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputCopyOption0001', Level.LEVEL0, async () => {
      console.info('textInputCopyOption testtextInputCopyOption0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textInputCopyOptionText');
      console.info("[testtextInputCopyOption0001] component copyOption strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testtextInputCopyOption0001] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);

    });

    /**
     * @tc.name   testtextInputShowPasswordIcon0001
     * @tc.number testtextInputShowPasswordIcon0001
     * @tc.desc   testtextInputShowPasswordIcon0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtextInputShowPasswordIcon0001', Level.LEVEL0, async () => {
      console.info('textInputShowPasswordIcon testtextInputShowPasswordIcon0001 START');
      await Utils.sleep(2000);
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
