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
        url: 'MainAbility/pages/TextAreaApi11/textArea6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea state success " + JSON.stringify(pages));
        if (!("textArea6" == pages.name)) {
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

    /**
     * @tc.name   testtextAreaOnCut0001
     * @tc.number testtextAreaOnCut0001
     * @tc.desc   acetextAreaOnCutEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0002
     * @tc.number testtextAreaOnCut0002
     * @tc.desc   acetextAreaOnCutEtsTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0003
     * @tc.number testtextAreaOnCut0003
     * @tc.desc   acetextAreaOnCutEtsTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0004
     * @tc.number testtextAreaOnCut0004
     * @tc.desc   acetextAreaOnCutEtsTest0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0005
     * @tc.number testtextAreaOnCut0005
     * @tc.desc   acetextAreaOnCutEtsTest0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0006
     * @tc.number testtextAreaOnCut0006
     * @tc.desc   acetextAreaOnCutEtsTest0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0009
     * @tc.number testtextAreaOnCut0009
     * @tc.desc   acetextAreaOnCutEtsTest0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaOnCut0010
     * @tc.number testtextAreaOnCut0010
     * @tc.desc   acetextAreaOnCutEtsTest0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testtextAreaCopyOption0011
     * @tc.number testtextAreaOnCut0011
     * @tc.desc   acetextAreaOnCutEtsTest0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
