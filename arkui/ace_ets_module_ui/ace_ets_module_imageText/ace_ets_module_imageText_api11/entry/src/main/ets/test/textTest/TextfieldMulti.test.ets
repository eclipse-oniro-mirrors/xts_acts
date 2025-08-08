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
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function TextfieldMultiTest() {
  describe('TextfieldMultiTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextfieldMulti',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("TextfieldMulti" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done();
    });

    /*
     *@tc.number ArkUX_Text_Visual_0110
     *@tc.name   Support modifying the textfield cancelButton change of Textfield component
     *@tc.desc   Sets the cancelButton property parameter to different value
     */
    it('ArkUX_Text_Visual_0110', 0, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0110 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0110');
          console.info('ArkUX_Text_Visual_0110 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0110 obj is: " + JSON.stringify(obj));
          let cancelButton: ESObject = JSON.parse(obj.$attrs.cancelButton);
          let icon: ESObject = JSON.parse(cancelButton.icon);
          let style: ESObject = cancelButton.style;
          let size: ESObject = icon.size;
          let color: ESObject = icon.color;
          let src: ESObject = icon.src;
          expect(style).assertEqual(0);
          expect(size).assertEqual("45.00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FF0000FF");
          console.info('ArkUX_Text_Visual_0110 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /*
     *@tc.number ArkUX_Text_Visual_0120
     *@tc.name   Support modifying the textfield cancelButton change of Textfield component
     *@tc.desc   Sets the cancelButton property parameter to different value
     */
    it('ArkUX_Text_Visual_0120', 0, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0120 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0120');
          console.info('ArkUX_Text_Visual_0120 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0120 obj is: " + JSON.stringify(obj));
          let cancelButton: ESObject = JSON.parse(obj.$attrs.cancelButton);
          let icon: ESObject = JSON.parse(cancelButton.icon);
          let style: ESObject = cancelButton.style;
          let size: ESObject = icon.size;
          let color: ESObject = icon.color;
          let src: ESObject = icon.src;
          expect(style).assertEqual(1);
          expect(size).assertEqual("60.00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FF008000");
          console.info('ArkUX_Text_Visual_0120 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Text_Visual_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *@tc.number ArkUX_Text_Visual_0130
     *@tc.name   Support modifying the textfield cancelButton change of Textfield component
     *@tc.desc   Sets the cancelButton property parameter to different value
     */
    it('ArkUX_Text_Visual_0130', 0, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0130 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0130');
          console.info('ArkUX_Text_Visual_0130 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0130 obj is: " + JSON.stringify(obj));
          let cancelButton: ESObject = JSON.parse(obj.$attrs.cancelButton);
          let icon: ESObject = JSON.parse(cancelButton.icon);
          let style: ESObject = cancelButton.style;
          let size: ESObject = icon.size;
          let color: ESObject = icon.color;
          let src: ESObject = icon.src;
          expect(style).assertEqual(2);
          expect(size).assertEqual("70.00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Text_Visual_0130 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *@tc.number ArkUX_Text_Visual_0140
     *@tc.name   Support modifying the textfield cancelButton change of Textfield component
     *@tc.desc   Sets the cancelButton property parameter to default value
     */
    it('ArkUX_Text_Visual_0140', 0, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0140 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0140');
          console.info('ArkUX_Text_Visual_0140 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0140 obj is: " + JSON.stringify(obj));
          let cancelButton: ESObject = JSON.parse(obj.$attrs.cancelButton);
          let icon: ESObject = JSON.parse(cancelButton.icon);
          let style: ESObject = cancelButton.style;
          let size: ESObject = icon.size;
          let color: ESObject = icon.color;
          let src: ESObject = icon.src;
          expect(style).assertEqual(2);
		  let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_textfield_icon_size').id)
		  console.info("[TextInputPageJsunit_0200] size: " +px2vp(resourceSize));
          expect(size).assertEqual(Math.round(px2vp(resourceSize))+".00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FF000000");
          console.info('ArkUX_Text_Visual_0140 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0140 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
