/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'

export default function ImageTextTest() {

  const SUITE = 'ImageText'
  describe('ImageTextTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "TestAbility/pages/ImageText",
      }

      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ImageText" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Image_Text_0100
     *tc.name   ImageSpan.verticalAlign(ImageSpanAlignment.BASELINE/CENTER/TOP/BOTTOM)
     *tc.desc   ImageSpan.verticalAlign(ImageSpanAlignment.BASELINE/CENTER/TOP/BOTTOM)
     */
    it('ArkUI_Image_Text_0100', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0100'
      console.info(`${SUITE} ${CASE} START`);

      let strJson1: string = getInspectorByKey('ImageText_ImageSpan1');
      expect(JSON.parse(strJson1).$attrs.verticalAlign.split('.')[1]).assertEqual('BASELINE')

      let strJson2: string  = getInspectorByKey('ImageText_ImageSpan2');
      expect(JSON.parse(strJson2).$attrs.verticalAlign.split('.')[1]).assertEqual('CENTER')

      let strJson3: string  = getInspectorByKey('ImageText_ImageSpan3');
      expect(JSON.parse(strJson3).$attrs.verticalAlign.split('.')[1]).assertEqual('TOP')

      let strJson4: string  = getInspectorByKey('ImageText_ImageSpan4');
      expect(JSON.parse(strJson4).$attrs.verticalAlign.split('.')[1]).assertEqual('BOTTOM')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0200
     *tc.name   ImageSpan.objectFit(Contain/Cover/Auto/Fill/ScaleDown/None)
     *tc.desc   ImageSpan.objectFit(Contain/Cover/Auto/Fill/ScaleDown/None)
     */
    it('ArkUI_Image_Text_0200', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0200'
      console.info(`${SUITE} ${CASE} START`);

      let strJson5: string = getInspectorByKey('ImageText_ImageSpan5');
      expect(JSON.parse(strJson5).$attrs.objectFit).assertEqual('ImageFit.Contain')

      let strJson6: string = getInspectorByKey('ImageText_ImageSpan6');
      expect(JSON.parse(strJson6).$attrs.objectFit).assertEqual('ImageFit.Cover')

      let strJson7: string = getInspectorByKey('ImageText_ImageSpan7');
      expect(JSON.parse(strJson7).$attrs.objectFit).assertEqual('ImageFit.Auto')

      let strJson8: string = getInspectorByKey('ImageText_ImageSpan8');
      expect(JSON.parse(strJson8).$attrs.objectFit).assertEqual('ImageFit.Fill')

      let strJson9: string = getInspectorByKey('ImageText_ImageSpan9');
      expect(JSON.parse(strJson9).$attrs.objectFit).assertEqual('ImageFit.ScaleDown')

      let strJson10: string = getInspectorByKey('ImageText_ImageSpan10');
      expect(JSON.parse(strJson10).$attrs.objectFit).assertEqual('ImageFit.None')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0300
     *tc.name   Text.textIndent
     *tc.desc   Text.textIndent
     */
    it('ArkUI_Image_Text_0300', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0300'
      console.info(`${SUITE} ${CASE} START`);

      let strJson: string = getInspectorByKey('ImageText_Text1');

      expect(JSON.parse(strJson).$attrs.textIndent).assertEqual(undefined)
      if (sendEventByKey('ImageText_Button1', 10, null)) {
        let strJson: string = getInspectorByKey('ImageText_Text1');

        expect(JSON.parse(strJson).$attrs.textIndent).assertEqual(undefined)
      }
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0400
     *tc.name   ImageSpan(null/undefined/'')
     *tc.desc   ImageSpan(null/undefined/'')
     */
    it('ArkUI_Image_Text_0400', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0400'
      console.info(`${SUITE} ${CASE} START`);

      let strJson12: string = getInspectorByKey('ImageText_ImageSpan12');
      expect(JSON.parse(strJson12).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson12).$attrs.width).assertEqual('276.00px')
      let strJson13: string = getInspectorByKey('ImageText_ImageSpan13');
      expect(JSON.parse(strJson13).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson13).$attrs.width).assertEqual('276.00px')
      let strJson14: string = getInspectorByKey('ImageText_ImageSpan14');
      expect(JSON.parse(strJson14).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson14).$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0500
     *tc.name   verticalAlign(null/undefined)
     *tc.desc   verticalAlign(null/undefined)
     */
    it('ArkUI_Image_Text_0500', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0500'
      console.info(`${SUITE} ${CASE} START`);

      let strJson15: string = getInspectorByKey('ImageText_ImageSpan15');
      expect(JSON.parse(strJson15).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson15).$attrs.width).assertEqual('276.00px')
      let strJson16: string = getInspectorByKey('ImageText_ImageSpan16');
      expect(JSON.parse(strJson16).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson16).$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0600
     *tc.name   objectFit(null/undefined)
     *tc.desc   objectFit(null/undefined)
     */
    it('ArkUI_Image_Text_0600', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0600'
      console.info(`${SUITE} ${CASE} START`);

      let strJson17: string = getInspectorByKey('ImageText_ImageSpan17');
      expect(JSON.parse(strJson17).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson17).$attrs.width).assertEqual('276.00px')
      let strJson18: string = getInspectorByKey('ImageText_ImageSpan18');
      expect(JSON.parse(strJson18).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson18).$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0700
     *tc.name   textIndent(null/undefined)
     *tc.desc   textIndent(null/undefined)
     */
    it('ArkUI_Image_Text_0700', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Image_Text_0700'
      console.info(`${SUITE} ${CASE} START`);

      let strJson19: string = getInspectorByKey('ImageText_ImageSpan19');
      expect(JSON.parse(strJson19).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson19).$attrs.width).assertEqual('276.00px')
      let strJson20: string = getInspectorByKey('ImageText_ImageSpan20');
      expect(JSON.parse(strJson20).$attrs.height).assertEqual('183.00px')
      expect(JSON.parse(strJson20).$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

  })
}
