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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function textJsunit() {


  describe('textTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Text state success " + JSON.stringify(pages));
        if (!("Text" == pages.name)) {
          console.info("get Text state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Text page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Text page error " + JSON.stringify(result));
      }
      await sleep(2)
    });

    afterEach(async () => {
      console.info("Text after each called")
      await sleep(1)
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0540
     * @tc.name textTest001
     * @tc.desc aceEtsTest
     */
    it('textTest001', 0, async () => {
      console.info('testGetInspectorByKey START');
      await sleep(2)
      let strJson = getInspectorByKey('Text');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Text')
      expect(JSON.parse(strJson).$attrs.width).assertEqual('100.000000vp')
      expect(JSON.parse(strJson).$attrs.padding).assertEqual('5.000000vp')
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1)
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.stringify(JSON.parse(strJson).$attrs.markAnchor)).assertEqual(JSON.stringify({
        x: "50.000000vp", y: "50.000000vp"
      }))
      expect(JSON.stringify(JSON.parse(strJson).$attrs.offset)).assertEqual(JSON.stringify({
        x: "50.000000vp", y: "50.000000vp"
      }))
      expect(JSON.parse(strJson).$attrs.flexGrow).assertEqual(5)
      expect(JSON.parse(strJson).$attrs.flexShrink).assertEqual(2)
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Auto")
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual("BorderStyle.Dashed")
      expect(JSON.parse(strJson).$attrs.borderRadius).assertEqual("10.000000vp")
      expect(JSON.parse(strJson).$attrs.borderWidth).assertEqual("4.000000px")
      expect(JSON.parse(strJson).$attrs.borderColor).assertEqual("#FF0000FF")
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FFFFC0CB")
      expect(JSON.parse(strJson).$attrs.enabled).assertEqual(false)
      expect(JSON.parse(strJson).$attrs.zIndex).assertEqual(1)
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF000000")
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Visible")
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("15")
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Bold")
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual("FontStyle.Italic")
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual("sans-serif")
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.End")
      expect(JSON.parse(strJson).$attrs.textOverflow).assertEqual("TextOverflow.Ellipsis")
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("15")
      expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual("0")
      expect(JSON.parse(strJson).$attrs.maxLines).assertEqual("2")
      expect(JSON.parse(strJson).$attrs.textCase).assertEqual("TextCase.Normal")
      expect(JSON.parse(strJson).$attrs.decoration).assertEqual(JSON.stringify({
        type: "TextDecorationType.Underline", color: "#FFFF0000"
      }))
      expect(JSON.parse(strJson).$attrs.direction).assertEqual("Direction.Auto")
      expect(JSON.parse(strJson).$attrs.aspectRatio).assertEqual(1)
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF000000")
      console.info('cd textInspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0550
     * @tc.name textTest002
     * @tc.desc aceEtsTest
     */
    it('textTest002', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text1 component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.direction).assertEqual("Direction.Ltr")
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Start")
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual("BorderStyle.Dotted")
      expect(JSON.parse(strJson).$attrs.enabled).assertEqual(true)
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Hidden")
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Normal")
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Start")
      expect(JSON.parse(strJson).$attrs.textOverflow).assertEqual("TextOverflow.Clip")
      expect(JSON.parse(strJson).$attrs.decoration).assertEqual(JSON.stringify({
        type: "TextDecorationType.LineThrough", color: "#FFFF0000"
      }))
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFFFFFFF")
      console.info('cd text1InspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0560
     * @tc.name textTest003
     * @tc.desc aceEtsTest
     */
    it('textTest003', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text2');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text2 component obj is: " + JSON.stringify(obj));

      expect(JSON.parse(strJson).$attrs.direction).assertEqual("Direction.Rtl")
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Center")
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual("BorderStyle.Solid")
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.None")
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Bolder")
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center")
      expect(JSON.parse(strJson).$attrs.textCase).assertEqual("TextCase.UpperCase")
      expect(JSON.parse(strJson).$attrs.decoration).assertEqual(JSON.stringify({
        type: "TextDecorationType.None", color: "#FFFF0000"
      }))
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF0000FF")
      console.info('cd text2InspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0570
     * @tc.name textTest004
     * @tc.desc aceEtsTest
     */
    it('textTest004', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text3');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text3 component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.End")
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Lighter")
      expect(JSON.parse(strJson).$attrs.decoration).assertEqual(JSON.stringify({
        type: "TextDecorationType.Overline", color: "#FFFF0000"
      }))
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF808080")
      console.info('cd text3InspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0580
     * @tc.name textTest005
     * @tc.desc aceEtsTest
     */
    it('textTest005', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text4');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text4 component obj is: " + JSON.stringify(obj));

      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Baseline")
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Medium")
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFA52A2A")
      console.info('cd text4InspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0590
     * @tc.name textTest006
     * @tc.desc aceEtsTest
     */
    it('textTest006', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text5');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text5 component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Stretch")
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Regular")
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF808080")
      console.info('cd text5InspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0600
     * @tc.name textTest007
     * @tc.desc aceEtsTest
     */
    it('textTest007', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text6');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text6 component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFFFA500")
      console.info('cd text6InspectorByKey END')
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0610
     * @tc.name textTest008
     * @tc.desc aceEtsTest
     */
    it('textTest008', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text7');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text7 component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFFFFF00")
      console.info('cd text7InspectorByKey END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0620
     * @tc.name textTest009
     * @tc.desc aceEtsTest
     */
    it('textTest009', 0, async () => {
      await sleep(2)
      let strJson = getInspectorByKey('Text8');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd text8 component obj is: " + JSON.stringify(obj));
      console.log("cd text8 align" + JSON.stringify(JSON.parse(strJson).$attrs.align));
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      console.info('cd text8InspectorByKey END');
    });
  })
}
