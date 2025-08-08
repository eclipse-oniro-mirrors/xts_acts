/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function MaxwidthTest() {
  describe('MaxwidthTest', () => {
    beforeEach(async (done: Function) => {
      console.info('MaxwidthTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Popup/Maxwidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MaxwidthTest state pages:' + JSON.stringify(pages));
        if (!('Maxwidth' == pages.name)) {
          console.info('get MaxwidthTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push MaxwidthTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MaxwidthTest page error:' + err);
      }
      console.info('MaxwidthTest beforeEach end');
      done();
    });
    /**
     * @tc.number: popup_maxWidth_0101
     * @tc.name  : popup_maxWidth_0101
     * @tc.desc  : Test the width of the maxwidth interface of the popup component when a custom normal value is passed in
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
    */
    it('popup_maxWidth_0101', 0, async (done: Function) => {
        console.info('popup_maxWidth_0101 START');
        await CommonFunc.sleep(1000);
        sendEventByKey('PopupApi1_btn1',10,"")
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0101 click after')
        let text = getInspectorByKey('PopupApi1_text1');
        expect(JSON.stringify(JSON.parse(text).$attrs.content)).assertEqual('\"300.00vp\"');
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0100 END');
        done();
      });
  
      /**
       * @tc.number: popup_maxWidth_0102
       * @tc.name  : popup_maxWidth_0102
       * @tc.desc  : Test the width of the maxwidth interface of the popup component when a custom normal value is passed in
       * @tc.level : Level 3
       * @tc.type
       * @tc.size
       */
      it('popup_maxWidth_0102', 0, async (done: Function) => {
        console.info('popup_maxWidth_0102 START');
        let driver = await Driver.create();
        await CommonFunc.sleep(1000);
        console.info("popup_maxWidth_0102 driver success");
        let size = await driver.getDisplaySize();
        console.info("popup_maxWidth_0102 size state:" + JSON.stringify(size.x));
        let displayWidth = px2vp(size.x);
        console.info("popup_maxWidth_0102 displayWidth state:" + JSON.stringify(displayWidth));
        sendEventByKey('PopupApi1_btn2',10,"");
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0102 click after');
        let text = getInspectorByKey('PopupApi1_text2');
        console.log('popup_maxWidth_0102 click after text' + text);
        if(displayWidth < 400) { 
          expect(JSON.stringify(JSON.parse(text).$attrs.content)).assertEqual(JSON.stringify(displayWidth.toFixed(2).toString() + 'vp'))
        }else {
          expect(JSON.stringify(JSON.parse(text)?.$attrs?.content)).assertEqual('\"400.00vp\"');
        }
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0102 END');
        done();
      });
  
      /**
       * @tc.number: popup_maxWidth_0103
       * @tc.name  : popup_maxWidth_0103
       * @tc.desc  : Test the width of the maxwidth interface of the popup component when a custom normal value is passed in
       * @tc.level : Level 3
       * @tc.type
       * @tc.size
       */
      it('popup_maxWidth_0103', 0, async (done: Function) => {
        console.info('popup_maxWidth_0103 START');
        let driver = await Driver.create();
        await CommonFunc.sleep(1000);
        console.info("popup_maxWidth_0103 driver success");
        let size = await driver.getDisplaySize();
        console.info("popup_maxWidth_0103 size state:" + JSON.stringify(size.x));
        let displayWidth = px2vp(size.x);
        console.info("popup_maxWidth_0103 displayWidth state:" + JSON.stringify(displayWidth));
        sendEventByKey('PopupApi1_btn3',10,"");
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0103 click after');
        let text = getInspectorByKey('PopupApi1_text3');
        if(displayWidth < 400) {
          expect(JSON.stringify(JSON.parse(text).$attrs.content)).assertEqual(JSON.stringify(displayWidth.toFixed(2).toString() + 'vp'))
        }else {
          expect(JSON.stringify(JSON.parse(text).$attrs.content)).assertEqual('\"400.00vp\"');
        }
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0103 END');
        done();
      });
    })
}
