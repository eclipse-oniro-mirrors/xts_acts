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

export default function textAreaOnCutJsunit() {
  describe('textAreaOnCutTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textArea6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea state success " + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textArea state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textArea page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaOnCut after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtextAreaOnCut0001
     * @tc.desic         acetextAreaOnCutEtsTest0001
     */
    it('testtextAreaOnCut0001', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testtextAreaOnCut0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtextAreaOnCut0002
     * @tc.desic         acetextAreaOnCutEtsTest0002
     */
    it('testtextAreaOnCut0002', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testtextAreaOnCut0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtextAreaOnCut0003
     * @tc.desic         acetextAreaOnCutEtsTest0003
     */
    it('testtextAreaOnCut0003', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtextAreaOnCut0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtextAreaOnCut0004
     * @tc.desic         acetextAreaOnCutEtsTest0004
     */
    it('testtextAreaOnCut0004', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0004 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextAreaOnCut0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtextAreaOnCut0005
     * @tc.desic         acetextAreaOnCutEtsTest0005
     */
    it('testtextAreaOnCut0005', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0005 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextAreaOnCut0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtextAreaOnCut0006
     * @tc.desic         acetextAreaOnCutEtsTest0006
     */
    it('testtextAreaOnCut0006', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0006 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextAreaOnCut0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtextAreaOnCut0009
     * @tc.desic         acetextAreaOnCutEtsTest0009
     */
    it('testtextAreaOnCut0009', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut009 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextAreaOnCut0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtextAreaOnCut0010
     * @tc.desic         acetextAreaOnCutEtsTest0010
     */
    it('testtextAreaOnCut0010', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0010 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextAreaOnCut0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testtextAreaOnCut0011
     * @tc.desic         acetextAreaOnCutEtsTest0011
     */
    it('testtextAreaCopyOption0011', Level.LEVEL1, async () => {
      console.info('textAreaCopyOption testtextAreaCopyOption0011 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('textAreaCopyOptionText');
      console.info("[testtextAreaCopyOption0011] component copyOption strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual('CopyOptions.None');
      console.info("[testtextAreaCopyOption0011] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);

    });
  })
}
